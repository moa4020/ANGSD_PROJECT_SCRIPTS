#!/bin/bash -l
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=STAR_alignReads
#SBATCH --time=10:00:00
#SBATCH --mem=40G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10

# Activate your environment
mamba activate angsd

IndexDir=/athena/angsd/scratch/moa4020/project/referenceGenome/GRCm38_STARindex

fastaDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq

outDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments

# Make a table with the sample name and paths to the 1st and 2nd mate

# Set the name of the output file
sample_table=sample_table.txt

> $sample_table

# Iterate over the fastq files in the directory
for file in ${fastaDir}/*_1.fastq.gz; do
  file1=$(basename ${file})
  sample=$(basename ${file%_1.fastq.gz})
  file2=${sample}_2.fastq.gz
  echo -e "${sample}\t${file1}\t${file2}" >> $sample_table
done

while read -r sample mate1 mate2
do 
	echo "Processing sample: $sample"
	STAR --runMode alignReads \
             --runThreadN 10 \
             --genomeDir $IndexDir \
             --readFilesIn $fastaDir/$mate1 $fastaDir/$mate2 \
             --readFilesCommand zcat \
             --outFileNamePrefix $outDir/"$sample." \
             --outSAMtype BAM SortedByCoordinate \
             --outSAMunmapped Within \
             --outSAMattributes All

done < $sample_table

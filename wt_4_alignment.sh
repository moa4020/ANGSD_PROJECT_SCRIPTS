#!/bin/bash -l
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

mate1=/athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq/wt_4_1.fastq.gz

mate2=/athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq/wt_4_2.fastq.gz

sample=wt_4

echo "Processing sample: $sample"
STAR --runMode alignReads \
     --runThreadN 10 \
     --genomeDir $IndexDir \
     --readFilesIn $mate1 $mate2 \
     --readFilesCommand zcat \
     --outFileNamePrefix $outDir/"$sample." \
     --outSAMtype BAM SortedByCoordinate \
     --outSAMunmapped Within \
     --outSAMattributes All

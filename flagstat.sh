#!/bin/bash -l
#SBATCH --job-name=STAR_flagstat
#SBATCH --output=/home/moa4020/angsd/project/scripts/stdout/STAR_flagstat_%j.out
#SBATCH --error=/home/moa4020/angsd/project/scripts/stderr/STAR_flagstat_%j.err
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
# Activate your environment
mamba activate angsd

outDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/STAR_alignments_it2/alignment_it2_files

# Iterate over the fastq files in the directory
for file in /athena/angsd/scratch/moa4020/project/GEO_Dataset/STAR_alignments_it2/alignment_it2_files/*/*.out.bam; do
  filename=$(basename ${file})
  foldername=$(echo $filename | cut -d ".it2" -f 1)
  samtools flagstat ${file} > ${outDir}/${foldername}/${filename}.flagstat.txt
  samtools stats ${file} > ${outDir}/${foldername}/${filename}.stats.txt  
  echo "$filename done"
done

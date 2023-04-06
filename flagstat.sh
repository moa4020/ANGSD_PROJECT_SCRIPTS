#!/bin/bash -l

#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL

# Activate your environment
mamba activate angsd

inputDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments

# Iterate over the fastq files in the directory
for file in /athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments/*.out.bam; do
	filename=$(basename ${file})
	samtools flagstat ${file} > ${filename}.flagstat.txt
	samtools stats ${file} > ${filename}.stats.txt
	echo "$filename done"
done



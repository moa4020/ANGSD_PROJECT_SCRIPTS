#!/bin/bash -l

#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=trim
#SBATCH --output=$MyScripts/stdout/trim_%j.out
#SBATCH --error=$MyScripts/stderr/trim_%j.err
#SBATCH --time=10:00:00
#SBATCH --mem=16G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

# activate your environment
mamba activate trim-galore

echo "Started running trimming"

trim_galore --illumina /athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq/wt_1_1.fastq.gz --output_dir /athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq/ --basename wt_1_1_trimmed

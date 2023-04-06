#!/bin/bash -l
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=fastqc
#SBATCH --output=$MyScripts/stdout/fastqc_%j.out
#SBATCH --error=$MyScripts/stderr/fastqc_%j.err
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10

# activate your environment
mamba activate angsd

echo "Started running fastqc"

fastqc /athena/angsd/scratch/moa4020/project/GEO_Dataset/fastq/*fastq.gz --extract --outdir /athena/angsd/scratch/moa4020/project/GEO_Dataset/fastqc --threads 10


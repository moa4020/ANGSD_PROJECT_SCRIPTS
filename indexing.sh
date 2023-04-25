#!/bin/bash -l
#SBATCH --job-name=STAR_genomeGenerate
#SBATCH --output=/home/moa4020/angsd/project/scripts/stdout/STAR_genomeGenerate_%j.out
#SBATCH --error=/home/moa4020/angsd/project/scripts/stderr/STAR_genomeGenerate_%j.err
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --time=10:00:00
#SBATCH --mem=40G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10

# activate your environment
mamba activate angsd

STAR --runMode genomeGenerate \
     --runThreadN 10 \
     --genomeDir /athena/angsd/scratch/moa4020/project/referenceGenome/GRCm38_STARindex \
     --genomeFastaFiles /athena/angsd/scratch/moa4020/project/referenceGenome/mm10/mm10.fa \
     --sjdbGTFfile /athena/angsd/scratch/moa4020/project/referenceGenome/mm10/mm10.ncbiRefSeq.gtf \
     --sjdbOverhang 149

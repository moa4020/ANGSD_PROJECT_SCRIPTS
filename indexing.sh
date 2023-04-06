#!/bin/bash -l

#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=STAR_genomeGenerate
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
     --sjdbGTFfile /athena/angsd/scratch/moa4020/project/referenceGenome/mm10/GRCm38.gtf \
     --sjdbOverhang 149



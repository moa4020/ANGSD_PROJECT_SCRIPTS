#!/bin/bash -l

#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10

# Activate your environment
mamba activate angsd

AnnotationFile=/athena/angsd/scratch/moa4020/project/referenceGenome/mm10/GRCm38.gtf

bamDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments

outDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments/featureCounts

featureCounts -p -t exon -T 10 -f -O -a $AnnotationFile -o counts.txt ${bamDir}/*.it2.Aligned.sortedByCoord.out.bam


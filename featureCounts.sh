#!/bin/bash -l
#SBATCH --job-name=featureCounts
#SBATCH --output=/home/moa4020/angsd/project/scripts/stdout/featureCounts_%j.out
#SBATCH --error=/home/moa4020/angsd/project/scripts/stderr/featureCounts_%j.err
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=15

# Activate your environment
mamba activate angsd

AnnotationFile=/athena/angsd/scratch/moa4020/project/referenceGenome/mm10/mm10.ncbiRefSeq.gtf

bamDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/STAR_alignments_it2/alignment_it2_files/*

outDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/STAR_alignments_it2/featureCounts

featureCounts -p -g gene_id -t exon --countReadPairs -T 10 -a $AnnotationFile -o ${outDir}/Counts.txt ${bamDir}/*.it2.Aligned.sortedByCoord.out.bam

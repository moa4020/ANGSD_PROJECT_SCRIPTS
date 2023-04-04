#!/bin/bash -l
#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --time=10:00:00
#SBATCH --mem=40G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
 
mamba activate rseqc

bamDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments

bedFile=/athena/angsd/scratch/moa4020/project/referenceGenome/mm10/GRCm38.bed

outDir=/athena/angsd/scratch/moa4020/project/GEO_Dataset/alignments/rseqc

# Iterate over the bam files in the directory
for file in ${bamDir}/*.it2.Aligned.sortedByCoord.out.bam; do
	filename=$(basename ${file})
	read_distribution.py -i $file -r $bedFile > ${outDir}/${filename}rseqc_read_distribution.out
	geneBody_coverage.py -i $file -r $bedFile -o ${outDir}/${filename}rseqc_geneBodyCoverage.txt
done

#!/bin/bash

#SBATCH --mail-user=moa4020@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=5

sed '1d' ftp_links.txt > links.txt

while read line; do
  links=$(echo "$line" | cut -f 2)
  url=$(echo "$links" | cut -d';' -f1)
  sample_name=$(echo "$line" | cut -f 3)
  echo "Downloading $url"
  wget "$url" -O "${sample_name}_1.fastq.gz"
done < links.txt

while read line; do 
  links=$(echo "$line" | cut -f 2)
  url=$(echo "$links" | cut -d';' -f2)
  sample_name=$(echo "$line" | cut -f 3)
  echo "Downloading $url"
  wget "$url" -O "${sample_name}_2.fastq.gz"
done < links.txt

rm links.txt

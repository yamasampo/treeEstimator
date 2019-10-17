#!/usr/local/bin/zsh

input_fasta=$1
echo "$input_fasta"
outdir=./output_dir

# Make output directory
fname=`basename $input_fasta`
echo "$fname"
subdirname="$(cut -d'.' -f1 <<<"$fname")"
dirname="$outdir/$subdirname"
mkdir "$dirname"

# Convert FASTA to PhyLip format
python fasta2phylip.py "$input_fasta" "$dirname/dna.phy"

# Run RaxML
cd "$dirname"
raxmlHPC -m GTRGAMMA -p 12345 "-#" 20 -s dna.phy -n t1
raxmlHPC -m GTRGAMMA -p 12345 -x 12345 "-#" 1000 -s dna.phy -n t2

raxmlHPC -m GTRGAMMA -p 12345 -f b -t RAxML_bestTree.t1 -z RAxML_bootstrap.t2 -n t3

cd ../

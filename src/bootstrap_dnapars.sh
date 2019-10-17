#!/usr/local/bin/zsh

## Commands to run dnapars with bootstrapped data

# Specify virtual environment for BioPython
source activate biopython

# Make output directory
fasta=$1
outdir=$2

fname=`basename $fasta`
subdir="$(cut -d'.' -f1 <<<"$fname")"
dirname="$outdir/$subdir"
mkdir "$dirname"

echo "Input FASTA: $fasta"
echo "Output directory: $dirname"

# Convert FASTA to Phylip format
python ./fasta2phylip.py "$fasta" "infile_seqboot.phy"

# Bootstrap an alignment
seqboot < seqboot.ctl
# mv infile infile_seqboot
mv outfile outfile_seqboot

# Infer tree for bootstrap data
dnapars < dnapars.ctl

mv outfile outfile_dnapars
mv outtree outtree_dnapars

# Find consensus tree
consense < consense.ctl

mv outfile outfile_consense
mv outtree outtree_consense

# Move data into sub directory
cp $fasta "$dirname"
mv infile_seqboot.phy "$dirname"
mv out* "$dirname"

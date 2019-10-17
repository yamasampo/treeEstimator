#!/usr/local/bin/zsh

indir=$1
outdir=$2
jobs=$3 # Number of threads

# Check command
# find $indir -type f -name "*.cod.aln" -maxdepth 1 | parallel -a - --dry-run ./bootstrap.sh

mkdir ./output_dir
find $indir -type f -name "*.cod.aln" -maxdepth 1 | parallel -a - --jobs $jobs ./bootstrap.sh

mv ./output_dir "$outdir"


# run.sh for dnapars
# indir=$1
# outdir=$2

# for fpath in `find $indir -type f -name "*.fna.aln" -maxdepth 1`;
# do
#     ./bootstrap_dnapars.sh "$fpath" "$outdir"

#     done

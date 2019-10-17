# treeEstimator

Wraps the existing tree estimation programs such as dnapars (from Phylip) and RAxML. Please let me know if you know any good tree estimation program not supported in this package.

## Dependencies

- seqboot (Phylip)
  - For generating bootstrap dataset
- dnapars (Phylip)
  - For parsimoneous estimation
- raxmlHPC (RAxML)
  - For likelihood base estimation
- BioPython
  - For converting FASTA formatted sequence alignment to Phylip format

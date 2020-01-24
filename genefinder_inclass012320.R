bps <- c("A", "G", "T","C")
dna <- sample(bps, 500, replace=T)

# 1 Find positions of A

ii <- which(dna == "A") # ii is positions of A

# Look at next door neighbor 

dna[ii+1]

# Is next door neighbor a T?

pp <- dna[ii+1] == "T"

# Look at next next door neighbor

dna[ii+2]

# Is next next door neighbor a G?

vv <- dna[ii+2] == "G"


# Are all three true? (ATG)

pp & vv  # pp and vv are which of Aʻs are followed by T and G (logical)

# Where in the DNA do the ATGs occur?

starts <- ii[ pp&vv ] # position of the starts
starts <- ii[ dna[ii+1]=="T" & dna[ii+2]=="G" ] # same - matter of personal preference

## Write a function that finds any specified codon 
## arguments could include the bp1, bp2, bp3 for start, stop, etc.





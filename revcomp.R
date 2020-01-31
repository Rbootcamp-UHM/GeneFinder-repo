reverse <- dna[500:1]
reverse
reverseT <- replace(reverse, reverse=="A", "T")
reverseA <- replace(reverseT, reverse=="T", "A")
reverseC <- replace(reverseA, reverse=="C", "G")
reverseG <- replace(reverseC, reverse=="G", "C")
revcomp <- reverseG

revcomp 

pos_revcomp <- cbind(rep(c(1,2,3), 167))
pos_revcomp
pos_revcomp <- c(pos_revcomp[1:500])
pos_revcomp
length(pos_revcomp)

pos_rc_dna <- data.frame(revcomp, pos_revcomp)
names(pos_rc_dna) <- c("dna", "pos")
head(pos_rc_dna)

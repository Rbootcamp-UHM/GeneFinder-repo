#This finds all start codons in ORF 1
orf3 <- function(dna=dna, pos=pos_dna) {
	i <- which(c(pos_dna$dna =="A" & pos_dna$pos == 3))
	i
	a <- dna[i+1] == "T"#Look at the next door neighbor. Is next door neighbor T?
	b <- dna[i+2] == "G" #Is the next next door neighbor G?
	start_pos <- a & b #which of the A's are followed by T and G
	start_pos <- i[a & b] #Where in the DNA do the ATG's occur
	start_pos

	#This finds all the stops in ORF1
	j <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
	d <- dna[j+1] == "A"
	e <- dna[j+2] == "A"
	stop1_pos <- d & e
	stop1_pos <- j[d & e]
	stop1_pos

	jj <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
	dd <- dna[jj+1] == "G"
	ee <- dna[jj+2] == "A"
	stop2_pos <- jj[dd & ee] #Where in the DNA do the ATG's occur
	stop2_pos

	jjj <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
	ddd <- dna[jjj+1] == "A"
	eee <- dna[jjj+2] == "G"
	stop3_pos <- jjj[ddd & eee] #Where in the DNA do the ATG's occur
	stop3_pos

	start1 <- min(start_pos, na.rm=T)
	end1 <- min(stop1_pos, na.rm=T)
	end2 <- min(stop2_pos, na.rm=T)
	end3 <- min(stop3_pos, na.rm=T)

	seee <- c(start1, end1, end2, end3)
	return(seee)
}



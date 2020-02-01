#This finds all start codons in ORF 4
orf4 <- function(dna=revcomp, pos=pos_rc_dna) {
	r <- which(c(pos_rc_dna$dna =="A" & pos_rc_dna$pos == 1))
	s <- revcomp[r+1] == "T"
	u <- revcomp[r+2] == "G"
	start_pos <- r[s & u]
	start_pos

	#This finds all the stops in ORF4
	v <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
	w <- revcomp[v+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
	z <- revcomp[v+2] == "A" #Is the next next door neightbor G?
	stop1_pos <- v[w & z]
	stop1_pos

	vv <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
	ww <- revcomp[vv+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
	zz <- revcomp[vv+2] == "G" #Is the next next door neightbor G?
	stop2_pos <- vv[ww & zz]
	stop2_pos

	vvv <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
	www <- revcomp[vvv+1] == "G"#Look at the next door neighbor. Is next door neighbor T?
	zzz <- revcomp[vvv+2] == "A" #Is the next next door neightbor G?
	stop3_pos <- vvv[www & zzz]
	stop3_pos
	
	start1 <- min(start_pos, na.rm=T)
	end1 <- min(stop1_pos, na.rm=T)
	end2 <- min(stop2_pos, na.rm=T)
	end3 <- min(stop3_pos, na.rm=T)

	seee <- c(start1, end1, end2, end3)
	seee[which(!is.finite(seee))] <- 0
	return(seee)
}


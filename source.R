###THIS IS THE SCRIPT THAT ACTUALLY FINDS THE ORF'S###

#setwd("C:/Users/hille/Documents/Rbootcamp_S2020/GeneFinder-repo")
dna <- read.csv("sampleDNA.csv")
dna <- as.vector(dna$Nucleotides)

#This will create 3 vectors that will represent each reading frame
pos <- cbind(rep(c(1,2,3), 167))
pos <- c(pos[1:500])

#This combines the vectors in the reading frame
pos_dna <- data.frame(dna, pos)

openreadingframe <- function(orf=dna, pos=pos_dna) {
	source("orf1.R")
	source("orf2.R")
	source("orf3.R")
	source("revcomp.R")
	source("orf4.R")
	source("orf5.R")
	source("orf6.R")

	cod1 <- orf1(dna=dna, pos=pos_dna)
	cod2 <- orf2(dna=dna, pos=pos_dna)
	cod3 <- orf3(dna=dna, pos=pos_dna)
	cod4 <- orf4(dna=revcomp, pos=pos_rc_dna)
	cod5 <- orf5(dna=revcomp, pos=pos_rc_dna)
	cod6 <- orf6(dna=revcomp, pos=pos_rc_dna)

	#cod1[1] is start, seeee[1] is stop 1, seeee[2] is stop 2, etc.
	stopoo <- c(cod1[2], cod1[3], cod1[4])
	seeee <- sort(stopoo)
	pos_stop1 <- if (seeee[1] < seeee[2] & seeee[2] < cod1[1] & seeee[3] < cod1[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod1[1]) {seeee[3]} else if (seeee[1] < cod1[1]) {seeee[2]} else {seeee[1]}

	stopoo <- c(cod2[2], cod2[3], cod2[4])
	seeee <- sort(stopoo)
	pos_stop2 <- if (seeee[1] < seeee[2] & seeee[2] < cod2[1] & seeee[3] < cod2[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod2[1]) {seeee[3]} else if (seeee[1] < cod2[1]) {seeee[2]} else {seeee[1]}

	stopoo <- c(cod3[2], cod3[3], cod3[4])
	seeee <- sort(stopoo)
	pos_stop3 <- if (seeee[1] < seeee[2] & seeee[2] < cod3[1] & seeee[3] < cod3[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod3[1]) {seeee[3]} else if (seeee[1] < cod3[1]) {seeee[2]} else {seeee[1]}


	stopoo <- c(cod4[2], cod4[3], cod4[4])
	seeee <- sort(stopoo)
	pos_stop4 <- if (seeee[1] < seeee[2] & seeee[2] < cod4[1] & seeee[3] < cod4[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod4[1]) {seeee[3]} else if (seeee[1] < cod4[1]) {seeee[2]} else {seeee[1]}


	stopoo <- c(cod5[2], cod5[3], cod5[4])
	seeee <- sort(stopoo)
	pos_stop5 <- if (seeee[1] < seeee[2] & seeee[2] < cod5[1] & seeee[3] < cod5[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod5[1]) {seeee[3]} else if (seeee[1] < cod5[1]) {seeee[2]} else {seeee[1]}


	stopoo <- c(cod6[2], cod6[3], cod6[4])
	seeee <- sort(stopoo)
	pos_stop6 <- if (seeee[1] < seeee[2] & seeee[2] < cod6[1] & seeee[3] < cod6[1]) {NULL} else if(seeee[1] < seeee[2] & seeee[2] < cod6[1]) {seeee[3]} else if (seeee[1] < cod6[1]) {seeee[2]} else {seeee[1]}

	

	if (length(cod1[1]) == 0 | length(pos_stop1+2) == 0) {length1=0} else {length1 <- length(dna[cod1[1]:(pos_stop1+2)])}
	if (length(cod2[1]) == 0 | length(pos_stop2+2) == 0) {length2=0} else {length2 <- length(dna[cod2[1]:(pos_stop2+2)])}
	if (length(cod3[1]) == 0 | length(pos_stop3+2) == 0) {length3=0} else {length3 <- length(dna[cod3[1]:(pos_stop3+2)])}
	if (length(cod4[1]) == 0 | length(pos_stop4+2) == 0) {length4=0} else {length4 <- length(dna[cod4[1]:(pos_stop4+2)])}
	if (length(cod5[1]) == 0 | length(pos_stop5+2) == 0) {length5=0} else {length5 <- length(dna[cod5[1]:(pos_stop5+2)])}
	if (length(cod6[1]) == 0 | length(pos_stop6+2) == 0) {length6=0} else {length6 <- length(dna[cod6[1]:(pos_stop6+2)])}
	maxlength <- max(length1, length2, length3, length4, length5, length6)
	
	if (maxlength==length1) {longest <- dna[cod1[1]:(pos_stop1+2)]} else if (maxlength==length2) {longest <- dna[cod2[1]:(pos_stop2+2)]} else if (maxlength==length3) {longest <- dna[cod3[1]:(pos_stop3+2)]} else if (maxlength==length4) {longest <- revcomp[cod4[1]:(pos_stop4+2)]} else if (maxlength==length5) {longest <- revcomp[cod5[1]:(pos_stop5+2)]} else {longest <- revcomp[cod6[1]:(pos_stop6+2)]}
	
	if (length(cod1[1]) == 0 | length(pos_stop1+2) == 0) {pos1 <- "NONE"} else {pos1 <- dna[cod1[1]:(pos_stop1+2)]}
	if (length(cod2[1]) == 0 | length(pos_stop2+2) == 0) {pos2 <- "NONE"} else {pos2 <- dna[cod2[1]:(pos_stop2+2)]}
	if (length(cod3[1]) == 0 | length(pos_stop3+2) == 0) {pos3 <- "NONE"} else {pos3 <- dna[cod3[1]:(pos_stop3+2)]}
	if (length(cod4[1]) == 0 | length(pos_stop4+2) == 0) {pos4 <- "NONE"} else {pos4 <- revcomp[cod4[1]:(pos_stop4+2)]}
	if (length(cod5[1]) == 0 | length(pos_stop5+2) == 0) {pos5 <- "NONE"} else {pos5 <- revcomp[cod5[1]:(pos_stop5+2)]}
	if (length(cod6[1]) == 0 | length(pos_stop6+2) == 0) {pos6 <- "NONE"} else {pos6 <- revcomp[cod6[1]:(pos_stop6+2)]}
	
	cat("ORF 1", file="output.txt", sep="\n")
	cat(paste("Start:", cod1[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop1), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos1, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")

	
	cat("ORF 2", file="output.txt", append=TRUE, sep="\n")
	cat(paste("Start:", cod2[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop2), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos2, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")
	
	cat("ORF 3", file="output.txt", append=TRUE, sep="\n")
	cat(paste("Start:", cod3[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop3), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos3, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")

	cat("ORF 4", file="output.txt", append=TRUE, sep="\n")
	cat(paste("Start:", cod4[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop4), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos4, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")
	
	cat("ORF 5", file="output.txt", append=TRUE, sep="\n")
	cat(paste("Start:", cod5[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop5), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos5, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")
	
	cat("ORF 6", file="output.txt", append=TRUE, sep="\n")
	cat(paste("Start:", cod6[1]), file="output.txt", append=TRUE, sep="\n")
	cat(paste("Stop:", pos_stop6), file="output.txt", append=TRUE, sep="\n")
	cat("Sequence: ", file="output.txt", append=TRUE)
	cat(pos6, file="output.txt", append=TRUE)
	cat(" ", file="output.txt", append=TRUE, sep="\n")

	return(cat(longest))

}

openreadingframe(orf=dna, pos=pos_dna)

bps <- c("A", "G", "T", "C")
dna <- sample(bps, 500, replace=T)
dna

pos <- cbind(rep(c(1,2,3), 167))
pos <- c(pos[1:500])
pos_dna <- data.frame(dna, pos)

openreadingframe(orf=dna, pos=dna_pos)



bps <- c("A", "G", "T", "C")
dna <- sample(bps, 600, replace=T)
dna

pos <- cbind(c(1,2,3))
pos_dna <- data.frame(dna, pos)

openreadingframe(orf=dna, pos=dna_pos)



bps <- c("A", "G", "T", "C")
dna <- sample(bps, 900, replace=T)
dna

pos <- cbind(c(1,2,3))
pos_dna <- data.frame(dna, pos)

openreadingframe(orf=dna, pos=dna_pos)
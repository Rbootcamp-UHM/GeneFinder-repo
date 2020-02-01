dna <- read.csv("sampleDNA.csv")
dna
length(dna)
dna <- as.vector(dna$Nucleotides)
dna
class(dna)

#This will create 3 vectors that will represent each reading frame
pos <- cbind(rep(c(1,2,3), 167))
pos <- c(pos[1:500])
pos
length(pos)

#Makes a Matrix with ORF positions labeled
pos_dna <- data.frame(dna, pos)
pos_dna

####################################################################################
#This finds all start codons in ORF 1
i <- which(c(pos_dna$dna =="A" & pos_dna$pos == 1))
i
a <- dna[i+1] == "T"#Look at the next door neighbor. Is next door neighbor T?
b <- dna[i+2] == "G" #Is the next next door neighbor G?
start1 <- a & b #which of the A's are followed by T and G
start_pos1 <- i[a & b] #Where in the DNA do the ATG's occur
start_pos1

#This finds all the stops in ORF1
j <- which(c(pos_dna$dna =="T" & pos_dna$pos == 1))
d <- dna[j+1] == "A"
e <- dna[j+2] == "A"
stop1_pos1 <- d & e
stop1_pos1 <- j[d & e]
stop1_pos1

jj <- which(c(pos_dna$dna =="T" & pos_dna$pos == 1))
dd <- dna[jj+1] == "A"
ee <- dna[jj+2] == "T"
stop2_pos1 <- jj[dd & ee] #Where in the DNA do the ATG's occur
stop2_pos1

jjj <- which(c(pos_dna$dna =="T" & pos_dna$pos == 1))
ddd <- dna[jjj+1] == "A"
eee <- dna[jjj+2] == "G"
stop3_pos1 <- jjj[ddd & eee] #Where in the DNA do the ATG's occur
stop3_pos1

####################################################################################
#This finds all start codons in ORF 2
ii <- which(c(pos_dna$dna=="A" & pos_dna$pos==2))
ii
dna[ii+1]
aa <- dna[ii+1] == "T"
bb <- dna[ii+2] == "G"
start2 <- aa & bb #which of the A's are followed by T and G
start_pos2 <- ii[aa & bb]
start_pos2

k <- which(c(pos_dna$dna =="T" & pos_dna$pos == 2))
f <- dna[k+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
g <- dna[k+2] == "A" #Is the next next door neightbor G?
stop1_pos2 <- f & g #which of the A's are followed by T and G
stop1_pos2 <- k[f & g]
stop1_pos2

kk <- which(c(pos_dna$dna =="T" & pos_dna$pos == 1))
ff <- dna[kk+1] == "A"
gg <- dna[kk+2] == "T"
stop2_pos2 <- kk[ff & gg] #Where in the DNA do the ATG's occur
stop2_pos2

kkk <- which(c(pos_dna$dna =="T" & pos_dna$pos == 1))
fff <- dna[kkk+1] == "A"
ggg <- dna[kkk+2] == "G"
stop3_pos2 <- kkk[fff & ggg] #Where in the DNA do the ATG's occur
stop3_pos2

####################################################################################
#This finds all start codons in ORF 3
iii <- which(c(pos_dna$dna=="A" & pos_dna$pos==3))
iii
dna[iii+1]
aaa <- dna[iii+1] == "T"
bbb <- dna[iii+2] == "G"
start3 <- aaa & bbb #which of the A's are followed by T and G
start_pos3 <- iii[aaa & bbb]
start_pos3

l <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
h <- dna[l+1] == "A"
m <- dna[l+2] == "A" 
stop1_pos3 <- h & m 
stop1_pos3 <- l[h & m]
stop1_pos3

ll <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
hh <- dna[ll+1] == "A"
mm <- dna[ll+2] == "T" 
stop2_pos3 <- hh & mm 
stop2_pos3 <- ll[hh & mm]
stop2_pos3

lll <- which(c(pos_dna$dna =="T" & pos_dna$pos == 3))
hhh <- dna[lll+1] == "G"
mmm <- dna[lll+2] == "A" 
stop3_pos3 <- hhh & mmm
stop3_pos3 <- lll[hhh & mmm]
stop3_pos3

####################################################################################

#This reverse compliments the DNA
reverse <- dna[500:1]
reverse
reverseT <- replace(reverse, reverse=="A", "T")
reverseA <- replace(reverseT, reverse=="T", "A")
reverseC <- replace(reverseA, reverse=="C", "G")
reverseG <- replace(reverseC, reverse=="G", "C")
revcomp <- reverseG
revcomp

pos_revcomp <- cbind(rep(c(1,2,3), 167))
pos_revcomp <- c(pos_revcomp[1:500])
length(pos_revcomp)

pos_rc_dna <- data.frame(revcomp, pos_revcomp)
pos_rc_dna
names(pos_rc_dna) <- c("dna", "pos")
head(pos_rc_dna)

####################################################################################
#This finds all start codons in ORF 4
r <- which(c(pos_rc_dna$dna =="A" & pos_rc_dna$pos == 1))
r
s <- revcomp[r+1] == "T"
u <- revcomp[r+2] == "G"
start_pos4 <- r[s & u]
start_pos4

#This finds all the stops in ORF4
v <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
w <- revcomp[v+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
z <- revcomp[v+2] == "A" #Is the next next door neightbor G?
stop1_pos4 <- v[w & z]
stop1_pos4 

vv <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
ww <- revcomp[vv+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
zz <- revcomp[vv+2] == "T" #Is the next next door neightbor G?
stop2_pos4 <- vv[ww & zz]
stop2_pos4

vvv <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 1))
www <- revcomp[vvv+1] == "G"#Look at the next door neighbor. Is next door neighbor T?
zzz <- revcomp[vvv+2] == "A" #Is the next next door neightbor G?
stop3_pos4 <- vvv[www & zzz]
stop3_pos4 <- min(stop3_pos4, na.rm=T)
stop3_pos4
####################################################################################
#This finds all start codons in ORF 5

rr <- which(c(pos_rc_dna$dna =="A" & pos_rc_dna$pos == 2))
rr
ss <- revcomp[rr+1] == "T"
uu <- revcomp[rr+2] == "G"
start_pos5 <- ss & uu
start_pos5 <- rr[ss & uu]
start_pos5

abb <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
abc <- revcomp[abb+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
abcc <- revcomp[abb+2] == "A" #Is the next next door neightbor G?
stop1_pos5 <- abc & abcc #which of the A's are followed by T and G
stop1_pos5 <- abb[abc & abcc]
stop1_pos5

abbb <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
abd <- revcomp[abbb+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
abdd <- revcomp[abbb+2] == "T" #Is the next next door neightbor G?
stop2_pos5 <- abd & abdd #which of the A's are followed by T and G
stop2_pos5 <- abbb[abd & abdd]
stop2_pos5

abbbb <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
abe <- revcomp[abbbb+1] == "G"#Look at the next door neighbor. Is next door neighbor T?
abee <- revcomp[abbbb+2] == "A" #Is the next next door neightbor G?
stop3_pos5 <- abe & abee #which of the A's are followed by T and G
stop3_pos5 <- abbbb[abe & abee]
stop3_pos5
####################################################################################
#This finds all start codons in ORF 6

rrr <- which(c(pos_rc_dna$dna =="A" & pos_rc_dna$pos == 3))
rrr
sss <- revcomp[rrr+1] == "T"
uuu <- revcomp[rrr+2] == "G"
start_pos6 <- rrr[sss & uuu]
start_pos6

acc <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
acd <- revcomp[acc+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
acdd <- revcomp[acc+2] == "A" #Is the next next door neightbor G?
stop1_pos6 <- acd & acdd #which of the A's are followed by T and G
stop1_pos6 <- acc[acd & acdd]
stop1_pos6

accc <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
ace <- revcomp[accc+1] == "A"#Look at the next door neighbor. Is next door neighbor T?
acee <- revcomp[accc+2] == "T" #Is the next next door neightbor G?
stop2_pos6 <- ace & acee #which of the A's are followed by T and G
stop2_pos6 <- accc[ace & acee]
stop2_pos6

acccc <- which(c(pos_rc_dna$dna =="T" & pos_rc_dna$pos == 2))
acff <- revcomp[acccc+1] == "G"#Look at the next door neighbor. Is next door neighbor T?
acgg <- revcomp[acccc+2] == "A" #Is the next next door neightbor G?
stop3_pos6 <- acff & acgg #which of the A's are followed by T and G
stop3_pos6 <- acccc[acff & acgg]
stop3_pos6

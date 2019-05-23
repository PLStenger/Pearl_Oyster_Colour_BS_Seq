#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

#########################################################################################
### GET METHYLATION FROM SORTED BISMARK ALIGNEMENT OR READ THE METHYLATION CALL FILES ###
#########################################################################################

# A set of BAM or methylation call files #

#list.bam=list("Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam",
#                "Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam",
#                "Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
#                "Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
#                "Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
#                "Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam")

list.bam=list("Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
                "Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")


#list.id=list("2-V-620",
#                "3-V-620",
#                "1-V-613",
#                "2-V-613",
#                "3-V-613",
#                "1-V-620")

list.id=list("2-V-620", "3-V-620")

myallmeth=processBismarkAln(location=list.bam,
                sample.id=list.id,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1))

save(myallmeth, file = "R.objects/myallmeth.rda")
print(myallmeth[[1]]@dbpath)
message ("myallmeth.done")

# Descriptive statistics on samples
getMethylationStats(myallmeth[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(myallmeth[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(myallmeth[[2]],plot=TRUE,both.strands=FALSE)

###################################
### FILTER THE METHYLATION CALL ###
###################################

#load("R.objects/myallmeth.rda")

# with normalization #
normalized.myallmeth=normalizeCoverage(myallmeth)
message ("normalize.done")

# Filtering samples based on read coverage #
filtered.normalized.myallmeth.10=filterByCoverage(normalized.myallmeth,
		lo.count = 10,
		lo.perc = NULL,
		hi.count = NULL,
		hi.perc = 99.9)

save(filtered.normalized.myallmeth.10, file = "R.objects/filtered.normalized.myallmeth.10.rda")
message ("filtered.normalized.myallmeth.done")

# without normalization #
filtered.myallmeth.10=filterByCoverage(normalized.myallmeth,
                lo.count = 10,
                lo.perc = NULL,
                hi.count = NULL,
                hi.perc = 99.9)

save(filtered.myallmeth.10, file = "R.objects/filtered.myallmeth.10.rda")
message ("filtered.myallmeth.done")

### COMPARATIVE ANALYSIS ###

## Per Base ##

# with normalization #
load("R.objects/filtered.normalized.myallmeth.10.rda")
Allmeth.norm=unite(filtered.normalized.myallmeth.10,destrand = FALSE)

save(Allmeth.norm, file = "R.objects/Allmeth.norm.rda")
message ("unite.filtered.normalized.myallmeth.done")

write.table(Allmeth.norm, file = "Allmeth.norm.txt", sep = "\t", quote = FALSE)

perc.Allmeth.norm <- percMethylation(Allmeth.norm)
write.table(perc.Allmeth.norm, file = "Allmeth.norm.percent.txt", sep = "\t", quote = FALSE)
message ("done perc meth.norm")

# without normalization #
load("R.objects/filtered.myallmeth.10.rda")
Allmeth=unite(filtered.myallmeth.10,destrand = FALSE)

save(Allmeth, file = "R.objects/Allmeth.rda")
message ("unite.filtered.myallmeth.done")

write.table(Allmeth, file = "Allmeth.txt", sep = "\t", quote = FALSE)

perc.Allmeth <- percMethylation(Allmeth)
write.table(perc.Allmeth, file = "Allmeth.percent.txt", sep = "\t", quote = FALSE)
message ("done perc meth")

### DIFFERENTIAL METHYLATION ANALYSIS ###

# with normalization #
load("R.objects/Allmeth.norm.rda")

Diffmeth.norm=calculateDiffMeth(Allmeth.norm, mc.cores = 4)

save(Diffmeth.norm, file = "R.objects/Diffmeth.norm.rda")

write.table(Diffmeth.norm, file = "Diffmeth.norm.txt", sep = "\t", quote = FALSE)

message("Diffmeth.norm done")

Diffmeth.norm.interest=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.001)
write.table(Diffmeth.norm.interest, file = "Diffmeth.norm.diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hyper=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.001, type = "hyper")
write.table(Diffmeth.norm.interest.hyper, file = "Diffmeth.norm.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hypo=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.001, type = "hypo")
write.table(Diffmeth.norm.interest.hypo, file = "Diffmeth.norm.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

# without normalization #
load("R.objects/Allmeth.rda")

Diffmeth=calculateDiffMeth(Allmeth, mc.cores = 4)

save(Diffmeth, file = "R.objects/Diffmeth.rda")

write.table(Diffmeth, file = "Diffmeth.txt", sep = "\t", quote = FALSE)

message("Diffmeth done")

Diffmeth.interest=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.001)
write.table(Diffmeth.interest, file = "Diffmeth.diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.interest.hyper=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.001, type = "hyper")
write.table(Diffmeth.interest.hyper, file = "Diffmeth.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.interest.hypo=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.001, type = "hypo")
write.table(Diffmeth.interest.hypo, file = "Diffmeth.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

message("get diffmeth of interest done")


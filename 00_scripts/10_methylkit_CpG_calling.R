#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

#########################################################################################
### GET METHYLATION FROM SORTED BISMARK ALIGNEMENT OR READ THE METHYLATION CALL FILES ###
#########################################################################################

# A set of BAM or methylation call files #

# ALL

#list.bam=list("Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
#"Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")



# ALL
#list.id=list("3-J-7",
#"2-V-620",
#"1-R-180",
#"3-V-620",
#"2-R-180",
#"3-R-180",
#"2-R-183",
#"1-J-2",
#"3-R-183",
#"2-J-2",
#"1-V-613",
#"3-J-2",
#"2-V-613",
#"1-J-7",
#"3-V-613",
#"1-R-183",
#"1-V-620",
#"2-J-7")

###### CONTROL GREEN
list.bam_control_green=list("Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### CONTROL GREEN
list.id_control_green=list("1-V-613",
"2-V-613",
"3-V-613")

my_meth_control_green=processBismarkAln(location=list.bam_control_green,
                sample.id=list.id_control_green,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_green",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_control_green[[1]]")
my_meth_control_green[[1]]
print("my_meth_control_green[[2]]")
my_meth_control_green[[2]]
print("my_meth_control_green[[3]]")
my_meth_control_green[[3]]
getMethylationStats(my_meth_control_green[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_green[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_green[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_green[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_green[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_green[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_green[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_green[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_green[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_control_green, file = "my_meth_control_green.rda")
#print(my_meth_control_green[[1]]@dbpath)
message ("my_meth_control_green.done")




###### CONTROL RED
list.bam_control_red=list("Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### CONTROL RED
list.id_control_red=list("1-R-180",
"2-R-180",
"3-R-180")

my_meth_control_red=processBismarkAln(location=list.bam_control_red,
                sample.id=list.id_control_red,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_red",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

getMethylationStats(my_meth_control_red[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_control_red, file = "my_meth_control_red.rda")
#print(my_meth_control_red[[1]]@dbpath)
message ("my_meth_control_red.done")





###### CONTROL YELLOW
list.bam_control_yellow=list("Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### CONTROL YELLOW
list.id_control_yellow=list("1-J-2",
"2-J-2",
"3-J-2")

my_meth_control_yellow=processBismarkAln(location=list.bam_control_yellow,
                sample.id=list.id_control_yellow,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_yellow",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))
			 
getMethylationStats(my_meth_control_yellow[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[3]],plot=TRUE,both.strands=FALSE)
			 

save(my_meth_control_yellow, file = "my_meth_control_yellow.rda")
#print(my_meth_control_yellow[[1]]@dbpath)
message ("my_meth_control_yellow.done")

###### TREATMENT YELLOW
list.bam_treatment_yellow=list("Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### TREATMENT YELLOW
list.id_treatment_yellow=list("3-J-7",
"1-J-7",
"2-J-7")

my_meth_treatment_yellow=processBismarkAln(location=list.bam_treatment_yellow,
                sample.id=list.id_treatment_yellow,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_yellow",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))
			 
			 getMethylationStats(my_meth_treatment_yellow[[1]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_yellow[[1]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_yellow[[1]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_yellow[[2]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_yellow[[2]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_yellow[[2]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_yellow[[3]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_yellow[[3]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_yellow[[3]],plot=TRUE,both.strands=FALSE)
			 

save(my_meth_treatment_yellow, file = "my_meth_treatment_yellow.rda")
#print(my_meth_treatment_yellow[[1]]@dbpath)
message ("my_meth_treatment_yellow.done")


###### TREATMENT RED
list.bam_treatment_red=list("Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### TREATMENT RED
list.id_treatment_red=list("2-R-183",
"3-R-183",
"1-R-183")

my_meth_treatment_red=processBismarkAln(location=list.bam_treatment_red,
                sample.id=list.id_treatment_red,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_red",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))
			 
			 getMethylationStats(my_meth_treatment_red[[1]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_red[[1]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_red[[1]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_red[[2]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_red[[2]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_red[[2]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_red[[3]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_red[[3]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_red[[3]],plot=TRUE,both.strands=FALSE)
			 

save(my_meth_treatment_red, file = "my_meth_treatment_red.rda")
#print(my_meth_treatment_red[[1]]@dbpath)
message ("my_meth_treatment_red.done")


###### TREATMENT GREEN
list.bam_treatment_green=list("Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam",
"Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam")

###### TREATMENT GREEN
list.id_treatment_green=list("2-V-620",
"3-V-620",
"1-V-620")

my_meth_treatment_green=processBismarkAln(location=list.bam_treatment_green,
                sample.id=list.id_treatment_green,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_green",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))
			 
			 getMethylationStats(my_meth_treatment_green[[1]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_green[[1]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_green[[1]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_green[[2]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_green[[2]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_green[[2]],plot=TRUE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_green[[3]],plot=FALSE,both.strands=FALSE)
			 getMethylationStats(my_meth_treatment_green[[3]],plot=TRUE,both.strands=FALSE)
			 getCoverageStats(my_meth_treatment_green[[3]],plot=TRUE,both.strands=FALSE)
			 

save(my_meth_treatment_green, file = "my_meth_treatment_green.rda")
#print(my_meth_treatment_green[[1]]@dbpath)
message ("my_meth_treatment_green.done")




###################################
### FILTER THE METHYLATION CALL ###
###################################

#load("R.objects/myallmeth.rda")

# with normalization #
normalized.myallmeth=normalizeCoverage(my_meth_control_yellow)
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

Diffmeth.norm.interest=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm.interest, file = "Diffmeth.norm.diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hyper=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm.interest.hyper, file = "Diffmeth.norm.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hypo=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm.interest.hypo, file = "Diffmeth.norm.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

# without normalization #
load("R.objects/Allmeth.rda")

Diffmeth=calculateDiffMeth(Allmeth, mc.cores = 4)

save(Diffmeth, file = "R.objects/Diffmeth.rda")

write.table(Diffmeth, file = "Diffmeth.txt", sep = "\t", quote = FALSE)

message("Diffmeth done")

Diffmeth.interest=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01)
write.table(Diffmeth.interest, file = "Diffmeth.diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.interest.hyper=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.interest.hyper, file = "Diffmeth.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.interest.hypo=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.interest.hypo, file = "Diffmeth.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

message("get diffmeth of interest done")


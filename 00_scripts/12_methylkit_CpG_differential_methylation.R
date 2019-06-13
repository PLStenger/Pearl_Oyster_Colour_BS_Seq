#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

####### ALL TREATMENT CLEAN COLOR AGAINST COLOR
#list.id_treatment_all_treatment_color_against_color=list("1-R-183",
#"2-R-183",
#"3-R-183",
#"1-J-7",
#"2-J-7",
#"3-J-7",
#"1-V-620",
#"2-V-620",
#"3-V-620")
#
#my_meth_treatment_all_treatment_color_against_color=processBismarkAln(location=list.bam_treatment_all_treatment_color_against_color,
#                sample.id=list.id_treatment_all_treatment_color_against_color,
#                assembly="sspace.final.scaffolds.fasta",
#                save.folder="methylation_call_treatment_all_treatment_color_against_color_clean",
#                save.context=c("CpG"),
#                read.context="CpG",
#                mincov=10,
#                treatment=c(0,0,0,1,1,1,2,2,2))
#

### COMPARATIVE ANALYSIS ###



## Per Base ##
# with normalization #
load("my_meth_treatment_all_treatment_color_against_color_clean.rda")

normalized.myallmeth=normalizeCoverage(my_meth_treatment_all_treatment_color_against_color)
str(normalized.myallmeth)
message("normalize.done")

# Filtering samples based on read coverage #
filtered.normalized.myallmeth.10=filterByCoverage(normalized.myallmeth,
                                                  lo.count = 10,
                                                  lo.perc = NULL,
                                                  hi.count = NULL,
                                                  hi.perc = 99.9)

filtered.normalized.myallmeth.10.all_treatment_color_against_color = filtered.normalized.myallmeth.10
Allmeth.norm.all_treatment_color_against_color=unite(filtered.normalized.myallmeth.10.all_treatment_color_against_color,destrand = FALSE)

Allmeth.norm=Allmeth.norm.all_treatment_color_against_color

save(Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite.rda")
message("my_meth_treatment_all_treatment_color_against_color_cleandone")

write.table(Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)

perc.Allmeth.norm <- percMethylation(Allmeth.norm)
write.table(perc.Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite_percent.txt", sep = "\t", quote = FALSE)
message("done perc meth.norm")


#####################################
## Reorganize

## get samples named "test1" and "ctrl2" from myobj and create a new methylRawList object
#treatement_red_1_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-R-183","2-R-183"),
#	treatment=c(1,0) )
#	
#treatement_red_1_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-R-183","3-R-183"),
#	treatment=c(1,0) )
#	
#treatement_red_2_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("2-R-183","3-R-183"),
#	treatment=c(1,0) )
#
#
#treatement_green_1_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-V-620","2-V-620"),
#	treatment=c(1,0) )
#
#treatement_green_1_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-V-620","3-V-620"),
#	treatment=c(1,0) )
#
#treatement_green_2_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("2-V-620","3-V-620"),
#	treatment=c(1,0) )
#	
#	
#treatement_yellow_1_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-J-7","2-J-7"),
#	treatment=c(1,0) )
#
#treatement_yellow_1_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("1-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#treatement_yellow_2_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
#	sample.ids=c("2-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#
## # get samples named "test1" and "ctrl2" from meth and create a new methylBase object
##meth2 =reorganize(Allmeth.norm,sample.ids=c("test1","ctrl2"),treatment=c(1,0) )
#
#Allmeth.norm_treatement_red_1_2=reorganize(Allmeth.norm, 
#	sample.ids=c("1-R-183","2-R-183"),
#	treatment=c(1,0) )
#	
#Allmeth.norm_treatement_red_1_3=reorganize(Allmeth.norm, 
#	sample.ids=c("1-R-183","3-R-183"),
#	treatment=c(1,0) )
#	
#Allmeth.norm_treatement_red_2_3=reorganize(Allmeth.norm, 
#	sample.ids=c("2-R-183","3-R-183"),
#	treatment=c(1,0) )
#
#
#Allmeth.norm_treatement_green_1_2=reorganize(Allmeth.norm, 
#	sample.ids=c("1-V-620","2-V-620"),
#	treatment=c(1,0) )
#
#Allmeth.norm_treatement_green_1_3=reorganize(Allmeth.norm, 
#	sample.ids=c("1-V-620","3-V-620"),
#	treatment=c(1,0) )
#
#Allmeth.norm_treatement_green_2_3=reorganize(Allmeth.norm, 
#	sample.ids=c("2-V-620","3-V-620"),
#	treatment=c(1,0) )
#	
#	
#Allmeth.norm_treatement_yellow_1_2=reorganize(Allmeth.norm, 
#	sample.ids=c("1-J-7","2-J-7"),
#	treatment=c(1,0) )
#
#Allmeth.norm_treatement_yellow_1_3=reorganize(Allmeth.norm, 
#	sample.ids=c("1-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#Allmeth.norm_treatement_yellow_2_3=reorganize(Allmeth.norm, 
#	sample.ids=c("2-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#
#### DIFFERENTIAL METHYLATION ANALYSIS ###
#
## with normalization #
#
#
###################################################################
## Allmeth.norm_treatement_red_1_2
###################################################################
#
#Diffmeth.norm_treatement_red_1_2=calculateDiffMeth(Allmeth.norm_treatement_red_1_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_2, file = "Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_red_1_2, file = "Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_red_1_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_2.interest, file = "Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_2.interest.hyper, file = "Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_2.interest.hypo, file = "Diffmeth.norm_treatement_red_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_red_1_3
###################################################################
#
#Diffmeth.norm_treatement_red_1_3=calculateDiffMeth(Allmeth.norm_treatement_red_1_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_3, file = "Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_red_1_3, file = "Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_red_1_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_3.interest, file = "Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_3.interest.hyper, file = "Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_3.interest.hypo, file = "Diffmeth.norm_treatement_red_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_red_2_3
###################################################################
#
#Diffmeth.norm_treatement_red_2_3=calculateDiffMeth(Allmeth.norm_treatement_red_2_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_2_3, file = "Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_red_2_3, file = "Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_red_2_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_2_3.interest, file = "Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_2_3.interest.hyper, file = "Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_2_3.interest.hypo, file = "Diffmeth.norm_treatement_red_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_green_1_2
###################################################################
#
#Diffmeth.norm_treatement_green_1_2=calculateDiffMeth(Allmeth.norm_treatement_green_1_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_1_2, file = "Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_green_1_2, file = "Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_green_1_2.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_1_2.interest, file = "Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_1_2.interest.hyper, file = "Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_1_2.interest.hypo, file = "Diffmeth.norm_treatement_green_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_green_1_3
###################################################################
#
#Diffmeth.norm_treatement_green_1_3=calculateDiffMeth(Allmeth.norm_treatement_green_1_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_1_3, file = "Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_green_1_3, file = "Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_green_1_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_1_3.interest, file = "Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_1_3.interest.hyper, file = "Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_1_3.interest.hypo, file = "Diffmeth.norm_treatement_green_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_green_2_3
###################################################################
#
#Diffmeth.norm_treatement_green_2_3=calculateDiffMeth(Allmeth.norm_treatement_green_2_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_2_3, file = "Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_green_2_3, file = "Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_green_2_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_2_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_2_3.interest, file = "Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_2_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_2_3.interest.hyper, file = "Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_2_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_2_3.interest.hypo, file = "Diffmeth.norm_treatement_green_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_yellow_1_2
###################################################################
#
#Diffmeth.norm_treatement_yellow_1_2=calculateDiffMeth(Allmeth.norm_treatement_yellow_1_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_1_2, file = "Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_yellow_1_2, file = "Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_yellow_1_2.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_1_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_1_2.interest, file = "Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_1_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_1_2.interest.hyper, file = "Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_1_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_1_2.interest.hypo, file = "Diffmeth.norm_treatement_yellow_1_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_yellow_1_3
###################################################################
#
#Diffmeth.norm_treatement_yellow_1_3=calculateDiffMeth(Allmeth.norm_treatement_yellow_1_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_1_3, file = "Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_yellow_1_3, file = "Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_yellow_1_3.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_1_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_1_3.interest, file = "Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_1_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_1_3.interest.hyper, file = "Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_1_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_1_3.interest.hypo, file = "Diffmeth.norm_treatement_yellow_1_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## Allmeth.norm_treatement_yellow_2_3
###################################################################
#
#Diffmeth.norm_treatement_yellow_2_3=calculateDiffMeth(Allmeth.norm_treatement_yellow_2_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_2_3, file = "Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unite.rda")
#write.table(Diffmeth.norm_treatement_yellow_2_3, file = "Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unite done")
#
#Diffmeth.norm_treatement_yellow_2_3.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_2_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_2_3.interest, file = "Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_2_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_2_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_2_3.interest.hyper, file = "Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_2_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_2_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_2_3.interest.hypo, file = "Diffmeth.norm_treatement_yellow_2_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#


treatement_red_1_green_1=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("1-R-183","1-V-620"),
	treatment=c(1,0) )
	
treatement_red_2_green_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("2-R-183","2-V-620"),
	treatment=c(1,0) )
	
treatement_red_3_green_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("2-R-183","2-V-620"),
	treatment=c(1,0) )	
	
	
	
	
	
treatement_red_1_yellow_1=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("1-R-183","1-J-7"),
	treatment=c(1,0) )

treatement_red_2_yellow_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("2-R-183","2-J-7"),
	treatment=c(1,0) )

treatement_red_3_yellow_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("2-R-183","3-J-7"),
	treatment=c(1,0) )	
	
	
	
	
	
treatement_green_1_yellow_1=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("1-V-620","1-J-7"),
	treatment=c(1,0) )

treatement_green_2_yellow_2=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("2-V-620","2-J-7"),
	treatment=c(1,0) )

treatement_green_3_yellow_3=reorganize(my_meth_treatment_all_treatment_color_against_color, 
	sample.ids=c("3-V-620","3-J-7"),
	treatment=c(1,0) )	
	
	
	
	
	
	
	
	
	
Allmeth.norm_treatement_red_1_green_1=reorganize(Allmeth.norm, 
	sample.ids=c("1-R-183","1-V-620"),
	treatment=c(1,0) )

Allmeth.norm_treatement_red_2_green_2=reorganize(Allmeth.norm, 
	sample.ids=c("2-R-183","2-V-620"),
	treatment=c(1,0) )

Allmeth.norm_treatement_red_3_green_3=reorganize(Allmeth.norm, 
	sample.ids=c("2-R-183","2-V-620"),
	treatment=c(1,0) )	





Allmeth.norm_treatement_red_1_yellow_1=reorganize(Allmeth.norm, 
	sample.ids=c("1-R-183","1-J-7"),
	treatment=c(1,0) )

Allmeth.norm_treatement_red_2_yellow_2=reorganize(Allmeth.norm, 
	sample.ids=c("2-R-183","2-J-7"),
	treatment=c(1,0) )

Allmeth.norm_treatement_red_3_yellow_3=reorganize(Allmeth.norm, 
	sample.ids=c("2-R-183","3-J-7"),
	treatment=c(1,0) )	





Allmeth.norm_treatement_green_1_yellow_1=reorganize(Allmeth.norm, 
	sample.ids=c("1-V-620","1-J-7"),
	treatment=c(1,0) )

Allmeth.norm_treatement_green_2_yellow_2=reorganize(Allmeth.norm, 
	sample.ids=c("2-V-620","2-J-7"),
	treatment=c(1,0) )

Allmeth.norm_treatement_green_3_yellow_3=reorganize(Allmeth.norm, 
	sample.ids=c("3-V-620","3-J-7"),
	treatment=c(1,0) )	
	
	
	
##################################################################
# Allmeth.norm_treatement_red_1_green_1
##################################################################

Diffmeth.norm_treatement_red_1_green_1=calculateDiffMeth(Allmeth.norm_treatement_red_1_green_1, mc.cores = 4)
save(Diffmeth.norm_treatement_red_1_green_1, file = "Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_1_green_1, file = "Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_1_green_1.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_green_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_1_green_1.interest, file = "Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_1_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_green_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_1_green_1.interest.hyper, file = "Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_1_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_green_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_1_green_1.interest.hypo, file = "Diffmeth.norm_treatement_red_1_green_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# Allmeth.norm_treatement_red_2_green_2
##################################################################

Diffmeth.norm_treatement_red_2_green_2=calculateDiffMeth(Allmeth.norm_treatement_red_2_green_2, mc.cores = 4)
save(Diffmeth.norm_treatement_red_2_green_2, file = "Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_2_green_2, file = "Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_2_green_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_green_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_2_green_2.interest, file = "Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_2_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_green_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_2_green_2.interest.hyper, file = "Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_2_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_green_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_2_green_2.interest.hypo, file = "Diffmeth.norm_treatement_red_2_green_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


##################################################################
# Allmeth.norm_treatement_red_3_green_3
##################################################################

Diffmeth.norm_treatement_red_3_green_3=calculateDiffMeth(Allmeth.norm_treatement_red_3_green_3, mc.cores = 4)
save(Diffmeth.norm_treatement_red_3_green_3, file = "Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_3_green_3, file = "Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_3_green_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_3_green_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_3_green_3.interest, file = "Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_3_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_3_green_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_3_green_3.interest.hyper, file = "Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_3_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_3_green_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_3_green_3.interest.hypo, file = "Diffmeth.norm_treatement_red_3_green_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



##################################################################
# Allmeth.norm_treatement_red_1_yellow_1
##################################################################

Diffmeth.norm_treatement_red_1_yellow_1=calculateDiffMeth(Allmeth.norm_treatement_red_1_yellow_1, mc.cores = 4)
save(Diffmeth.norm_treatement_red_1_yellow_1, file = "Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_1_yellow_1, file = "Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_1_yellow_1.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_yellow_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_1_yellow_1.interest, file = "Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_1_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_1_yellow_1.interest.hyper, file = "Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_1_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_1_yellow_1.interest.hypo, file = "Diffmeth.norm_treatement_red_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# Allmeth.norm_treatement_red_2_yellow_2
##################################################################

Diffmeth.norm_treatement_red_2_yellow_2=calculateDiffMeth(Allmeth.norm_treatement_red_2_yellow_2, mc.cores = 4)
save(Diffmeth.norm_treatement_red_2_yellow_2, file = "Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_2_yellow_2, file = "Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_2_yellow_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_yellow_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_2_yellow_2.interest, file = "Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_2_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_2_yellow_2.interest.hyper, file = "Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_2_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_2_yellow_2.interest.hypo, file = "Diffmeth.norm_treatement_red_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


##################################################################
# Allmeth.norm_treatement_red_3_yellow_3
##################################################################

Diffmeth.norm_treatement_red_3_yellow_3=calculateDiffMeth(Allmeth.norm_treatement_red_3_yellow_3, mc.cores = 4)
save(Diffmeth.norm_treatement_red_3_yellow_3, file = "Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_red_3_yellow_3, file = "Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_red_3_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_3_yellow_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_red_3_yellow_3.interest, file = "Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_3_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_3_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_red_3_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_red_3_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_3_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_red_3_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_red_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# Allmeth.norm_treatement_green_1_yellow_1
##################################################################

Diffmeth.norm_treatement_green_1_yellow_1=calculateDiffMeth(Allmeth.norm_treatement_green_1_yellow_1, mc.cores = 4)
save(Diffmeth.norm_treatement_green_1_yellow_1, file = "Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_green_1_yellow_1, file = "Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_green_1_yellow_1.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_yellow_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_green_1_yellow_1.interest, file = "Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_1_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_green_1_yellow_1.interest.hyper, file = "Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_1_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_green_1_yellow_1.interest.hypo, file = "Diffmeth.norm_treatement_green_1_yellow_1_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# Allmeth.norm_treatement_green_2_yellow_2
##################################################################

Diffmeth.norm_treatement_green_2_yellow_2=calculateDiffMeth(Allmeth.norm_treatement_green_2_yellow_2, mc.cores = 4)
save(Diffmeth.norm_treatement_green_2_yellow_2, file = "Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_green_2_yellow_2, file = "Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_green_2_yellow_2.interest=getMethylDiff(Diffmeth.norm_treatement_green_2_yellow_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_green_2_yellow_2.interest, file = "Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_2_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_2_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_green_2_yellow_2.interest.hyper, file = "Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_2_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_2_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_green_2_yellow_2.interest.hypo, file = "Diffmeth.norm_treatement_green_2_yellow_2_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


##################################################################
# Allmeth.norm_treatement_green_3_yellow_3
##################################################################

Diffmeth.norm_treatement_green_3_yellow_3=calculateDiffMeth(Allmeth.norm_treatement_green_3_yellow_3, mc.cores = 4)
save(Diffmeth.norm_treatement_green_3_yellow_3, file = "Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.rda")
write.table(Diffmeth.norm_treatement_green_3_yellow_3, file = "Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm_treatement_green_3_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_3_yellow_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_treatement_green_3_yellow_3.interest, file = "Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_3_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_3_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_treatement_green_3_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_treatement_green_3_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_3_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_treatement_green_3_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_green_3_yellow_3_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
















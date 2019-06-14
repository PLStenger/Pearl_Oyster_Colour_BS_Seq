#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")


#############################################################################################################
########################################### ALL - ALL - ALL #################################################
######################################## CONTROLS & TREATMENTS ##############################################
#############################################################################################################

#############################################################################################################
####################################### my_meth_all_together_clean ##########################################
#############################################################################################################

####### ALL ALL ALL 
#list.id_all_together=list("1-R-183",
#"2-R-183",
#"3-R-183",
#"1-J-7",
#"2-J-7",
#"3-J-7",
#"1-V-620",
#"2-V-620",
#"3-V-620",
#"1-R-180",
#"2-R-180",
#"3-R-180",
#"1-J-2",
#"2-J-2",
#"3-J-2",
#"1-V-613",
#"2-V-613",
#"3-V-613")
#
#my_meth_all_together=processBismarkAln(location=list.bam_all_together,
#                sample.id=list.id_all_together,
#                assembly="sspace.final.scaffolds.fasta",
#                save.folder="methylation_call_all_together_clean",
#                save.context=c("CpG"),
#                read.context="CpG",
#                mincov=10,
#                treatment=c(0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5))
#

#############################################################################################################
########################################### COMPARATIVE ANALYSIS ############################################
#############################################################################################################

#############################################################################################################
################################################# Per Base ##################################################
#############################################################################################################

#############################################################################################################
############################################# with normalization ############################################
#############################################################################################################


load("my_meth_all_together_clean.rda")

normalized.myallmeth=normalizeCoverage(my_meth_all_together)
#str(normalized.myallmeth)
#message ("normalize.done")

# Filtering samples based on read coverage #
filtered.normalized.myallmeth.10=filterByCoverage(normalized.myallmeth,
                                                  lo.count = 10,
                                                  lo.perc = NULL,
                                                  hi.count = NULL,
                                                  hi.perc = 99.9)

filtered.normalized.myallmeth.10_unite=unite(filtered.normalized.myallmeth.10,destrand = FALSE)

#save(filtered.normalized.myallmeth.10_unite, file = "my_meth_all_together_clean_filtered.normalized.myallmeth.10_unite.rda")
#message("filtered.normalized.myallmeth.10_unite_done")

#write.table(filtered.normalized.myallmeth.10_unite, file = "mfiltered.normalized.myallmeth.10_unite.txt", sep = "\t", quote = FALSE)

#perc.filtered.normalized.myallmeth.10_unite <- percMethylation(filtered.normalized.myallmeth.10_unite)
#write.table(perc.filtered.normalized.myallmeth.10_unite, file = "filtered.normalized.myallmeth.10_unite_percent.txt", sep = "\t", quote = FALSE)
#message("perc.filtered.normalized.myallmeth.10_unite")



##############################################################################################################
#################################################### REORGANIZE ##############################################
##############################################################################################################
## We need to reorganize because with have a lot of comparison and it's impossible to compare all the conditions togethers
#
##############################################################################################################
######################################### TREATMENT: SAME COLOR against TIME #################################
##############################################################################################################
#
########################################### object from processBismarkAln ####################################
#
#treatement_red_1_treatement_red_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-183","2-R-183"),
#	treatment=c(1,0) )
#	
#treatement_red_1_treatement_red_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-183","3-R-183"),
#	treatment=c(1,0) )
#	
#treatement_red_2_treatement_red_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-183","3-R-183"),
#	treatment=c(1,0) )
#
#treatement_green_1_treatement_green_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-620","2-V-620"),
#	treatment=c(1,0) )
#
#treatement_green_1_treatement_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-620","3-V-620"),
#	treatment=c(1,0) )
#
#treatement_green_2_treatement_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-V-620","3-V-620"),
#	treatment=c(1,0) )
#	
#treatement_yellow_1_treatement_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-J-7","2-J-7"),
#	treatment=c(1,0) )
#
#treatement_yellow_1_treatement_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#treatement_yellow_2_treatement_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#treatement_red_1_treatement_green_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-183","1-V-620"),
#	treatment=c(1,0) )
#
#treatement_red_2_treatement_green_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-183","2-V-620"),
#	treatment=c(1,0) )
#
#treatement_red_3_treatement_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-183","2-V-620"),
#	treatment=c(1,0) )	
#
#treatement_red_1_treatement_yellow_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-183","1-J-7"),
#	treatment=c(1,0) )
#
#treatement_red_2_treatement_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-183","2-J-7"),
#	treatment=c(1,0) )
#
#treatement_red_3_treatement_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-183","3-J-7"),
#	treatment=c(1,0) )	
#
#treatement_green_1_treatement_yellow_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-620","1-J-7"),
#	treatment=c(1,0) )
#
#treatement_green_2_treatement_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-V-620","2-J-7"),
#	treatment=c(1,0) )
#
#treatement_green_3_treatement_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("3-V-620","3-J-7"),
#	treatment=c(1,0) )	
#
#
#
#
############################################# object from unite function #####################################
#
#
#filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-183","2-R-183"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-183","3-R-183"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-183","3-R-183"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-620","2-V-620"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-620","3-V-620"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-V-620","3-V-620"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-J-7","2-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_yellow_2_treatement_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-J-7","3-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_green_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-183","1-V-620"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-183","2-V-620"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-183","2-V-620"),
#	treatment=c(1,0) )	
#
#filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-183","1-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-183","2-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-183","3-J-7"),
#	treatment=c(1,0) )	
#
#filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-620","1-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-V-620","2-J-7"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_treatement_green_3_treatement_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("3-V-620","3-J-7"),
#	treatment=c(1,0) )	
#
#
#
#
##############################################################################################################
######################################### DIFFERENTIAL METHYLATION ANALYSIS ##################################
##############################################################################################################
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_2
###################################################################
#
#Diffmeth.norm_treatement_red_1_treatement_red_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_treatement_red_2, file = "Diffmeth.norm_treatement_red_1_treatement_red_2.rda")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_2, file = "Diffmeth.norm_treatement_red_1_treatement_red_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_treatement_red_2 done")
#
#Diffmeth.norm_treatement_red_1_treatement_red_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_2.interest, file = "Diffmeth.norm_treatement_red_1_treatement_red_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_red_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_2.interest.hyper, file = "Diffmeth.norm_treatement_red_1_treatement_red_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_red_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_2.interest.hypo, file = "Diffmeth.norm_treatement_red_1_treatement_red_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_3
###################################################################
#
#Diffmeth.norm_treatement_red_1_treatement_red_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_red_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_treatement_red_3, file = "Diffmeth.norm_treatement_red_1_treatement_red_3.rda")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_3, file = "Diffmeth.norm_treatement_red_1_treatement_red_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_treatement_red_3 done")
#
#Diffmeth.norm_treatement_red_1_treatement_red_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_3.interest, file = "Diffmeth.norm_treatement_red_1_treatement_red_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_3.interest.hyper, file = "Diffmeth.norm_treatement_red_1_treatement_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_red_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_treatement_red_3.interest.hypo, file = "Diffmeth.norm_treatement_red_1_treatement_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_red_3
###################################################################
#
#Diffmeth.norm_treatement_red_2_treatement_red_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_red_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_2_treatement_red_3, file = "Diffmeth.norm_treatement_red_2_treatement_red_3.rda")
#write.table(Diffmeth.norm_treatement_red_2_treatement_red_3, file = "Diffmeth.norm_treatement_red_2_treatement_red_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_2_treatement_red_3 done")
#
#Diffmeth.norm_treatement_red_2_treatement_red_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_red_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_2_treatement_red_3.interest, file = "Diffmeth.norm_treatement_red_2_treatement_red_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_red_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_2_treatement_red_3.interest.hyper, file = "Diffmeth.norm_treatement_red_2_treatement_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_red_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_2_treatement_red_3.interest.hypo, file = "Diffmeth.norm_treatement_red_2_treatement_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_2
###################################################################
#
#Diffmeth.norm_treatement_green_1_treatement_green_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_1_treatement_green_2, file = "Diffmeth.norm_treatement_green_1_treatement_green_2.rda")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_2, file = "Diffmeth.norm_treatement_green_1_treatement_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_1_treatement_green_2 done")
#
#Diffmeth.norm_treatement_green_1_treatement_green_2.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_2.interest, file = "Diffmeth.norm_treatement_green_1_treatement_green_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_2.interest.hyper, file = "Diffmeth.norm_treatement_green_1_treatement_green_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_2.interest.hypo, file = "Diffmeth.norm_treatement_green_1_treatement_green_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_3
###################################################################
#
#Diffmeth.norm_treatement_green_1_treatement_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_green_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_1_treatement_green_3, file = "Diffmeth.norm_treatement_green_1_treatement_green_3.rda")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_3, file = "Diffmeth.norm_treatement_green_1_treatement_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_1_treatement_green_3 done")
#
#Diffmeth.norm_treatement_green_1_treatement_green_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_3.interest, file = "Diffmeth.norm_treatement_green_1_treatement_green_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_3.interest.hyper, file = "Diffmeth.norm_treatement_green_1_treatement_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_1_treatement_green_3.interest.hypo, file = "Diffmeth.norm_treatement_green_1_treatement_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_green_3
###################################################################
#
#Diffmeth.norm_treatement_green_2_treatement_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_green_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_2_treatement_green_3, file = "Diffmeth.norm_treatement_green_2_treatement_green_3.rda")
#write.table(Diffmeth.norm_treatement_green_2_treatement_green_3, file = "Diffmeth.norm_treatement_green_2_treatement_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_2_treatement_green_3 done")
#
#Diffmeth.norm_treatement_green_2_treatement_green_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_2_treatement_green_3.interest, file = "Diffmeth.norm_treatement_green_2_treatement_green_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_treatement_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_2_treatement_green_3.interest.hyper, file = "Diffmeth.norm_treatement_green_2_treatement_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_treatement_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_2_treatement_green_3.interest.hypo, file = "Diffmeth.norm_treatement_green_2_treatement_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_2
###################################################################
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.rda")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_1_treatement_yellow_2 done")
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest.hyper, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_2.interest.hypo, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_3
###################################################################
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_yellow_1_treatement_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.rda")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_1_treatement_yellow_3 done")
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_1_treatement_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_yellow_1_treatement_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_yellow_2_treatement_yellow_3
###################################################################
#
#Diffmeth.norm_treatement_yellow_2_treatement_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_yellow_2_treatement_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3, file = "Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.rda")
#write.table(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3, file = "Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_yellow_2_treatement_yellow_3 done")
#
#Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest, file = "Diffmeth.norm_treatement_yellow_2_treatement_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_yellow_2_treatement_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_yellow_2_treatement_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_yellow_2_treatement_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_green_1
###################################################################
#
#Diffmeth.norm_treatement_red_1_treatement_green_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_green_1, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_treatement_green_1, file = "Diffmeth.norm_treatement_red_1_treatement_green_1.rda")
#write.table(Diffmeth.norm_treatement_red_1_treatement_green_1, file = "Diffmeth.norm_treatement_red_1_treatement_green_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_treatement_green_1 done")
#
#Diffmeth.norm_treatement_red_1_treatement_green_1.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_green_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_treatement_green_1.interest, file = "Diffmeth.norm_treatement_red_1_treatement_green_1_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_green_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_treatement_green_1.interest.hyper, file = "Diffmeth.norm_treatement_red_1_treatement_green_1_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_green_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_treatement_green_1.interest.hypo, file = "Diffmeth.norm_treatement_red_1_treatement_green_1_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_green_2
###################################################################
#
#Diffmeth.norm_treatement_red_2_treatement_green_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_green_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_2_treatement_green_2, file = "Diffmeth.norm_treatement_red_2_treatement_green_2.rda")
#write.table(Diffmeth.norm_treatement_red_2_treatement_green_2, file = "Diffmeth.norm_treatement_red_2_treatement_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_2_treatement_green_2 done")
#
#Diffmeth.norm_treatement_red_2_treatement_green_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_2_treatement_green_2.interest, file = "Diffmeth.norm_treatement_red_2_treatement_green_2_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_2_treatement_green_2.interest.hyper, file = "Diffmeth.norm_treatement_red_2_treatement_green_2_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_2_treatement_green_2.interest.hypo, file = "Diffmeth.norm_treatement_red_2_treatement_green_2_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_green_3
###################################################################
#
#Diffmeth.norm_treatement_red_3_treatement_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_green_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_3_treatement_green_3, file = "Diffmeth.norm_treatement_red_3_treatement_green_3.rda")
#write.table(Diffmeth.norm_treatement_red_3_treatement_green_3, file = "Diffmeth.norm_treatement_red_3_treatement_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_3_treatement_green_3 done")
#
#Diffmeth.norm_treatement_red_3_treatement_green_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_3_treatement_green_3.interest, file = "Diffmeth.norm_treatement_red_3_treatement_green_3_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_3_treatement_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_3_treatement_green_3.interest.hyper, file = "Diffmeth.norm_treatement_red_3_treatement_green_3_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_3_treatement_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_3_treatement_green_3.interest.hypo, file = "Diffmeth.norm_treatement_red_3_treatement_green_3_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_yellow_1
###################################################################
#
#Diffmeth.norm_treatement_red_1_treatement_yellow_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_1_treatement_yellow_1, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_1_treatement_yellow_1, file = "Diffmeth.norm_treatement_red_1_treatement_yellow_1.rda")
#write.table(Diffmeth.norm_treatement_red_1_treatement_yellow_1, file = "Diffmeth.norm_treatement_red_1_treatement_yellow_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_1_treatement_yellow_1 done")
#
#Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_yellow_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest, file = "Diffmeth.norm_treatement_red_1_treatement_yellow_1_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest.hyper, file = "Diffmeth.norm_treatement_red_1_treatement_yellow_1_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_1_treatement_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_1_treatement_yellow_1.interest.hypo, file = "Diffmeth.norm_treatement_red_1_treatement_yellow_1_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_yellow_2
###################################################################
#
#Diffmeth.norm_treatement_red_2_treatement_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_2_treatement_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_2_treatement_yellow_2, file = "Diffmeth.norm_treatement_red_2_treatement_yellow_2.rda")
#write.table(Diffmeth.norm_treatement_red_2_treatement_yellow_2, file = "Diffmeth.norm_treatement_red_2_treatement_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_2_treatement_yellow_2 done")
#
#Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest, file = "Diffmeth.norm_treatement_red_2_treatement_yellow_2_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest.hyper, file = "Diffmeth.norm_treatement_red_2_treatement_yellow_2_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_2_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_2_treatement_yellow_2.interest.hypo, file = "Diffmeth.norm_treatement_red_2_treatement_yellow_2_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_yellow_3
###################################################################
#
#Diffmeth.norm_treatement_red_3_treatement_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_red_3_treatement_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_red_3_treatement_yellow_3, file = "Diffmeth.norm_treatement_red_3_treatement_yellow_3.rda")
#write.table(Diffmeth.norm_treatement_red_3_treatement_yellow_3, file = "Diffmeth.norm_treatement_red_3_treatement_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_red_3_treatement_yellow_3 done")
#
#Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest, file = "Diffmeth.norm_treatement_red_3_treatement_yellow_3_treatement_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_red_3_treatement_yellow_3_treatement_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_red_3_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_red_3_treatement_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_red_3_treatement_yellow_3_treatement_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_yellow_1
###################################################################
#
#Diffmeth.norm_treatement_green_1_treatement_yellow_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_1_treatement_yellow_1, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_1_treatement_yellow_1, file = "Diffmeth.norm_treatement_green_1_treatement_yellow_1.rda")
#write.table(Diffmeth.norm_treatement_green_1_treatement_yellow_1, file = "Diffmeth.norm_treatement_green_1_treatement_yellow_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_1_treatement_yellow_1 done")
#
#Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_yellow_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest, file = "Diffmeth.norm_treatement_green_1_treatement_yellow_1_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest.hyper, file = "Diffmeth.norm_treatement_green_1_treatement_yellow_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_1_treatement_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_1_treatement_yellow_1.interest.hypo, file = "Diffmeth.norm_treatement_green_1_treatement_yellow_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_yellow_2
###################################################################
#
#Diffmeth.norm_treatement_green_2_treatement_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_2_treatement_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_2_treatement_yellow_2, file = "Diffmeth.norm_treatement_green_2_treatement_yellow_2.rda")
#write.table(Diffmeth.norm_treatement_green_2_treatement_yellow_2, file = "Diffmeth.norm_treatement_green_2_treatement_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_2_treatement_yellow_2 done")
#
#Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest, file = "Diffmeth.norm_treatement_green_2_treatement_yellow_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest.hyper, file = "Diffmeth.norm_treatement_green_2_treatement_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_2_treatement_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_2_treatement_yellow_2.interest.hypo, file = "Diffmeth.norm_treatement_green_2_treatement_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_treatement_green_3_treatement_yellow_3
###################################################################
#
#Diffmeth.norm_treatement_green_3_treatement_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_treatement_green_3_treatement_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_treatement_green_3_treatement_yellow_3, file = "Diffmeth.norm_treatement_green_3_treatement_yellow_3.rda")
#write.table(Diffmeth.norm_treatement_green_3_treatement_yellow_3, file = "Diffmeth.norm_treatement_green_3_treatement_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_treatement_green_3_treatement_yellow_3 done")
#
#Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest=getMethylDiff(Diffmeth.norm_treatement_green_3_treatement_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest, file = "Diffmeth.norm_treatement_green_3_treatement_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_treatement_green_3_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest.hyper, file = "Diffmeth.norm_treatement_green_3_treatement_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_treatement_green_3_treatement_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_treatement_green_3_treatement_yellow_3.interest.hypo, file = "Diffmeth.norm_treatement_green_3_treatement_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
##############################################################################################################
#################################################### REORGANIZE ##############################################
##############################################################################################################
## We need to reorganize because with have a lot of comparison and it's impossible to compare all the conditions togethers
#
##############################################################################################################
######################################### CONTROL: SAME COLOR against TIME #################################
##############################################################################################################
#
########################################### object from processBismarkAln ####################################
#
#control_red_1_control_red_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-180","2-R-180"),
#	treatment=c(1,0) )
#	
#control_red_1_control_red_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-180","3-R-180"),
#	treatment=c(1,0) )
#	
#control_red_2_control_red_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-180","3-R-180"),
#	treatment=c(1,0) )
#
#control_green_1_control_green_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-613","2-V-613"),
#	treatment=c(1,0) )
#
#control_green_1_control_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-613","3-V-613"),
#	treatment=c(1,0) )
#
#control_green_2_control_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-V-613","3-V-613"),
#	treatment=c(1,0) )
#	
#control_yellow_1_control_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("1-J-2","2-J-2"),
#	treatment=c(1,0) )
#
#control_yellow_1_control_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("1-J-2","3-J-2"),
#	treatment=c(1,0) )
#
#control_yellow_2_control_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-J-2","3-J-2"),
#	treatment=c(1,0) )
#
#control_red_1_control_green_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-180","1-V-613"),
#	treatment=c(1,0) )
#
#control_red_2_control_green_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-180","2-V-613"),
#	treatment=c(1,0) )
#
#control_red_3_control_green_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-180","2-V-613"),
#	treatment=c(1,0) )	
#
#control_red_1_control_yellow_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-R-180","1-J-2"),
#	treatment=c(1,0) )
#
#control_red_2_control_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-180","2-J-2"),
#	treatment=c(1,0) )
#
#control_red_3_control_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("2-R-180","3-J-2"),
#	treatment=c(1,0) )	
#
#control_green_1_control_yellow_1=reorganize(my_meth_all_together, 
#	sample.ids=c("1-V-613","1-J-2"),
#	treatment=c(1,0) )
#
#control_green_2_control_yellow_2=reorganize(my_meth_all_together, 
#	sample.ids=c("2-V-613","2-J-2"),
#	treatment=c(1,0) )
#
#control_green_3_control_yellow_3=reorganize(my_meth_all_together, 
#	sample.ids=c("3-V-613","3-J-2"),
#	treatment=c(1,0) )	
#
#
#
#
############################################# object from unite function #####################################
#
#
#filtered.normalized.myallmeth.10_unite_control_red_1_control_red_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-180","2-R-180"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_1_control_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-180","3-R-180"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_2_control_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-180","3-R-180"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_green_1_control_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-613","2-V-613"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_green_1_control_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-613","3-V-613"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_green_2_control_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-V-613","3-V-613"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-J-2","2-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-J-2","3-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_yellow_2_control_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-J-2","3-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_1_control_green_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-180","1-V-613"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_2_control_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-180","2-V-613"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_3_control_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-180","2-V-613"),
#	treatment=c(1,0) )	
#
#filtered.normalized.myallmeth.10_unite_control_red_1_control_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-R-180","1-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_2_control_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-180","2-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_red_3_control_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-R-180","3-J-2"),
#	treatment=c(1,0) )	
#
#filtered.normalized.myallmeth.10_unite_control_green_1_control_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("1-V-613","1-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_green_2_control_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("2-V-613","2-J-2"),
#	treatment=c(1,0) )
#
#filtered.normalized.myallmeth.10_unite_control_green_3_control_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
#	sample.ids=c("3-V-613","3-J-2"),
#	treatment=c(1,0) )	
#
#
#
#
##############################################################################################################
######################################### DIFFERENTIAL METHYLATION ANALYSIS ##################################
##############################################################################################################
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_1_control_red_2
###################################################################
#
#Diffmeth.norm_control_red_1_control_red_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_control_red_2, mc.cores = 4)
#save(Diffmeth.norm_control_red_1_control_red_2, file = "Diffmeth.norm_control_red_1_control_red_2.rda")
#write.table(Diffmeth.norm_control_red_1_control_red_2, file = "Diffmeth.norm_control_red_1_control_red_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_1_control_red_2 done")
#
#Diffmeth.norm_control_red_1_control_red_2.interest=getMethylDiff(Diffmeth.norm_control_red_1_control_red_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_1_control_red_2.interest, file = "Diffmeth.norm_control_red_1_control_red_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_red_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_control_red_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_1_control_red_2.interest.hyper, file = "Diffmeth.norm_control_red_1_control_red_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_red_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_control_red_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_1_control_red_2.interest.hypo, file = "Diffmeth.norm_control_red_1_control_red_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_1_control_red_3
###################################################################
#
#Diffmeth.norm_control_red_1_control_red_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_control_red_3, mc.cores = 4)
#save(Diffmeth.norm_control_red_1_control_red_3, file = "Diffmeth.norm_control_red_1_control_red_3.rda")
#write.table(Diffmeth.norm_control_red_1_control_red_3, file = "Diffmeth.norm_control_red_1_control_red_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_1_control_red_3 done")
#
#Diffmeth.norm_control_red_1_control_red_3.interest=getMethylDiff(Diffmeth.norm_control_red_1_control_red_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_1_control_red_3.interest, file = "Diffmeth.norm_control_red_1_control_red_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_control_red_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_1_control_red_3.interest.hyper, file = "Diffmeth.norm_control_red_1_control_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_control_red_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_1_control_red_3.interest.hypo, file = "Diffmeth.norm_control_red_1_control_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_2_control_red_3
###################################################################
#
#Diffmeth.norm_control_red_2_control_red_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_control_red_3, mc.cores = 4)
#save(Diffmeth.norm_control_red_2_control_red_3, file = "Diffmeth.norm_control_red_2_control_red_3.rda")
#write.table(Diffmeth.norm_control_red_2_control_red_3, file = "Diffmeth.norm_control_red_2_control_red_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_2_control_red_3 done")
#
#Diffmeth.norm_control_red_2_control_red_3.interest=getMethylDiff(Diffmeth.norm_control_red_2_control_red_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_2_control_red_3.interest, file = "Diffmeth.norm_control_red_2_control_red_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_control_red_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_2_control_red_3.interest.hyper, file = "Diffmeth.norm_control_red_2_control_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_control_red_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_2_control_red_3.interest.hypo, file = "Diffmeth.norm_control_red_2_control_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_control_green_2
###################################################################
#
#Diffmeth.norm_control_green_1_control_green_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_control_green_2, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_control_green_2, file = "Diffmeth.norm_control_green_1_control_green_2.rda")
#write.table(Diffmeth.norm_control_green_1_control_green_2, file = "Diffmeth.norm_control_green_1_control_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_control_green_2 done")
#
#Diffmeth.norm_control_green_1_control_green_2.interest=getMethylDiff(Diffmeth.norm_control_green_1_control_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_control_green_2.interest, file = "Diffmeth.norm_control_green_1_control_green_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_control_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_control_green_2.interest.hyper, file = "Diffmeth.norm_control_green_1_control_green_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_control_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_control_green_2.interest.hypo, file = "Diffmeth.norm_control_green_1_control_green_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_control_green_3
###################################################################
#
#Diffmeth.norm_control_green_1_control_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_control_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_control_green_3, file = "Diffmeth.norm_control_green_1_control_green_3.rda")
#write.table(Diffmeth.norm_control_green_1_control_green_3, file = "Diffmeth.norm_control_green_1_control_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_control_green_3 done")
#
#Diffmeth.norm_control_green_1_control_green_3.interest=getMethylDiff(Diffmeth.norm_control_green_1_control_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_control_green_3.interest, file = "Diffmeth.norm_control_green_1_control_green_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_control_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_control_green_3.interest.hyper, file = "Diffmeth.norm_control_green_1_control_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_control_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_control_green_3.interest.hypo, file = "Diffmeth.norm_control_green_1_control_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_2_control_green_3
###################################################################
#
#Diffmeth.norm_control_green_2_control_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_2_control_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_2_control_green_3, file = "Diffmeth.norm_control_green_2_control_green_3.rda")
#write.table(Diffmeth.norm_control_green_2_control_green_3, file = "Diffmeth.norm_control_green_2_control_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_2_control_green_3 done")
#
#Diffmeth.norm_control_green_2_control_green_3.interest=getMethylDiff(Diffmeth.norm_control_green_2_control_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_2_control_green_3.interest, file = "Diffmeth.norm_control_green_2_control_green_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_control_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_2_control_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_2_control_green_3.interest.hyper, file = "Diffmeth.norm_control_green_2_control_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_control_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_2_control_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_2_control_green_3.interest.hypo, file = "Diffmeth.norm_control_green_2_control_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_2
###################################################################
#
#Diffmeth.norm_control_yellow_1_control_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_control_yellow_1_control_yellow_2, file = "Diffmeth.norm_control_yellow_1_control_yellow_2.rda")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_2, file = "Diffmeth.norm_control_yellow_1_control_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_yellow_1_control_yellow_2 done")
#
#Diffmeth.norm_control_yellow_1_control_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_2.interest, file = "Diffmeth.norm_control_yellow_1_control_yellow_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_1_control_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_2.interest.hyper, file = "Diffmeth.norm_control_yellow_1_control_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_1_control_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_2.interest.hypo, file = "Diffmeth.norm_control_yellow_1_control_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_3
###################################################################
#
#Diffmeth.norm_control_yellow_1_control_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_1_control_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_control_yellow_1_control_yellow_3, file = "Diffmeth.norm_control_yellow_1_control_yellow_3.rda")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_3, file = "Diffmeth.norm_control_yellow_1_control_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_yellow_1_control_yellow_3 done")
#
#Diffmeth.norm_control_yellow_1_control_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_3.interest, file = "Diffmeth.norm_control_yellow_1_control_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_1_control_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_3.interest.hyper, file = "Diffmeth.norm_control_yellow_1_control_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_1_control_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_1_control_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_yellow_1_control_yellow_3.interest.hypo, file = "Diffmeth.norm_control_yellow_1_control_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_yellow_2_control_yellow_3
###################################################################
#
#Diffmeth.norm_control_yellow_2_control_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_2_control_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_control_yellow_2_control_yellow_3, file = "Diffmeth.norm_control_yellow_2_control_yellow_3.rda")
#write.table(Diffmeth.norm_control_yellow_2_control_yellow_3, file = "Diffmeth.norm_control_yellow_2_control_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_yellow_2_control_yellow_3 done")
#
#Diffmeth.norm_control_yellow_2_control_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_yellow_2_control_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_yellow_2_control_yellow_3.interest, file = "Diffmeth.norm_control_yellow_2_control_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_2_control_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_2_control_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_yellow_2_control_yellow_3.interest.hyper, file = "Diffmeth.norm_control_yellow_2_control_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_yellow_2_control_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_2_control_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_yellow_2_control_yellow_3.interest.hypo, file = "Diffmeth.norm_control_yellow_2_control_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_1_control_green_1
###################################################################
#
#Diffmeth.norm_control_red_1_control_green_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_control_green_1, mc.cores = 4)
#save(Diffmeth.norm_control_red_1_control_green_1, file = "Diffmeth.norm_control_red_1_control_green_1.rda")
#write.table(Diffmeth.norm_control_red_1_control_green_1, file = "Diffmeth.norm_control_red_1_control_green_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_1_control_green_1 done")
#
#Diffmeth.norm_control_red_1_control_green_1.interest=getMethylDiff(Diffmeth.norm_control_red_1_control_green_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_1_control_green_1.interest, file = "Diffmeth.norm_control_red_1_control_green_1_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_control_green_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_1_control_green_1.interest.hyper, file = "Diffmeth.norm_control_red_1_control_green_1_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_control_green_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_1_control_green_1.interest.hypo, file = "Diffmeth.norm_control_red_1_control_green_1_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_2_control_green_2
###################################################################
#
#Diffmeth.norm_control_red_2_control_green_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_control_green_2, mc.cores = 4)
#save(Diffmeth.norm_control_red_2_control_green_2, file = "Diffmeth.norm_control_red_2_control_green_2.rda")
#write.table(Diffmeth.norm_control_red_2_control_green_2, file = "Diffmeth.norm_control_red_2_control_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_2_control_green_2 done")
#
#Diffmeth.norm_control_red_2_control_green_2.interest=getMethylDiff(Diffmeth.norm_control_red_2_control_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_2_control_green_2.interest, file = "Diffmeth.norm_control_red_2_control_green_2_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_control_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_2_control_green_2.interest.hyper, file = "Diffmeth.norm_control_red_2_control_green_2_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_control_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_2_control_green_2.interest.hypo, file = "Diffmeth.norm_control_red_2_control_green_2_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_3_control_green_3
###################################################################
#
#Diffmeth.norm_control_red_3_control_green_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_3_control_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_red_3_control_green_3, file = "Diffmeth.norm_control_red_3_control_green_3.rda")
#write.table(Diffmeth.norm_control_red_3_control_green_3, file = "Diffmeth.norm_control_red_3_control_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_3_control_green_3 done")
#
#Diffmeth.norm_control_red_3_control_green_3.interest=getMethylDiff(Diffmeth.norm_control_red_3_control_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_3_control_green_3.interest, file = "Diffmeth.norm_control_red_3_control_green_3_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_3_control_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_3_control_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_3_control_green_3.interest.hyper, file = "Diffmeth.norm_control_red_3_control_green_3_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_3_control_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_3_control_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_3_control_green_3.interest.hypo, file = "Diffmeth.norm_control_red_3_control_green_3_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_1_control_yellow_1
###################################################################
#
#Diffmeth.norm_control_red_1_control_yellow_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_control_yellow_1, mc.cores = 4)
#save(Diffmeth.norm_control_red_1_control_yellow_1, file = "Diffmeth.norm_control_red_1_control_yellow_1.rda")
#write.table(Diffmeth.norm_control_red_1_control_yellow_1, file = "Diffmeth.norm_control_red_1_control_yellow_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_1_control_yellow_1 done")
#
#Diffmeth.norm_control_red_1_control_yellow_1.interest=getMethylDiff(Diffmeth.norm_control_red_1_control_yellow_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_1_control_yellow_1.interest, file = "Diffmeth.norm_control_red_1_control_yellow_1_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_control_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_1_control_yellow_1.interest.hyper, file = "Diffmeth.norm_control_red_1_control_yellow_1_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_control_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_control_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_1_control_yellow_1.interest.hypo, file = "Diffmeth.norm_control_red_1_control_yellow_1_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_2_control_yellow_2
###################################################################
#
#Diffmeth.norm_control_red_2_control_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_control_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_control_red_2_control_yellow_2, file = "Diffmeth.norm_control_red_2_control_yellow_2.rda")
#write.table(Diffmeth.norm_control_red_2_control_yellow_2, file = "Diffmeth.norm_control_red_2_control_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_2_control_yellow_2 done")
#
#Diffmeth.norm_control_red_2_control_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_red_2_control_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_2_control_yellow_2.interest, file = "Diffmeth.norm_control_red_2_control_yellow_2_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_control_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_2_control_yellow_2.interest.hyper, file = "Diffmeth.norm_control_red_2_control_yellow_2_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_2_control_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_control_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_2_control_yellow_2.interest.hypo, file = "Diffmeth.norm_control_red_2_control_yellow_2_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_3_control_yellow_3
###################################################################
#
#Diffmeth.norm_control_red_3_control_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_3_control_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_control_red_3_control_yellow_3, file = "Diffmeth.norm_control_red_3_control_yellow_3.rda")
#write.table(Diffmeth.norm_control_red_3_control_yellow_3, file = "Diffmeth.norm_control_red_3_control_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_3_control_yellow_3 done")
#
#Diffmeth.norm_control_red_3_control_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_red_3_control_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_3_control_yellow_3.interest, file = "Diffmeth.norm_control_red_3_control_yellow_3_control_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_3_control_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_3_control_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_3_control_yellow_3.interest.hyper, file = "Diffmeth.norm_control_red_3_control_yellow_3_control_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_3_control_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_3_control_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_3_control_yellow_3.interest.hypo, file = "Diffmeth.norm_control_red_3_control_yellow_3_control_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_control_yellow_1
###################################################################
#
#Diffmeth.norm_control_green_1_control_yellow_1=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_control_yellow_1, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_control_yellow_1, file = "Diffmeth.norm_control_green_1_control_yellow_1.rda")
#write.table(Diffmeth.norm_control_green_1_control_yellow_1, file = "Diffmeth.norm_control_green_1_control_yellow_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_control_yellow_1 done")
#
#Diffmeth.norm_control_green_1_control_yellow_1.interest=getMethylDiff(Diffmeth.norm_control_green_1_control_yellow_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_control_yellow_1.interest, file = "Diffmeth.norm_control_green_1_control_yellow_1_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_control_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_control_yellow_1.interest.hyper, file = "Diffmeth.norm_control_green_1_control_yellow_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_control_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_control_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_control_yellow_1.interest.hypo, file = "Diffmeth.norm_control_green_1_control_yellow_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_2_control_yellow_2
###################################################################
#
#Diffmeth.norm_control_green_2_control_yellow_2=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_2_control_yellow_2, mc.cores = 4)
#save(Diffmeth.norm_control_green_2_control_yellow_2, file = "Diffmeth.norm_control_green_2_control_yellow_2.rda")
#write.table(Diffmeth.norm_control_green_2_control_yellow_2, file = "Diffmeth.norm_control_green_2_control_yellow_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_2_control_yellow_2 done")
#
#Diffmeth.norm_control_green_2_control_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_green_2_control_yellow_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_2_control_yellow_2.interest, file = "Diffmeth.norm_control_green_2_control_yellow_2_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_control_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_2_control_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_2_control_yellow_2.interest.hyper, file = "Diffmeth.norm_control_green_2_control_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_control_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_2_control_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_2_control_yellow_2.interest.hypo, file = "Diffmeth.norm_control_green_2_control_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_3_control_yellow_3
###################################################################
#
#Diffmeth.norm_control_green_3_control_yellow_3=calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_3_control_yellow_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_3_control_yellow_3, file = "Diffmeth.norm_control_green_3_control_yellow_3.rda")
#write.table(Diffmeth.norm_control_green_3_control_yellow_3, file = "Diffmeth.norm_control_green_3_control_yellow_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_3_control_yellow_3 done")
#
#Diffmeth.norm_control_green_3_control_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_green_3_control_yellow_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_3_control_yellow_3.interest, file = "Diffmeth.norm_control_green_3_control_yellow_3_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_control_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_3_control_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_3_control_yellow_3.interest.hyper, file = "Diffmeth.norm_control_green_3_control_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_control_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_3_control_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_3_control_yellow_3.interest.hypo, file = "Diffmeth.norm_control_green_3_control_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#












#############################################################################################################
################################################### REORGANIZE ##############################################
#############################################################################################################
# We need to reorganize because with have a lot of comparison and it's impossible to compare all the conditions togethers

#############################################################################################################
############################################## CONTROL VS TREATMENT #########################################
#############################################################################################################

########################################## object from processBismarkAln ####################################


control_red_1_treament_red_1=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180","1-R-183"),
	treatment=c(1,0) )
	
control_red_1_treament_red_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180","2-R-183"),
	treatment=c(1,0) )

control_red_1_treament_red_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180","3-R-183"),
	treatment=c(1,0) )	
	
control_red_2_treament_red_1=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180","1-R-183"),
	treatment=c(1,0) )
	
control_red_2_treament_red_2=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180","2-R-183"),
	treatment=c(1,0) )
	
control_red_2_treament_red_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180","3-R-183"),
	treatment=c(1,0) )

control_red_3_treament_red_1=reorganize(my_meth_all_together, 
	sample.ids=c("3-R-180","1-R-183"),
	treatment=c(1,0) )

control_red_3_treament_red_2=reorganize(my_meth_all_together, 
	sample.ids=c("3-R-180","2-R-183"),
	treatment=c(1,0) )
		
control_red_3_treament_red_3=reorganize(my_meth_all_together, 
	sample.ids=c("3-R-180","3-R-183"),
	treatment=c(1,0) )
	
	
	
	
	
	
	
	
control_green_1_treament_green_1=reorganize(my_meth_all_together, 
	sample.ids=c("1-V-613","1-V-620"),
	treatment=c(1,0) )

control_green_1_treament_green_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-V-613","2-V-620"),
	treatment=c(1,0) )

control_green_1_treament_green_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-V-613","3-V-620"),
	treatment=c(1,0) )	

control_green_2_treament_green_1=reorganize(my_meth_all_together, 
	sample.ids=c("2-V-613","1-V-620"),
	treatment=c(1,0) )

control_green_2_treament_green_2=reorganize(my_meth_all_together, 
	sample.ids=c("2-V-613","2-V-620"),
	treatment=c(1,0) )

control_green_2_treament_green_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-V-613","3-V-620"),
	treatment=c(1,0) )

control_green_3_treament_green_1=reorganize(my_meth_all_together, 
	sample.ids=c("3-V-613","1-V-620"),
	treatment=c(1,0) )

control_green_3_treament_green_2=reorganize(my_meth_all_together, 
	sample.ids=c("3-V-613","2-V-620"),
	treatment=c(1,0) )
	
control_green_3_treament_green_3=reorganize(my_meth_all_together, 
	sample.ids=c("3-V-613","3-V-620"),
	treatment=c(1,0) )	


	
	
	
	
control_yellow_1_treament_yellow_1=reorganize(my_meth_all_together, 
	sample.ids=c("1-J-2","1-J-7"),
	treatment=c(1,0) )

control_yellow_1_treament_yellow_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-J-2","2-J-7"),
	treatment=c(1,0) )

control_yellow_1_treament_yellow_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-J-2","3-J-7"),
	treatment=c(1,0) )	

control_yellow_2_treament_yellow_1=reorganize(my_meth_all_together, 
	sample.ids=c("2-J-2","1-J-7"),
	treatment=c(1,0) )

control_yellow_2_treament_yellow_2=reorganize(my_meth_all_together, 
	sample.ids=c("2-J-2","2-J-7"),
	treatment=c(1,0) )

control_yellow_2_treament_yellow_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-J-2","3-J-7"),
	treatment=c(1,0) )

control_yellow_3_treament_yellow_1=reorganize(my_meth_all_together, 
	sample.ids=c("3-J-2","1-J-7"),
	treatment=c(1,0) )

control_yellow_3_treament_yellow_2=reorganize(my_meth_all_together, 
	sample.ids=c("3-J-2","2-J-7"),
	treatment=c(1,0) )

control_yellow_3_treament_yellow_3=reorganize(my_meth_all_together, 
	sample.ids=c("3-J-2","3-J-7"),
	treatment=c(1,0) )	


############################################ object from unite function #####################################



filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180","1-R-183"),
	treatment=c(1,0) )
	
filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180","2-R-183"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180","3-R-183"),
	treatment=c(1,0) )	
	
filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180","1-R-183"),
	treatment=c(1,0) )
	
filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180","2-R-183"),
	treatment=c(1,0) )
	
filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180","3-R-183"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-R-180","1-R-183"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-R-180","2-R-183"),
	treatment=c(1,0) )
		
filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-R-180","3-R-183"),
	treatment=c(1,0) )
	
	
	
	
	
	
	
	
filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-V-613","1-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-V-613","2-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-V-613","3-V-620"),
	treatment=c(1,0) )	

filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-V-613","1-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-V-613","2-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-V-613","3-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-V-613","1-V-620"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-V-613","2-V-620"),
	treatment=c(1,0) )
	
filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-V-613","3-V-620"),
	treatment=c(1,0) )	


	
	
	
	
filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-J-2","1-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-J-2","2-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-J-2","3-J-7"),
	treatment=c(1,0) )	

filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-J-2","1-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-J-2","2-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-J-2","3-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-J-2","1-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-J-2","2-J-7"),
	treatment=c(1,0) )

filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-J-2","3-J-7"),
	treatment=c(1,0) )	



##############################################################################################################
######################################### DIFFERENTIAL METHYLATION ANALYSIS ##################################
##############################################################################################################
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_1
###################################################################
#
#Diffmeth.norm_control_red_1_treament_red_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_1, mc.cores = 4)
#save(Diffmeth.norm_control_red_1_treament_red_1, file = "Diffmeth.norm_control_red_1_treament_red_1.rda")
#write.table(DDiffmeth.norm_control_red_1_treament_red_1, file = "Diffmeth.norm_control_red_1_treament_red_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_red_1_treament_red_1 done")
#
#Diffmeth.norm_control_red_1_treament_red_1.interest=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_red_1_treament_red_1.interest, file = "Diffmeth.norm_control_red_1_treament_red_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_treament_red_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_red_1_treament_red_1.interest.hyper, file = "Diffmeth.norm_control_red_1_treament_red_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_red_1_treament_red_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_red_1_treament_red_1.interest.hypo, file = "Diffmeth.norm_control_red_1_treament_red_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_1
###################################################################
#
#Diffmeth.norm_control_green_1_treament_green_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_1, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_treament_green_1, file = "Diffmeth.norm_control_green_1_treament_green_1.rda")
#write.table(DDiffmeth.norm_control_green_1_treament_green_1, file = "Diffmeth.norm_control_green_1_treament_green_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_treament_green_1 done")
#
#Diffmeth.norm_control_green_1_treament_green_1.interest=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_treament_green_1.interest, file = "Diffmeth.norm_control_green_1_treament_green_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_treament_green_1.interest.hyper, file = "Diffmeth.norm_control_green_1_treament_green_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_treament_green_1.interest.hypo, file = "Diffmeth.norm_control_green_1_treament_green_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_2
###################################################################
#
#Diffmeth.norm_control_green_1_treament_green_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_2, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_treament_green_2, file = "Diffmeth.norm_control_green_1_treament_green_2.rda")
#write.table(DDiffmeth.norm_control_green_1_treament_green_2, file = "Diffmeth.norm_control_green_1_treament_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_treament_green_2 done")
#
#Diffmeth.norm_control_green_1_treament_green_2.interest=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_treament_green_2.interest, file = "Diffmeth.norm_control_green_1_treament_green_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_treament_green_2.interest.hyper, file = "Diffmeth.norm_control_green_1_treament_green_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_treament_green_2.interest.hypo, file = "Diffmeth.norm_control_green_1_treament_green_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_3
###################################################################
#
#Diffmeth.norm_control_green_1_treament_green_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_1_treament_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_1_treament_green_3, file = "Diffmeth.norm_control_green_1_treament_green_3.rda")
#write.table(DDiffmeth.norm_control_green_1_treament_green_3, file = "Diffmeth.norm_control_green_1_treament_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_1_treament_green_3 done")
#
#Diffmeth.norm_control_green_1_treament_green_3.interest=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_1_treament_green_3.interest, file = "Diffmeth.norm_control_green_1_treament_green_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_1_treament_green_3.interest.hyper, file = "Diffmeth.norm_control_green_1_treament_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_1_treament_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_1_treament_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_1_treament_green_3.interest.hypo, file = "Diffmeth.norm_control_green_1_treament_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_1
###################################################################
#
#Diffmeth.norm_control_green_2_treament_green_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_1, mc.cores = 4)
#save(Diffmeth.norm_control_green_2_treament_green_1, file = "Diffmeth.norm_control_green_2_treament_green_1.rda")
#write.table(DDiffmeth.norm_control_green_2_treament_green_1, file = "Diffmeth.norm_control_green_2_treament_green_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_2_treament_green_1 done")
#
#Diffmeth.norm_control_green_2_treament_green_1.interest=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_2_treament_green_1.interest, file = "Diffmeth.norm_control_green_2_treament_green_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_2_treament_green_1.interest.hyper, file = "Diffmeth.norm_control_green_2_treament_green_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_2_treament_green_1.interest.hypo, file = "Diffmeth.norm_control_green_2_treament_green_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_2
###################################################################
#
#Diffmeth.norm_control_green_2_treament_green_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_2, mc.cores = 4)
#save(Diffmeth.norm_control_green_2_treament_green_2, file = "Diffmeth.norm_control_green_2_treament_green_2.rda")
#write.table(DDiffmeth.norm_control_green_2_treament_green_2, file = "Diffmeth.norm_control_green_2_treament_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_2_treament_green_2 done")
#
#Diffmeth.norm_control_green_2_treament_green_2.interest=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_2_treament_green_2.interest, file = "Diffmeth.norm_control_green_2_treament_green_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_2_treament_green_2.interest.hyper, file = "Diffmeth.norm_control_green_2_treament_green_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_2_treament_green_2.interest.hypo, file = "Diffmeth.norm_control_green_2_treament_green_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_3
###################################################################
#
#Diffmeth.norm_control_green_2_treament_green_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_2_treament_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_2_treament_green_3, file = "Diffmeth.norm_control_green_2_treament_green_3.rda")
#write.table(DDiffmeth.norm_control_green_2_treament_green_3, file = "Diffmeth.norm_control_green_2_treament_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_2_treament_green_3 done")
#
#Diffmeth.norm_control_green_2_treament_green_3.interest=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_2_treament_green_3.interest, file = "Diffmeth.norm_control_green_2_treament_green_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_2_treament_green_3.interest.hyper, file = "Diffmeth.norm_control_green_2_treament_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_2_treament_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_2_treament_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_2_treament_green_3.interest.hypo, file = "Diffmeth.norm_control_green_2_treament_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_1
###################################################################
#
#Diffmeth.norm_control_green_3_treament_green_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_1, mc.cores = 4)
#save(Diffmeth.norm_control_green_3_treament_green_1, file = "Diffmeth.norm_control_green_3_treament_green_1.rda")
#write.table(DDiffmeth.norm_control_green_3_treament_green_1, file = "Diffmeth.norm_control_green_3_treament_green_1.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_3_treament_green_1 done")
#
#Diffmeth.norm_control_green_3_treament_green_1.interest=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_1, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_3_treament_green_1.interest, file = "Diffmeth.norm_control_green_3_treament_green_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_1, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_3_treament_green_1.interest.hyper, file = "Diffmeth.norm_control_green_3_treament_green_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_1, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_3_treament_green_1.interest.hypo, file = "Diffmeth.norm_control_green_3_treament_green_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_2
###################################################################
#
#Diffmeth.norm_control_green_3_treament_green_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_2, mc.cores = 4)
#save(Diffmeth.norm_control_green_3_treament_green_2, file = "Diffmeth.norm_control_green_3_treament_green_2.rda")
#write.table(DDiffmeth.norm_control_green_3_treament_green_2, file = "Diffmeth.norm_control_green_3_treament_green_2.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_3_treament_green_2 done")
#
#Diffmeth.norm_control_green_3_treament_green_2.interest=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_2, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_3_treament_green_2.interest, file = "Diffmeth.norm_control_green_3_treament_green_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_2, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_3_treament_green_2.interest.hyper, file = "Diffmeth.norm_control_green_3_treament_green_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_2, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_3_treament_green_2.interest.hypo, file = "Diffmeth.norm_control_green_3_treament_green_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#
#
#
###################################################################
## filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_3
###################################################################
#
#Diffmeth.norm_control_green_3_treament_green_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_green_3_treament_green_3, mc.cores = 4)
#save(Diffmeth.norm_control_green_3_treament_green_3, file = "Diffmeth.norm_control_green_3_treament_green_3.rda")
#write.table(DDiffmeth.norm_control_green_3_treament_green_3, file = "Diffmeth.norm_control_green_3_treament_green_3.txt", sep = "\t", quote = FALSE)
#message("Diffmeth.norm_control_green_3_treament_green_3 done")
#
#Diffmeth.norm_control_green_3_treament_green_3.interest=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_3, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm_control_green_3_treament_green_3.interest, file = "Diffmeth.norm_control_green_3_treament_green_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_3, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm_control_green_3_treament_green_3.interest.hyper, file = "Diffmeth.norm_control_green_3_treament_green_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm_control_green_3_treament_green_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_green_3_treament_green_3, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm_control_green_3_treament_green_3.interest.hypo, file = "Diffmeth.norm_control_green_3_treament_green_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#



##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_1
##################################################################

Diffmeth.norm_control_red_1_treament_red_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_1, mc.cores = 4)
save(Diffmeth.norm_control_red_1_treament_red_1, file = "Diffmeth.norm_control_red_1_treament_red_1.rda")
write.table(DDiffmeth.norm_control_red_1_treament_red_1, file = "Diffmeth.norm_control_red_1_treament_red_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_1_treament_red_1 done")

Diffmeth.norm_control_red_1_treament_red_1.interest=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_1_treament_red_1.interest, file = "Diffmeth.norm_control_red_1_treament_red_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_1_treament_red_1.interest.hyper, file = "Diffmeth.norm_control_red_1_treament_red_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_1_treament_red_1.interest.hypo, file = "Diffmeth.norm_control_red_1_treament_red_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_2
##################################################################

Diffmeth.norm_control_red_1_treament_red_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_2, mc.cores = 4)
save(Diffmeth.norm_control_red_1_treament_red_2, file = "Diffmeth.norm_control_red_1_treament_red_2.rda")
write.table(DDiffmeth.norm_control_red_1_treament_red_2, file = "Diffmeth.norm_control_red_1_treament_red_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_1_treament_red_2 done")

Diffmeth.norm_control_red_1_treament_red_2.interest=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_1_treament_red_2.interest, file = "Diffmeth.norm_control_red_1_treament_red_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_1_treament_red_2.interest.hyper, file = "Diffmeth.norm_control_red_1_treament_red_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_1_treament_red_2.interest.hypo, file = "Diffmeth.norm_control_red_1_treament_red_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_3
##################################################################

Diffmeth.norm_control_red_1_treament_red_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_1_treament_red_3, mc.cores = 4)
save(Diffmeth.norm_control_red_1_treament_red_3, file = "Diffmeth.norm_control_red_1_treament_red_3.rda")
write.table(DDiffmeth.norm_control_red_1_treament_red_3, file = "Diffmeth.norm_control_red_1_treament_red_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_1_treament_red_3 done")

Diffmeth.norm_control_red_1_treament_red_3.interest=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_1_treament_red_3.interest, file = "Diffmeth.norm_control_red_1_treament_red_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_1_treament_red_3.interest.hyper, file = "Diffmeth.norm_control_red_1_treament_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_1_treament_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_1_treament_red_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_1_treament_red_3.interest.hypo, file = "Diffmeth.norm_control_red_1_treament_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_1
##################################################################

Diffmeth.norm_control_red_2_treament_red_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_1, mc.cores = 4)
save(Diffmeth.norm_control_red_2_treament_red_1, file = "Diffmeth.norm_control_red_2_treament_red_1.rda")
write.table(DDiffmeth.norm_control_red_2_treament_red_1, file = "Diffmeth.norm_control_red_2_treament_red_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_2_treament_red_1 done")

Diffmeth.norm_control_red_2_treament_red_1.interest=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_2_treament_red_1.interest, file = "Diffmeth.norm_control_red_2_treament_red_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_2_treament_red_1.interest.hyper, file = "Diffmeth.norm_control_red_2_treament_red_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_2_treament_red_1.interest.hypo, file = "Diffmeth.norm_control_red_2_treament_red_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_2
##################################################################

Diffmeth.norm_control_red_2_treament_red_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_2, mc.cores = 4)
save(Diffmeth.norm_control_red_2_treament_red_2, file = "Diffmeth.norm_control_red_2_treament_red_2.rda")
write.table(DDiffmeth.norm_control_red_2_treament_red_2, file = "Diffmeth.norm_control_red_2_treament_red_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_2_treament_red_2 done")

Diffmeth.norm_control_red_2_treament_red_2.interest=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_2_treament_red_2.interest, file = "Diffmeth.norm_control_red_2_treament_red_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_2_treament_red_2.interest.hyper, file = "Diffmeth.norm_control_red_2_treament_red_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_2_treament_red_2.interest.hypo, file = "Diffmeth.norm_control_red_2_treament_red_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_3
##################################################################

Diffmeth.norm_control_red_2_treament_red_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_2_treament_red_3, mc.cores = 4)
save(Diffmeth.norm_control_red_2_treament_red_3, file = "Diffmeth.norm_control_red_2_treament_red_3.rda")
write.table(DDiffmeth.norm_control_red_2_treament_red_3, file = "Diffmeth.norm_control_red_2_treament_red_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_2_treament_red_3 done")

Diffmeth.norm_control_red_2_treament_red_3.interest=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_2_treament_red_3.interest, file = "Diffmeth.norm_control_red_2_treament_red_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_2_treament_red_3.interest.hyper, file = "Diffmeth.norm_control_red_2_treament_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_2_treament_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_2_treament_red_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_2_treament_red_3.interest.hypo, file = "Diffmeth.norm_control_red_2_treament_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_1
##################################################################

Diffmeth.norm_control_red_3_treament_red_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_1, mc.cores = 4)
save(Diffmeth.norm_control_red_3_treament_red_1, file = "Diffmeth.norm_control_red_3_treament_red_1.rda")
write.table(DDiffmeth.norm_control_red_3_treament_red_1, file = "Diffmeth.norm_control_red_3_treament_red_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_3_treament_red_1 done")

Diffmeth.norm_control_red_3_treament_red_1.interest=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_3_treament_red_1.interest, file = "Diffmeth.norm_control_red_3_treament_red_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_3_treament_red_1.interest.hyper, file = "Diffmeth.norm_control_red_3_treament_red_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_3_treament_red_1.interest.hypo, file = "Diffmeth.norm_control_red_3_treament_red_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_2
##################################################################

Diffmeth.norm_control_red_3_treament_red_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_2, mc.cores = 4)
save(Diffmeth.norm_control_red_3_treament_red_2, file = "Diffmeth.norm_control_red_3_treament_red_2.rda")
write.table(DDiffmeth.norm_control_red_3_treament_red_2, file = "Diffmeth.norm_control_red_3_treament_red_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_3_treament_red_2 done")

Diffmeth.norm_control_red_3_treament_red_2.interest=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_3_treament_red_2.interest, file = "Diffmeth.norm_control_red_3_treament_red_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_3_treament_red_2.interest.hyper, file = "Diffmeth.norm_control_red_3_treament_red_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_3_treament_red_2.interest.hypo, file = "Diffmeth.norm_control_red_3_treament_red_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_3
##################################################################

Diffmeth.norm_control_red_3_treament_red_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_red_3_treament_red_3, mc.cores = 4)
save(Diffmeth.norm_control_red_3_treament_red_3, file = "Diffmeth.norm_control_red_3_treament_red_3.rda")
write.table(DDiffmeth.norm_control_red_3_treament_red_3, file = "Diffmeth.norm_control_red_3_treament_red_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_red_3_treament_red_3 done")

Diffmeth.norm_control_red_3_treament_red_3.interest=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_red_3_treament_red_3.interest, file = "Diffmeth.norm_control_red_3_treament_red_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_red_3_treament_red_3.interest.hyper, file = "Diffmeth.norm_control_red_3_treament_red_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_red_3_treament_red_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_red_3_treament_red_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_red_3_treament_red_3.interest.hypo, file = "Diffmeth.norm_control_red_3_treament_red_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_1
##################################################################

Diffmeth.norm_control_yellow_1_treament_yellow_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_1, mc.cores = 4)
save(Diffmeth.norm_control_yellow_1_treament_yellow_1, file = "Diffmeth.norm_control_yellow_1_treament_yellow_1.rda")
write.table(DDiffmeth.norm_control_yellow_1_treament_yellow_1, file = "Diffmeth.norm_control_yellow_1_treament_yellow_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_1_treament_yellow_1 done")

Diffmeth.norm_control_yellow_1_treament_yellow_1.interest=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_1.interest, file = "Diffmeth.norm_control_yellow_1_treament_yellow_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_1.interest.hyper, file = "Diffmeth.norm_control_yellow_1_treament_yellow_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_1.interest.hypo, file = "Diffmeth.norm_control_yellow_1_treament_yellow_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_2
##################################################################

Diffmeth.norm_control_yellow_1_treament_yellow_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_2, mc.cores = 4)
save(Diffmeth.norm_control_yellow_1_treament_yellow_2, file = "Diffmeth.norm_control_yellow_1_treament_yellow_2.rda")
write.table(DDiffmeth.norm_control_yellow_1_treament_yellow_2, file = "Diffmeth.norm_control_yellow_1_treament_yellow_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_1_treament_yellow_2 done")

Diffmeth.norm_control_yellow_1_treament_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_2.interest, file = "Diffmeth.norm_control_yellow_1_treament_yellow_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_2.interest.hyper, file = "Diffmeth.norm_control_yellow_1_treament_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_2.interest.hypo, file = "Diffmeth.norm_control_yellow_1_treament_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_3
##################################################################

Diffmeth.norm_control_yellow_1_treament_yellow_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_1_treament_yellow_3, mc.cores = 4)
save(Diffmeth.norm_control_yellow_1_treament_yellow_3, file = "Diffmeth.norm_control_yellow_1_treament_yellow_3.rda")
write.table(DDiffmeth.norm_control_yellow_1_treament_yellow_3, file = "Diffmeth.norm_control_yellow_1_treament_yellow_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_1_treament_yellow_3 done")

Diffmeth.norm_control_yellow_1_treament_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_3.interest, file = "Diffmeth.norm_control_yellow_1_treament_yellow_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_3.interest.hyper, file = "Diffmeth.norm_control_yellow_1_treament_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_1_treament_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_1_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_1_treament_yellow_3.interest.hypo, file = "Diffmeth.norm_control_yellow_1_treament_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_1
##################################################################

Diffmeth.norm_control_yellow_2_treament_yellow_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_1, mc.cores = 4)
save(Diffmeth.norm_control_yellow_2_treament_yellow_1, file = "Diffmeth.norm_control_yellow_2_treament_yellow_1.rda")
write.table(DDiffmeth.norm_control_yellow_2_treament_yellow_1, file = "Diffmeth.norm_control_yellow_2_treament_yellow_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_2_treament_yellow_1 done")

Diffmeth.norm_control_yellow_2_treament_yellow_1.interest=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_1.interest, file = "Diffmeth.norm_control_yellow_2_treament_yellow_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_1.interest.hyper, file = "Diffmeth.norm_control_yellow_2_treament_yellow_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_1.interest.hypo, file = "Diffmeth.norm_control_yellow_2_treament_yellow_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_2
##################################################################

Diffmeth.norm_control_yellow_2_treament_yellow_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_2, mc.cores = 4)
save(Diffmeth.norm_control_yellow_2_treament_yellow_2, file = "Diffmeth.norm_control_yellow_2_treament_yellow_2.rda")
write.table(DDiffmeth.norm_control_yellow_2_treament_yellow_2, file = "Diffmeth.norm_control_yellow_2_treament_yellow_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_2_treament_yellow_2 done")

Diffmeth.norm_control_yellow_2_treament_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_2.interest, file = "Diffmeth.norm_control_yellow_2_treament_yellow_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_2.interest.hyper, file = "Diffmeth.norm_control_yellow_2_treament_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_2.interest.hypo, file = "Diffmeth.norm_control_yellow_2_treament_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_3
##################################################################

Diffmeth.norm_control_yellow_2_treament_yellow_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_2_treament_yellow_3, mc.cores = 4)
save(Diffmeth.norm_control_yellow_2_treament_yellow_3, file = "Diffmeth.norm_control_yellow_2_treament_yellow_3.rda")
write.table(DDiffmeth.norm_control_yellow_2_treament_yellow_3, file = "Diffmeth.norm_control_yellow_2_treament_yellow_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_2_treament_yellow_3 done")

Diffmeth.norm_control_yellow_2_treament_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_3.interest, file = "Diffmeth.norm_control_yellow_2_treament_yellow_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_3.interest.hyper, file = "Diffmeth.norm_control_yellow_2_treament_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_2_treament_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_2_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_2_treament_yellow_3.interest.hypo, file = "Diffmeth.norm_control_yellow_2_treament_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_1
##################################################################

Diffmeth.norm_control_yellow_3_treament_yellow_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_1, mc.cores = 4)
save(Diffmeth.norm_control_yellow_3_treament_yellow_1, file = "Diffmeth.norm_control_yellow_3_treament_yellow_1.rda")
write.table(DDiffmeth.norm_control_yellow_3_treament_yellow_1, file = "Diffmeth.norm_control_yellow_3_treament_yellow_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_3_treament_yellow_1 done")

Diffmeth.norm_control_yellow_3_treament_yellow_1.interest=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_1.interest, file = "Diffmeth.norm_control_yellow_3_treament_yellow_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_1.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_1.interest.hyper, file = "Diffmeth.norm_control_yellow_3_treament_yellow_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_1.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_1.interest.hypo, file = "Diffmeth.norm_control_yellow_3_treament_yellow_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_2
##################################################################

Diffmeth.norm_control_yellow_3_treament_yellow_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_2, mc.cores = 4)
save(Diffmeth.norm_control_yellow_3_treament_yellow_2, file = "Diffmeth.norm_control_yellow_3_treament_yellow_2.rda")
write.table(DDiffmeth.norm_control_yellow_3_treament_yellow_2, file = "Diffmeth.norm_control_yellow_3_treament_yellow_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_3_treament_yellow_2 done")

Diffmeth.norm_control_yellow_3_treament_yellow_2.interest=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_2.interest, file = "Diffmeth.norm_control_yellow_3_treament_yellow_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_2.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_2.interest.hyper, file = "Diffmeth.norm_control_yellow_3_treament_yellow_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_2.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_2.interest.hypo, file = "Diffmeth.norm_control_yellow_3_treament_yellow_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




##################################################################
# filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_3
##################################################################

Diffmeth.norm_control_yellow_3_treament_yellow_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_control_yellow_3_treament_yellow_3, mc.cores = 4)
save(Diffmeth.norm_control_yellow_3_treament_yellow_3, file = "Diffmeth.norm_control_yellow_3_treament_yellow_3.rda")
write.table(DDiffmeth.norm_control_yellow_3_treament_yellow_3, file = "Diffmeth.norm_control_yellow_3_treament_yellow_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_control_yellow_3_treament_yellow_3 done")

Diffmeth.norm_control_yellow_3_treament_yellow_3.interest=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_3.interest, file = "Diffmeth.norm_control_yellow_3_treament_yellow_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_3.interest.hyper=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_3.interest.hyper, file = "Diffmeth.norm_control_yellow_3_treament_yellow_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_control_yellow_3_treament_yellow_3.interest.hypo=getMethylDiff(Diffmeth.norm_control_yellow_3_treament_yellow_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_control_yellow_3_treament_yellow_3.interest.hypo, file = "Diffmeth.norm_control_yellow_3_treament_yellow_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)





#############################################################################################################
################################################ COLOR POOLED ###############################################
#############################################################################################################

#############################################################################################################
############################################# CTRL vs TREATMENT #############################################
#############################################################################################################

all_control_color_against_all_treatment_color_time_1=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),
treatment=c(0,0,0,1,1,1))

all_control_color_against_all_treatment_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))

all_control_color_against_all_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("3-R-180", "3-J-2", "3-V-613", "3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-R-180", "3-J-2", "3-V-613", "3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1
##################################################################

Diffmeth.norm_all_control_color_against_all_treatment_color_time_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1, mc.cores = 4)
save(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.rda")
write.table(DDiffmeth.norm_all_control_color_against_all_treatment_color_time_1, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_against_all_treatment_color_time_1 done")

Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hyper, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hypo, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2
##################################################################

Diffmeth.norm_all_control_color_against_all_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2, mc.cores = 4)
save(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.rda")
write.table(DDiffmeth.norm_all_control_color_against_all_treatment_color_time_2, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_against_all_treatment_color_time_2 done")

Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hyper, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hypo, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3
##################################################################

Diffmeth.norm_all_control_color_against_all_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3, mc.cores = 4)
save(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.rda")
write.table(DDiffmeth.norm_all_control_color_against_all_treatment_color_time_3, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_against_all_treatment_color_time_3 done")

Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hyper, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hypo, file = "Diffmeth.norm_all_control_color_against_all_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



#############################################################################################################
############################################### CTRL vs CTRL ################################################
#############################################################################################################

all_control_color_time_1_against_control_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),
treatment=c(0,0,0,1,1,1))

all_control_color_time_2_against_control_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-J-2", "3-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-J-2", "3-V-613"),
treatment=c(0,0,0,1,1,1))

all_control_color_time_1_against_control_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613","3-R-180", "3-J-2", "3-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613","3-R-180", "3-J-2", "3-V-613"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2
##################################################################

Diffmeth.norm_all_control_color_time_1_against_control_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2, mc.cores = 4)
save(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.rda")
write.table(DDiffmeth.norm_all_control_color_time_1_against_control_color_time_2, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_time_1_against_control_color_time_2 done")

Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hyper, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hypo, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3
##################################################################

Diffmeth.norm_all_control_color_time_2_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3, mc.cores = 4)
save(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, file = "Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.rda")
write.table(DDiffmeth.norm_all_control_color_time_2_against_control_color_time_3, file = "Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_time_2_against_control_color_time_3 done")

Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest=getMethylDiff(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest, file = "Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hyper, file = "Diffmeth.norm_all_control_color_time_2_against_control_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hypo, file = "Diffmeth.norm_all_control_color_time_2_against_control_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3
##################################################################

Diffmeth.norm_all_control_color_time_1_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3, mc.cores = 4)
save(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.rda")
write.table(DDiffmeth.norm_all_control_color_time_1_against_control_color_time_3, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_control_color_time_1_against_control_color_time_3 done")

Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hyper=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hyper, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hypo=getMethylDiff(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hypo, file = "Diffmeth.norm_all_control_color_time_1_against_control_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


#############################################################################################################
############################################### TRMT vs TRMT ################################################
#############################################################################################################

all_treatment_color_time_1_against_treatment_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))

all_treatment_color_time_2_against_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))

all_treatment_color_time_1_against_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620","3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620","3-R-183", "3-J-7", "3-V-620"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2
##################################################################

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2, mc.cores = 4)
save(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.rda")
write.table(DDiffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2 done")

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3
##################################################################

Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3, mc.cores = 4)
save(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, file = "Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.rda")
write.table(DDiffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, file = "Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3 done")

Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest=getMethylDiff(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest, file = "Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper=getMethylDiff(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper, file = "Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo=getMethylDiff(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo, file = "Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3
##################################################################

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3, mc.cores = 4)
save(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.rda")
write.table(DDiffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3 done")

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo=getMethylDiff(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo, file = "Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

#############################################################################################################
####################### COLOR POOLED with 3-J-2 changed with 3-V-620 and vice&versa #########################
#############################################################################################################

#############################################################################################################
############################################# CTRL vs TREATMENT #############################################
#############################################################################################################

all_control_color_against_all_treatment_color_time_1=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),
treatment=c(0,0,0,1,1,1))

all_control_color_against_all_treatment_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))

all_control_color_against_all_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("3-R-180", "3-V-620", "3-V-613", "3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("3-R-180", "3-V-620", "3-V-613", "3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



#############################################################################################################
############################################### CTRL vs CTRL ################################################
#############################################################################################################

all_control_color_time_1_against_control_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),
treatment=c(0,0,0,1,1,1))

all_control_color_time_2_against_control_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-V-620", "3-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-V-620", "3-V-613"),
treatment=c(0,0,0,1,1,1))

all_control_color_time_1_against_control_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613","3-R-180", "3-V-620", "3-V-613"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-180", "1-J-2", "1-V-613","3-R-180", "3-V-620", "3-V-613"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_2_against_control_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3 done")

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_control_color_time_1_against_control_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)


#############################################################################################################
############################################### TRMT vs TRMT ################################################
#############################################################################################################

all_treatment_color_time_1_against_treatment_color_time_2=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),
treatment=c(0,0,0,1,1,1))

all_treatment_color_time_2_against_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))

all_treatment_color_time_1_against_treatment_color_time_3=reorganize(my_meth_all_together, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620","3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))	
	
filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 
	sample.ids=c("1-R-183", "1-J-7", "1-V-620","3-R-183", "3-J-7", "3-J-2"),
treatment=c(0,0,0,1,1,1))


#############################################################################################################
######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################
#############################################################################################################



##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2 done")

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3 done")

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)

##################################################################
# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3
##################################################################

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3, mc.cores = 4)
save(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.rda")
write.table(DInversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.txt", sep = "\t", quote = FALSE)
message("Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3 done")

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01)
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest_diff25.q0.001.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)



















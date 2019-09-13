#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")


###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 
###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 
###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 


### CHG context


###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 
###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 
###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### 


###### ALL ALL ALL INVERSED
#list.bam_all_together=list("Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
#"Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
#"Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
#"Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam")
#
###############################################################################################################
######################### COLOR POOLED with 3-J-2 changed with 3-V-620 and vice&versa #########################
###############################################################################################################
#
#
####### ALL ALL ALL INVERSED
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
#my_meth_all_together_inversed_CHG=processBismarkAln(location=list.bam_all_together,
#                sample.id=list.id_all_together,
#                assembly="sspace.final.scaffolds.fasta",
#                save.folder="methylation_call_all_together_clean_inversed_CHG",
#                save.context=c("CHG"),
#                read.context="CHG",
#                mincov=10,
#                treatment=c(0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5))
#
#save(my_meth_all_together_inversed_CHG, file = "my_meth_all_together_clean_INVERSED_CHG_CHG.rda")
##print(my_meth_all_together[[1]]@dbpath)
#message ("my_meth_all_together_clean_INVERSED_CHG.done")
#


### COMPARATIVE ANALYSIS ###

## Per Base ##

# without normalization #
load("my_meth_all_together_clean_INVERSED_CHG_CHG.rda")
filtered.normalized.myallmeth.10_unite=unite(my_meth_all_together_inversed_CHG,destrand = FALSE)
#
#
#write.table(Allmeth_CHG, file = "Allmeth_CHG_CHG.txt", sep = "\t", quote = FALSE)
#
#perc.Allmeth_CHG <- percMethylation(Allmeth_CHG)
#write.table(perc.Allmeth_CHG, file = "Allmeth.percent_CHG_CHG.txt", sep = "\t", quote = FALSE)
#message ("done perc meth_CHG")
#
#### DIFFERENTIAL METHYLATION ANALYSIS ###
#
#
#Diffmeth_CHG=calculateDiffMeth(Allmeth_CHG, mc.cores = 4)
#
#write.table(Diffmeth_CHG, file = "Diffmeth_CHG_CHG.txt", sep = "\t", quote = FALSE)
#
#message("Diffmeth_CHGdone")
#
#Diffmeth_CHG.interest=getMethylDiff(Diffmeth_CHG, difference = 25, qvalue = 0.01)
#write.table(Diffmeth_CHG.interest, file = "Diffmeth_CHG.diff25.q0.001_CHG.txt", sep = "\t", quote = FALSE)
#
#Diffmeth_CHG.interest.hyper=getMethylDiff(Diffmeth_CHG, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth_CHG.interest.hyper, file = "Diffmeth_CHG.diff25.q0.001.hyper_CHG.txt", sep = "\t", quote = FALSE)
#
#Diffmeth_CHG.interest.hypo=getMethylDiff(Diffmeth_CHG, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth_CHGinterest.hypo, file = "Diffmeth_CHG.diff25.q0.001.hypo_CHG.txt", sep = "\t", quote = FALSE)
#
#
#message("get Diffmeth_CHG of interest done")
#
#






##############################################################################################################

##############################################################################################################

############################################## CUT OFF = qvalue = 0.01 ##########################################

##############################################################################################################

##############################################################################################################






##############################################################################################################

############################################## CTRL vs TREATMENT #############################################

##############################################################################################################




all_control_color_against_all_treatment_color_time_1=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "1-R-183", "1-J-7", "1-V-620"),

treatment=c(0,0,0,1,1,1))




all_control_color_against_all_treatment_color_time_2=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "2-R-183", "2-J-7", "2-V-620"),

treatment=c(0,0,0,1,1,1))




all_control_color_against_all_treatment_color_time_3=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("3-R-180","3-J-2", "3-V-613", "3-R-183", "3-J-7", "3-V-620"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("3-R-180","3-J-2", "3-V-613", "3-R-183", "3-J-7", "3-V-620"),

treatment=c(0,0,0,1,1,1))







#############################################################################################################

######################################## DIFFERENTIAL METHYLATION ANALYSIS ##################################

#############################################################################################################










##################################################################

# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_1, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_1_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)







##################################################################

# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_2, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_2_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)










##################################################################

# filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_against_all_treatment_color_time_3, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_against_all_treatment_color_time_3_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)










#############################################################################################################

############################################### CTRL vs CTRL ################################################

#############################################################################################################




all_control_color_time_1_against_control_color_time_2=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("1-R-180", "1-J-2", "1-V-613", "2-R-180", "2-J-2", "2-V-613"),

treatment=c(0,0,0,1,1,1))




all_control_color_time_2_against_control_color_time_3=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-J-2", "3-V-613"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("2-R-180", "2-J-2", "2-V-613", "3-R-180", "3-J-2", "3-V-613"),

treatment=c(0,0,0,1,1,1))




all_control_color_time_1_against_control_color_time_3=reorganize(my_meth_all_together_inversed_CHG, 

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




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_2, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_2_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)




##################################################################

# filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_2_against_control_color_time_3, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_2_against_control_color_time_3_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)




##################################################################

# filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_control_color_time_1_against_control_color_time_3, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_control_color_time_1_against_control_color_time_3_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)







#############################################################################################################

############################################### TRMT vs TRMT ################################################

#############################################################################################################




all_treatment_color_time_1_against_treatment_color_time_2=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("1-R-183", "1-J-7", "1-V-620", "2-R-183", "2-J-7", "2-V-620"),

treatment=c(0,0,0,1,1,1))




all_treatment_color_time_2_against_treatment_color_time_3=reorganize(my_meth_all_together_inversed_CHG, 

	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-V-620"),

treatment=c(0,0,0,1,1,1))	

	

filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3=reorganize(filtered.normalized.myallmeth.10_unite, 

	sample.ids=c("2-R-183", "2-J-7", "2-V-620", "3-R-183", "3-J-7", "3-V-620"),

treatment=c(0,0,0,1,1,1))




all_treatment_color_time_1_against_treatment_color_time_3=reorganize(my_meth_all_together_inversed_CHG, 

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




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_2, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_2_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)




##################################################################

# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_2_against_treatment_color_time_3, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_2_against_treatment_color_time_3_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)




##################################################################

# filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3

##################################################################




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3 =calculateDiffMeth(filtered.normalized.myallmeth.10_unite_all_treatment_color_time_1_against_treatment_color_time_3, mc.cores = 4)

save(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3_CHG.rda")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3_CHG.txt", sep = "\t", quote = FALSE)

message("Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3 done")




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01)

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest_diff25.q0_01_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hyper")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest.hyper, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0_01.hyper_CHG.txt", sep = "\t", quote = FALSE)




Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo=getMethylDiff(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3, difference = 25, qvalue = 0.01, type = "hypo")

write.table(Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3.interest.hypo, file = "Inversed_3V620_3J2_Diffmeth.norm_Q_0_01_all_treatment_color_time_1_against_treatment_color_time_3_diff25.q0_01.hypo_CHG.txt", sep = "\t", quote = FALSE)





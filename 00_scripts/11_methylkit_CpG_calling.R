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

list.bam=list("Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
"Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
"Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
"Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam"
)



# ALL
list.id=list("1-V-620",
"2-V-620",
"3-V-620",
"1-V-613",
"2-V-613",
"3-V-613",
"1-J-2",
"2-J-2",
"3-J-2",
"1-J-7",
"2-J-7",
"3-J-7",
"1-R-180",
"2-R-180",
"3-R-180",
"1-R-183",
"2-R-183",
"3-R-183"
)

###### CONTROL GREEN CLEAN
list.bam_control_green=list("Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
"Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam",
"Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam")

###### CONTROL GREEN CLEAN
list.id_control_green=list("1-V-613",
"2-V-613",
"3-V-613")

my_meth_control_green=processBismarkAln(location=list.bam_control_green,
                sample.id=list.id_control_green,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_green_clean",
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

save(my_meth_control_green, file = "my_meth_control_green_clean.rda")
#print(my_meth_control_green[[1]]@dbpath)
message ("my_meth_control_green_clean.done")


###### CONTROL YELLOW CLEAN
list.bam_control_yellow=list("Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### CONTROL YELLOW CLEAN
list.id_control_yellow=list("1-J-2",
"2-J-2",
"3-J-2")

my_meth_control_yellow=processBismarkAln(location=list.bam_control_yellow,
                sample.id=list.id_control_yellow,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_yellow_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_control_yellow[[1]]")
my_meth_control_yellow[[1]]
print("my_meth_control_yellow[[2]]")
my_meth_control_yellow[[2]]
print("my_meth_control_yellow[[3]]")
my_meth_control_yellow[[3]]
getMethylationStats(my_meth_control_yellow[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_yellow[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_yellow[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_control_yellow, file = "my_meth_control_yellow_clean.rda")
#print(my_meth_control_yellow[[1]]@dbpath)
message ("my_meth_control_yellow_clean.done")


###### CONTROL RED CLEAN
list.bam_control_red=list("Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### CONTROL RED CLEAN
list.id_control_red=list("1-R-180",
"2-R-180",
"3-R-180")

my_meth_control_red=processBismarkAln(location=list.bam_control_red,
                sample.id=list.id_control_red,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_control_red_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_control_red[[1]]")
my_meth_control_red[[1]]
print("my_meth_control_red[[2]]")
my_meth_control_red[[2]]
print("my_meth_control_red[[3]]")
my_meth_control_red[[3]]
getMethylationStats(my_meth_control_red[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_control_red[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_control_red[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_control_red, file = "my_meth_control_red_clean.rda")
#print(my_meth_control_red[[1]]@dbpath)
message ("my_meth_control_red_clean.done")

###### TREATMENT GREEN CLEAN
list.bam_treatment_green=list("Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### TREATMENT GREEN CLEAN
list.id_treatment_green=list("1-V-620",
"2-V-620",
"3-V-620")

my_meth_treatment_green=processBismarkAln(location=list.bam_treatment_green,
                sample.id=list.id_treatment_green,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_green_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_treatment_green[[1]]")
my_meth_treatment_green[[1]]
print("my_meth_treatment_green[[2]]")
my_meth_treatment_green[[2]]
print("my_meth_treatment_green[[3]]")
my_meth_treatment_green[[3]]
getMethylationStats(my_meth_treatment_green[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_green[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_green[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_green[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_green[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_green[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_green[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_green[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_green[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_green, file = "my_meth_treatment_green_clean.rda")
#print(my_meth_treatment_green[[1]]@dbpath)
message ("my_meth_treatment_green_clean.done")

###### TREATMENT YELLOW CLEAN
list.bam_treatment_yellow=list("Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### TREATMENT YELLOW CLEAN
list.id_treatment_yellow=list("1-J-7",
"2-J-7",
"3-J-7")

my_meth_treatment_yellow=processBismarkAln(location=list.bam_treatment_yellow,
                sample.id=list.id_treatment_yellow,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_yellow_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_treatment_yellow[[1]]")
my_meth_treatment_yellow[[1]]
print("my_meth_treatment_yellow[[2]]")
my_meth_treatment_yellow[[2]]
print("my_meth_treatment_yellow[[3]]")
my_meth_treatment_yellow[[3]]
getMethylationStats(my_meth_treatment_yellow[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_yellow[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_yellow[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_yellow[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_yellow[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_yellow[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_yellow[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_yellow[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_yellow[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_yellow, file = "my_meth_treatment_yellow_clean.rda")
#print(my_meth_treatment_yellow[[1]]@dbpath)
message ("my_meth_treatment_yellow_clean.done")


###### TREATMENT RED CLEAN
list.bam_treatment_red=list("Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### TREATMENT RED CLEAN
list.id_treatment_red=list("1-R-183",
"2-R-183",
"3-R-183")

my_meth_treatment_red=processBismarkAln(location=list.bam_treatment_red,
                sample.id=list.id_treatment_red,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_red_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2))

# Descriptive statistics on samples
print("my_meth_treatment_red[[1]]")
my_meth_treatment_red[[1]]
print("my_meth_treatment_red[[2]]")
my_meth_treatment_red[[2]]
print("my_meth_treatment_red[[3]]")
my_meth_treatment_red[[3]]
getMethylationStats(my_meth_treatment_red[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_red[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_red[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_red[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_red[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_red[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_red[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_red[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_red[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_red, file = "my_meth_treatment_red_clean.rda")
#print(my_meth_treatment_red[[1]]@dbpath)
message ("my_meth_treatment_red_clean.done")


###### ALL TREATMENT CLEAN COLOR AGAINST COLOR
list.bam_treatment_all_treatment_color_against_color=list("Index_2.1-R-183_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_3.2-R-183_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_5.3-R-183_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_21.1-J-7_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_22.2-J-7_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_23.3-J-7_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_9.1-V-620_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_10.2-V-620_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_11.3-V-620_R1_paiall_treatment_color_against_color_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### ALL TREATMENT CLEAN COLOR AGAINST COLOR
list.id_treatment_all_treatment_color_against_color=list("1-R-183",
"2-R-183",
"3-R-183",
"1-J-7",
"2-J-7",
"3-J-7",
"1-V-620",
"2-V-620",
"3-V-620")

my_meth_treatment_all_treatment_color_against_color=processBismarkAln(location=list.bam_treatment_all_treatment_color_against_color,
                sample.id=list.id_treatment_all_treatment_color_against_color,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_all_treatment_color_against_color_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,0,0,1,1,1,2,2,2))

# Descriptive statistics on samples
print("my_meth_treatment_all_treatment_color_against_color[[1]]")
my_meth_treatment_all_treatment_color_against_color[[1]]
print("my_meth_treatment_all_treatment_color_against_color[[2]]")
my_meth_treatment_all_treatment_color_against_color[[2]]
print("my_meth_treatment_all_treatment_color_against_color[[3]]")
my_meth_treatment_all_treatment_color_against_color[[3]]
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_color_against_color[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_color_against_color[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_color_against_color[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_color_against_color[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_all_treatment_color_against_color, file = "my_meth_treatment_all_treatment_color_against_color_clean.rda")
#print(my_meth_treatment_all_treatment_color_against_color[[1]]@dbpath)
message ("my_meth_treatment_all_treatment_color_against_color_clean.done")


###### ALL TREATMENT CLEAN TIME AGAINST TIME
list.bam_treatment_all_treatment_time_against_time=list("Index_2.1-R-183_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_3.2-R-183_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_5.3-R-183_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_21.1-J-7_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_22.2-J-7_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_23.3-J-7_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_9.1-V-620_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_10.2-V-620_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_11.3-V-620_R1_paiall_treatment_time_against_time_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### ALL TREATMENT CLEAN TIME AGAINST TIME
list.id_treatment_all_treatment_time_against_time=list("1-R-183",
"2-R-183",
"3-R-183",
"1-J-7",
"2-J-7",
"3-J-7",
"1-V-620",
"2-V-620",
"3-V-620")

my_meth_treatment_all_treatment_time_against_time=processBismarkAln(location=list.bam_treatment_all_treatment_time_against_time,
                sample.id=list.id_treatment_all_treatment_time_against_time,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_all_treatment_time_against_time_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,2,0,1,2,0,1,2))

# Descriptive statistics on samples
print("my_meth_treatment_all_treatment_time_against_time[[1]]")
my_meth_treatment_all_treatment_time_against_time[[1]]
print("my_meth_treatment_all_treatment_time_against_time[[2]]")
my_meth_treatment_all_treatment_time_against_time[[2]]
print("my_meth_treatment_all_treatment_time_against_time[[3]]")
my_meth_treatment_all_treatment_time_against_time[[3]]
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_time_against_time[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_time_against_time[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_time_against_time[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_time_against_time[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_all_treatment_time_against_time, file = "my_meth_treatment_all_treatment_time_against_time_clean.rda")
#print(my_meth_treatment_all_treatment_time_against_time[[1]]@dbpath)
message ("my_meth_treatment_all_treatment_time_against_time_clean.done")







###### ALL TREATMENT CLEAN DEPTH AGAINST DEPTH
list.bam_treatment_all_treatment_depth_against_depth=list("Index_2.1-R-183_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_3.2-R-183_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_5.3-R-183_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_21.1-J-7_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_22.2-J-7_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_23.3-J-7_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_9.1-V-620_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_10.2-V-620_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam",
"Index_11.3-V-620_R1_paiall_treatment_depth_against_depth_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam")

###### ALL TREATMENT CLEAN DEPTH AGAINST DEPTH
list.id_treatment_all_treatment_depth_against_depth=list("1-R-183",
"2-R-183",
"3-R-183",
"1-J-7",
"2-J-7",
"3-J-7",
"1-V-620",
"2-V-620",
"3-V-620")

my_meth_treatment_all_treatment_depth_against_depth=processBismarkAln(location=list.bam_treatment_all_treatment_depth_against_depth,
                sample.id=list.id_treatment_all_treatment_depth_against_depth,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call_treatment_all_treatment_depth_against_depth_clean",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,1,0,0,1,0,0,1,0))

# Descriptive statistics on samples
print("my_meth_treatment_all_treatment_depth_against_depth[[1]]")
my_meth_treatment_all_treatment_depth_against_depth[[1]]
print("my_meth_treatment_all_treatment_depth_against_depth[[2]]")
my_meth_treatment_all_treatment_depth_against_depth[[2]]
print("my_meth_treatment_all_treatment_depth_against_depth[[3]]")
my_meth_treatment_all_treatment_depth_against_depth[[3]]
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[1]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[1]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_depth_against_depth[[1]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[2]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[2]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_depth_against_depth[[2]],plot=TRUE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[3]],plot=FALSE,both.strands=FALSE)
getMethylationStats(my_meth_treatment_all_treatment_depth_against_depth[[3]],plot=TRUE,both.strands=FALSE)
getCoverageStats(my_meth_treatment_all_treatment_depth_against_depth[[3]],plot=TRUE,both.strands=FALSE)

save(my_meth_treatment_all_treatment_depth_against_depth, file = "my_meth_treatment_all_treatment_depth_against_depth_clean.rda")
#print(my_meth_treatment_all_treatment_depth_against_depth[[1]]@dbpath)
message ("my_meth_treatment_all_treatment_depth_against_depth_clean.done")

####################################
#### FILTER THE METHYLATION CALL ###
####################################
#
##load("R.objects/myallmeth.rda")
#
## with normalization #
#normalized.myallmeth=normalizeCoverage(my_meth_control_green)
#message ("normalize.done")
#
## Filtering samples based on read coverage #
#filtered.normalized.myallmeth.10=filterByCoverage(normalized.myallmeth,
#		lo.count = 10,
#		lo.perc = NULL,
#		hi.count = NULL,
#		hi.perc = 99.9)
#
#save(filtered.normalized.myallmeth.10, file = "R.objects/filtered.normalized.myallmeth.10.rda")
#message ("filtered.normalized.myallmeth.done")
#
## without normalization #
#filtered.myallmeth.10=filterByCoverage(normalized.myallmeth,
#                lo.count = 10,
#                lo.perc = NULL,
#                hi.count = NULL,
#                hi.perc = 99.9)
#
#save(filtered.myallmeth.10, file = "R.objects/filtered.myallmeth.10.rda")
#message ("filtered.myallmeth.done")
#
#### COMPARATIVE ANALYSIS ###
#
### Per Base ##
#
## with normalization #
##load("R.objects/filtered.normalized.myallmeth.10.rda")
#Allmeth.norm=unite(filtered.normalized.myallmeth.10,destrand = FALSE)
#
#save(Allmeth.norm, file = "R.objects/Allmeth.norm.rda")
#message ("unite.filtered.normalized.myallmeth.done")
#
#write.table(Allmeth.norm, file = "Allmeth.norm.txt", sep = "\t", quote = FALSE)
#
#perc.Allmeth.norm <- percMethylation(Allmeth.norm)
#write.table(perc.Allmeth.norm, file = "Allmeth.norm.percent.txt", sep = "\t", quote = FALSE)
#message ("done perc meth.norm")
#
## without normalization #
##load("R.objects/filtered.myallmeth.10.rda")
#Allmeth=unite(filtered.myallmeth.10,destrand = FALSE)
#
#save(Allmeth, file = "R.objects/Allmeth.rda")
#message ("unite.filtered.myallmeth.done")
#
#write.table(Allmeth, file = "Allmeth.txt", sep = "\t", quote = FALSE)
#
#perc.Allmeth <- percMethylation(Allmeth)
#write.table(perc.Allmeth, file = "Allmeth.percent.txt", sep = "\t", quote = FALSE)
#message ("done perc meth")
#
#### DIFFERENTIAL METHYLATION ANALYSIS ###
#
## with normalization #
#load("R.objects/Allmeth.norm.rda")
#
#Diffmeth.norm=calculateDiffMeth(Allmeth.norm, mc.cores = 4)
#
#save(Diffmeth.norm, file = "R.objects/Diffmeth.norm.rda")
#
#write.table(Diffmeth.norm, file = "Diffmeth.norm.txt", sep = "\t", quote = FALSE)
#
#message("Diffmeth.norm done")
#
#Diffmeth.norm.interest=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.norm.interest, file = "Diffmeth.norm.diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm.interest.hyper=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.norm.interest.hyper, file = "Diffmeth.norm.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.norm.interest.hypo=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.norm.interest.hypo, file = "Diffmeth.norm.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
## without normalization #
#load("R.objects/Allmeth.rda")
#
#Diffmeth=calculateDiffMeth(Allmeth, mc.cores = 4)
#
#save(Diffmeth, file = "R.objects/Diffmeth.rda")
#
#write.table(Diffmeth, file = "Diffmeth.txt", sep = "\t", quote = FALSE)
#
#message("Diffmeth done")
#
#Diffmeth.interest=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01)
#write.table(Diffmeth.interest, file = "Diffmeth.diff25.q0.001.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.interest.hyper=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01, type = "hyper")
#write.table(Diffmeth.interest.hyper, file = "Diffmeth.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)
#
#Diffmeth.interest.hypo=getMethylDiff(Diffmeth, difference = 25, qvalue = 0.01, type = "hypo")
#write.table(Diffmeth.interest.hypo, file = "Diffmeth.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)
#
#message("get diffmeth of interest done")
#

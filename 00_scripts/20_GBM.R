#!/usr/bin/env Rscript

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

dat <- read.table("Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_10.2-V-620_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}

dat <- read.table("Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_11.3-V-620_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_1.3-R-180_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_18.1-J-2_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_19.2-J-2_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_20.3-J-2_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_21.1-J-7_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_2.1-R-183_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_22.2-J-7_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_23.3-J-7_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_25.1-R-180_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_27.2-R-180_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_3.2-R-183_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_5.3-R-183_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_6.1-V-613_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_7.2-V-613_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_8.3-V-613_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
dat <- read.table("Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_9.1-V-620_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}

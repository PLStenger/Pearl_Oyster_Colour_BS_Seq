#!/usr/bin/env Rscript

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

dat <- read.table("Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bed_correspondance.bed_base.txt")

for(i in 1:length(unique(dat$V1))){
  sink("Index_6.1-V-613_GBM.txt", append=TRUE)
  pos_name <- as.character(unique(dat$V1)[i])
  newdata <- dat[ which(dat$V1==pos_name), ]
  print(c(pos_name, mean(newdata$V2)))
  sink()
}
#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

### GET METHYLATION FROM SORTED BISMARK ALIGNEMENT OR READ THE METHYLATION CALL FILES ###

# A set of BAM or methylation call files #

list.bam=list("Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam",
                "Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam",
                "Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
                "Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
                "Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam",
                "Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam")


list.id=list("2-V-620",
                "3-V-620",
                "1-V-613",
                "2-V-613",
                "3-V-613",
                "1-V-620")

myallmeth=processBismarkAln(location=list.bam,
                sample.id=list.id,
                assembly="sspace.final.scaffolds.fasta",
                save.folder="methylation_call",
                save.context=c("CpG"),
                read.context="CpG",
                mincov=10,
                treatment=c(0,0,1,1,1,0))

#myallmeth=methRead(list.file, sample.id = list.id, assembly = "trimmed_genome_v1", treatment = c(0,1,0,1,1,0,1,0), context = "CpG")

save(myallmeth, file = "R.objects/myallmeth.rda")
message ("myallmeth.done")

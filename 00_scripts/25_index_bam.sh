#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"

$SAMTOOLS_ENV
cd $DATADIRECTORY

#samtools index Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai

#samtools index Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai
#samtools index Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bai

samtools index Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bai
samtools index Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bai
samtools index Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bai


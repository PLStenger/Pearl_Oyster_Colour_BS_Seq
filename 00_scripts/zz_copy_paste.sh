#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files
scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam /home/datawork-ihpe-nos/Pmarg_color/BS-Seq/01_bam_files

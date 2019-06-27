#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

WORKING_DIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $WORKING_DIRECTORY
$SAM_ENV

samtools index Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai
samtools index Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai
samtools index Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai
samtools index Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai
samtools index Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai
samtools index Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.bai 

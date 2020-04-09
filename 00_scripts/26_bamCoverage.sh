#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

#bamCoverage -b Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw

bamCoverage -b Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam -o Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bw
bamCoverage -b Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam -o Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bw
bamCoverage -b Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam -o Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam.bw



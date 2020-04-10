#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools


plotHeatmap -m Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Heatmap_Index_10.2-V-620.pdf
plotHeatmap -m Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_11.3-V-620.pdf
plotHeatmap -m Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_1.3-R-180.pdf
plotHeatmap -m Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_18.1-J-2.pdf
plotHeatmap -m Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_19.2-J-2.pdf
plotHeatmap -m Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_20.3-J-2.pdf
plotHeatmap -m Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_21.1-J-7.pdf
plotHeatmap -m Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_2.1-R-183.pdf
plotHeatmap -m Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_22.2-J-7.pdf
plotHeatmap -m Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_23.3-J-7.pdf
plotHeatmap -m Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_25.1-R-180.pdf
plotHeatmap -m Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_27.2-R-180.pdf
plotHeatmap -m Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_3.2-R-183.pdf
plotHeatmap -m Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_5.3-R-183.pdf
plotHeatmap -m Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_6.1-V-613.pdf
plotHeatmap -m Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_7.2-V-613.pdf
plotHeatmap -m Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_8.3-V-613.pdf
plotHeatmap -m Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -out Heatmap_Index_9.1-V-620.pdf



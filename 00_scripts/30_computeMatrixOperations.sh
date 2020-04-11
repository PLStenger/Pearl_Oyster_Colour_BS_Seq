#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=180:00:00
#PBS -l mem=1000g
#PBS -l ncpus=64

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

#computeMatrixOperations cbind -m Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -o cbind_output.mat.gz
#plotProfile -m cbind_output.mat.gz -out plotProfile_cbind_output.mat.pdf --plotTitle "All individuals" --plotHeight 10 --plotWidth 10
plotHeatmap -m cbind_output.mat.gz -out heatmap_cbind_output.mat.pdf

#computeMatrixOperations rbind -m Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted_clean.bam_02_matrix.mat.gz Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_02_matrix.mat.gz -o rbind_output.mat.gz
#plotProfile -m rbind_output.mat.gz -out plotProfile_rbind_output.mat.pdf --plotTitle "All individuals" --plotHeight 10 --plotWidth 10
plotHeatmap -m rbind_output.mat.gz -out heatmap_rbind_output.mat.pdf




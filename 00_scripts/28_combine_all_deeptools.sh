#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools

#bamCoverage -b Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw

#bamCoverage -b Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw
#bamCoverage -b Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam -o Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw

#computeMatrix scale-regions -S Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R $REFERENCE --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o matrix.mat.gz

computeMatrix scale-regions -S Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz
computeMatrix scale-regions -S Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R sspace.final.scaffolds_no_pipe_size.bed --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz


#plotProfile -m matrix.mat.gz -out Index_10.2-V-620.png --numPlotsPerRow 2 --plotTitle "Index_10.2-V-620"
plotProfile -m Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_11.3-V-620.png --numPlotsPerRow 2 --plotTitle "Index_11.3-V-620"
plotProfile -m Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_1.3-R-180.png --numPlotsPerRow 2 --plotTitle "Index_1.3-R-180"
plotProfile -m Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_18.1-J-2.png --numPlotsPerRow 2 --plotTitle "Index_18.1-J-2"
plotProfile -m Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_19.2-J-2.png --numPlotsPerRow 2 --plotTitle "Index_19.2-J-2"
plotProfile -m Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_20.3-J-2.png --numPlotsPerRow 2 --plotTitle "Index_20.3-J-2"
plotProfile -m Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_21.1-J-7.png --numPlotsPerRow 2 --plotTitle "Index_21.1-J-7"
plotProfile -m Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_2.1-R-183.png --numPlotsPerRow 2 --plotTitle "Index_2.1-R-183"
plotProfile -m Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_22.2-J-7.png --numPlotsPerRow 2 --plotTitle "Index_22.2-J-7"
plotProfile -m Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_23.3-J-7.png --numPlotsPerRow 2 --plotTitle "Index_23.3-J-7"
plotProfile -m Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_25.1-R-180.png --numPlotsPerRow 2 --plotTitle "Index_25.1-R-180"
plotProfile -m Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_27.2-R-180.png --numPlotsPerRow 2 --plotTitle "Index_27.2-R-180"
plotProfile -m Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_3.2-R-183.png --numPlotsPerRow 2 --plotTitle "Index_3.2-R-183"
plotProfile -m Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_5.3-R-183.png --numPlotsPerRow 2 --plotTitle "Index_5.3-R-183"
plotProfile -m Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_9.1-V-620.png --numPlotsPerRow 2 --plotTitle "Index_9.1-V-620"
plotProfile -m Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_matrix.mat.gz -out Index_11.3-V-620.png --numPlotsPerRow 2 --plotTitle "Index_11.3-V-620"





#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $DATADIRECTORY

$SAM_ENV


samtools view -h -o Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam 
rm Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam
samtools view -b Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_11.3-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam

samtools view -h -o Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_1.3-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_18.1-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_19.2-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_20.3-J-2_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_21.1-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam

samtools view -h -o Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_2.1-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_22.2-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam
samtools view -b Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_23.3-J-7_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam

samtools view -h -o Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_25.1-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_27.2-R-180_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_3.2-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

samtools view -h -o Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam  > Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_5.3-R-183_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam

samtools view -h -o Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
sed 's/|size/_/g' Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 
samtools view -b Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam
rm Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted.bam.sam 
rm Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sam 

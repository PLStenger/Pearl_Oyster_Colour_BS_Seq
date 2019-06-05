#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $DATADIRECTORY

$SAM_ENV

samtools view -h -o Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.sam Index_8.3-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
samtools view -h -o Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.sam Index_7.2-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam
samtools view -h -o Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam.sam Index_6.1-V-613_R1_paired_bismark_bt2_pe.deduplicated.bam_sorted.bam



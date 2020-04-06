#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
CORRESPONDANCE=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome/Correspondance_scaff_07.gff
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"

$SAMTOOLS_ENV

cd $DATADIRECTORY

$SAMTOOLS sort Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sorted.bed
$SAMTOOLS sort Correspondance_scaff_07.gff > Correspondance_scaff_07_sorted.gff

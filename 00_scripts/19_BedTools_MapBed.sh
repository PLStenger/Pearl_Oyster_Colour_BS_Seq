#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
CORRESPONDANCE=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome/Correspondance_scaff_07.gff
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

bedtools map $DATADIRECTORY/Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed $CORRESPONDANCE > $DATAOUTPUT/Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_correspondance.bed


#for FILE in $(ls $DATADIRECTORY/*_sorted_clean.bam)
#do
#         bedtools bamtobed -i ${FILE##*/} > ${FILE##*/}.bed
#done ;


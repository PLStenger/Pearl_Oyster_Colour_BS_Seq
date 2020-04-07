#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
CORRESPONDANCE=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome/Correspondance_scaff_07.gff
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

#bedtools map -a Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed -b Correspondance_scaff_07.gff > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_correspondance.bed
#bedtools intersect -a Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed -b Correspondance_scaff_07.gff > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_correspondance.bed

#bedtools map -a Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.sorted.bed -b Correspondance_scaff_07_sorted.gff > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_correspondance.bed

# OK
#bedtools intersect -b Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bed -a Correspondance_scaff_07.gff -wa -wb > Index_9.1-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam_correspondance.bed

#for FILE in $(ls $DATADIRECTORY/*clean.bam.bed)
#do
#        bedtools intersect -b ${FILE##*/} -a Correspondance_scaff_07.gff -wa -wb > ${FILE##*/}_correspondance.bed
#done ;
#
#for FILE in $(ls $DATADIRECTORY/*_correspondance.bed)
#do
#       awk '{print $4" "$10}' ${FILE##*/}  > ${FILE##*/}_correspondance_02.bed
#       sed 's/ /\t/g' ${FILE##*/}_correspondance_02.bed > ${FILE##*/}_base.txt
#done ;

#rm *_correspondance*

#bedtools intersect -a 1-J-2_cpg_count_gencode_02.bed -b Correspondance_scaff_07.gff -wa -wb > 1-J-2_cpg_count_gencode_02_correspondance.bed

bedtools map -a 3-J-7_04.bed -b Correspondance_scaff_07.gff > 3-J-7_04_correspondance.bed



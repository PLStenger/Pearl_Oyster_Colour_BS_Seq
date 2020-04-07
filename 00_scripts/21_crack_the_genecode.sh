#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

#bedtools intersect -a 3-V-620_cpg_count_info_07.bed -b gencode_03.bed -wa -wb > 3-V-620_cpg_count_gencode.txt
#bedtools intersect -b 3-V-620_cpg_count_info_07.bed -a gencode_03.bed -wa -wb > 3-V-620_cpg_count_gencode_02.txt

#bedtools intersect -a 3-V-620_cpg_count_info_09.bed -b gencode_04.bed > 3-V-620_cpg_count_gencode.txt
#bedtools intersect -b 3-V-620_cpg_count_info_09.bed -a gencode_04.bed > 3-V-620_cpg_count_gencode_02.txt

#bedtools intersect -b 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-620_cpg_count_gencode.txt

bedtools intersect -b 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-J-2_cpg_count_gencode.txt
bedtools intersect -b 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-J-7_cpg_count_gencode.txt
bedtools intersect -b 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-R-180_cpg_count_gencode.txt
bedtools intersect -b 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-R-183_cpg_count_gencode.txt
bedtools intersect -b 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-V-613_cpg_count_gencode.txt
bedtools intersect -b 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-V-620_cpg_count_gencode.txt
bedtools intersect -b 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-J-2_cpg_count_gencode.txt
bedtools intersect -b 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-J-7_cpg_count_gencode.txt
bedtools intersect -b 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-R-180_cpg_count_gencode.txt
bedtools intersect -b 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-R-183_cpg_count_gencode.txt
bedtools intersect -b 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-V-613_cpg_count_gencode.txt
bedtools intersect -b 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-V-620_cpg_count_gencode.txt
bedtools intersect -b 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-J-2_cpg_count_gencode.txt
bedtools intersect -b 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-J-7_cpg_count_gencode.txt
bedtools intersect -b 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-R-180_cpg_count_gencode.txt
bedtools intersect -b 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-R-183_cpg_count_gencode.txt
bedtools intersect -b 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-613_cpg_count_gencode.txt
bedtools intersect -b 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-620_cpg_count_gencode.txt


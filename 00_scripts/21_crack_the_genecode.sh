#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
#DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

DATADIRECTORY=/home1/scratch/plstenge/genome
DATAOUTPUT=/home1/scratch/plstenge/genome
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

#bedtools intersect -a 3-V-620_cpg_count_info_07.bed -b gencode_03.bed -wa -wb > 3-V-620_cpg_count_gencode.txt
#bedtools intersect -b 3-V-620_cpg_count_info_07.bed -a gencode_03.bed -wa -wb > 3-V-620_cpg_count_gencode_02.txt

#bedtools intersect -a 3-V-620_cpg_count_info_09.bed -b gencode_04.bed > 3-V-620_cpg_count_gencode.txt
#bedtools intersect -b 3-V-620_cpg_count_info_09.bed -a gencode_04.bed > 3-V-620_cpg_count_gencode_02.txt

#bedtools intersect -b 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-620_cpg_count_gencode.txt

#bedtools intersect -b 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-J-2_cpg_count_gencode.txt
#bedtools intersect -b 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-J-7_cpg_count_gencode.txt
#bedtools intersect -b 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-R-180_cpg_count_gencode.txt
#bedtools intersect -b 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-R-183_cpg_count_gencode.txt
#bedtools intersect -b 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-V-613_cpg_count_gencode.txt
#bedtools intersect -b 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 1-V-620_cpg_count_gencode.txt
#bedtools intersect -b 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-J-2_cpg_count_gencode.txt
#bedtools intersect -b 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-J-7_cpg_count_gencode.txt
#bedtools intersect -b 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-R-180_cpg_count_gencode.txt
#bedtools intersect -b 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-R-183_cpg_count_gencode.txt
#bedtools intersect -b 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-V-613_cpg_count_gencode.txt
#bedtools intersect -b 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 2-V-620_cpg_count_gencode.txt
#bedtools intersect -b 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-J-2_cpg_count_gencode.txt
#bedtools intersect -b 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-J-7_cpg_count_gencode.txt
#bedtools intersect -b 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-R-180_cpg_count_gencode.txt
#bedtools intersect -b 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-R-183_cpg_count_gencode.txt
#bedtools intersect -b 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-613_cpg_count_gencode.txt
#bedtools intersect -b 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt -a gencode_04.bed -wa -wb > 3-V-620_cpg_count_gencode.txt
#

#bedtools intersect -b significant_met.gff -a gencode_02.gff -wa -wb > significant_met_gencode.txt


#bedtools intersect -b EVM_combined.gff -a gencode_04.bed -wa -wb > EVM_combined_gencode.gff

#bedtools intersect -b 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a EVM_combined_gencode.gff -wa -wb > 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gencode.gff



#bedtools intersect -b EVM_combined_gene.gff -a gencode_02.gff -wa -wb > EVM_combined_gene_gencode.gff

for FILE in $(ls $DATADIRECTORY/*_no_first_line_rearranged5.txt)
do

bedtools intersect -b ${FILE##*/} -a EVM_combined_gene_upstream.gff3 -wa -wb > ${FILE##*/}_EVM_combined_gene_upstream.gff
bedtools intersect -b ${FILE##*/} -a EVM_combined_gene_downstream.gff3 -wa -wb > ${FILE##*/}_EVM_combined_gene_downstream.gff
bedtools intersect -b ${FILE##*/} -a EVM_combined_gene.gff3 -wa -wb > ${FILE##*/}_EVM_combined_gene.gff
bedtools intersect -b ${FILE##*/} -a EVM_combined_exon.gff3 -wa -wb > ${FILE##*/}_EVM_combined_exon.gff

done ;

#bedtools intersect -b 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt -a EVM_combined_gene_upstream.gff3 -wa -wb > 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream.gff



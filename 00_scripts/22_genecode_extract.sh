#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

cd $DATADIRECTORY

grep -c "UPSTREAM" 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "UPSTREAM" 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "DOWNSTREAM" 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "INTRON" 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "EXON_CDS" 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
grep -c "GENE_mRNA" 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 2-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-J-2_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-J-7_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-R-180_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-R-183_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-V-613_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 3-V-620_cpg_count_gencode.txt >> genecode_all_results.txt
wc -l 1-J-2_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 1-J-7_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 1-R-180_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 1-R-183_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 1-V-613_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 1-V-620_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-J-2_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-J-7_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-R-180_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-R-183_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-V-613_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 2-V-620_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-J-2_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-J-7_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-R-180_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-R-183_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-V-613_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt
wc -l 3-V-620_cpg_count.txt >> genecode_all_results.txt_no_first_line_rearranged5.txt >> genecode_all_results.txt

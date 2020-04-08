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

#bedtools map -b 3-J-7_04.bed -a Correspondance_scaff_08.gff > 3-J-7_04_correspondance.bed

#bedtools intersect -a 3-J-7_04.bed -b Correspondance_scaff_07.gff -wa -wb > 3-J-7_04_correspondance.bed


########################### in local: From the BedGraph files, create bed files

#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-V-620.bed > /Users/pierre-louisstenger/Desktop/bed/3-V-620.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-J-7.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-J-7.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-R-180.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-R-180.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-R-183.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-R-183.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-V-613.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-V-613.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-V-620.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-V-620.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-J-2.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-J-2.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-J-7.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-J-7.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-R-180.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-R-180.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-R-183.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-R-183.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-V-613.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-V-613.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/2-V-620.bedGraph > /Users/pierre-louisstenger/Desktop/bed/2-V-620.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-J-2.bedGraph > /Users/pierre-louisstenger/Desktop/bed/3-J-2.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-J-7.bedGraph > /Users/pierre-louisstenger/Desktop/bed/3-J-7.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-R-180.bedGraph > /Users/pierre-louisstenger/Desktop/bed/3-R-180.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-R-183.bedGraph > /Users/pierre-louisstenger/Desktop/bed/3-R-183.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/3-V-613.bedGraph > /Users/pierre-louisstenger/Desktop/bed/3-V-613.bed
#awk '{print $1"\t"$2"\t"$3"\t"$4}' /Users/pierre-louisstenger/CARNATION/Thèse/BS-Seq/08\ -\ IGV/Bed/1-J-2.bedGraph > /Users/pierre-louisstenger/Desktop/bed/1-J-2.bed

############### In cluster


bedtools intersect -a 3-V-620.bed -b Correspondance_scaff_07.gff -wa -wb > 3-V-620_correspondance.bed
bedtools intersect -a 1-J-7.bed -b Correspondance_scaff_07.gff -wa -wb > 1-J-7_correspondance.bed
bedtools intersect -a 1-R-180.bed -b Correspondance_scaff_07.gff -wa -wb > 1-R-180_correspondance.bed
bedtools intersect -a 1-R-183.bed -b Correspondance_scaff_07.gff -wa -wb > 1-R-183_correspondance.bed
bedtools intersect -a 1-V-613.bed -b Correspondance_scaff_07.gff -wa -wb > 1-V-613_correspondance.bed
bedtools intersect -a 1-V-620.bed -b Correspondance_scaff_07.gff -wa -wb > 1-V-620_correspondance.bed
bedtools intersect -a 2-J-2.bed -b Correspondance_scaff_07.gff -wa -wb > 2-J-2_correspondance.bed
bedtools intersect -a 2-J-7.bed -b Correspondance_scaff_07.gff -wa -wb > 2-J-7_correspondance.bed
bedtools intersect -a 2-R-180.bed -b Correspondance_scaff_07.gff -wa -wb > 2-R-180_correspondance.bed
bedtools intersect -a 2-R-183.bed -b Correspondance_scaff_07.gff -wa -wb > 2-R-183_correspondance.bed
bedtools intersect -a 2-V-613.bed -b Correspondance_scaff_07.gff -wa -wb > 2-V-613_correspondance.bed
bedtools intersect -a 2-V-620.bed -b Correspondance_scaff_07.gff -wa -wb > 2-V-620_correspondance.bed
bedtools intersect -a 3-J-2.bed -b Correspondance_scaff_07.gff -wa -wb > 3-J-2_correspondance.bed
bedtools intersect -a 3-J-7.bed -b Correspondance_scaff_07.gff -wa -wb > 3-J-7_correspondance.bed
bedtools intersect -a 3-R-180.bed -b Correspondance_scaff_07.gff -wa -wb > 3-R-180_correspondance.bed
bedtools intersect -a 3-R-183.bed -b Correspondance_scaff_07.gff -wa -wb > 3-R-183_correspondance.bed
bedtools intersect -a 3-V-613.bed -b Correspondance_scaff_07.gff -wa -wb > 3-V-613_correspondance.bed
bedtools intersect -a 1-J-2.bed -b Correspondance_scaff_07.gff -wa -wb > 1-J-2_correspondance.bed

awk '{print $9"\t"$5}' 3-V-620_correspondance.bed > 3-V-620_correspondance_02.bed
awk '{print $9"\t"$5}' 1-J-7_correspondance.bed > 1-J-7_correspondance_02.bed
awk '{print $9"\t"$5}' 1-R-180_correspondance.bed > 1-R-180_correspondance_02.bed
awk '{print $9"\t"$5}' 1-R-183_correspondance.bed > 1-R-183_correspondance_02.bed
awk '{print $9"\t"$5}' 1-V-613_correspondance.bed > 1-V-613_correspondance_02.bed
awk '{print $9"\t"$5}' 1-V-620_correspondance.bed > 1-V-620_correspondance_02.bed
awk '{print $9"\t"$5}' 2-J-2_correspondance.bed > 2-J-2_correspondance_02.bed
awk '{print $9"\t"$5}' 2-J-7_correspondance.bed > 2-J-7_correspondance_02.bed
awk '{print $9"\t"$5}' 2-R-180_correspondance.bed > 2-R-180_correspondance_02.bed
awk '{print $9"\t"$5}' 2-R-183_correspondance.bed > 2-R-183_correspondance_02.bed
awk '{print $9"\t"$5}' 2-V-613_correspondance.bed > 2-V-613_correspondance_02.bed
awk '{print $9"\t"$5}' 2-V-620_correspondance.bed > 2-V-620_correspondance_02.bed
awk '{print $9"\t"$5}' 3-J-2_correspondance.bed > 3-J-2_correspondance_02.bed
awk '{print $9"\t"$5}' 3-J-7_correspondance.bed > 3-J-7_correspondance_02.bed
awk '{print $9"\t"$5}' 3-R-180_correspondance.bed > 3-R-180_correspondance_02.bed
awk '{print $9"\t"$5}' 3-R-183_correspondance.bed > 3-R-183_correspondance_02.bed
awk '{print $9"\t"$5}' 3-V-613_correspondance.bed > 3-V-613_correspondance_02.bed
awk '{print $9"\t"$5}' 1-J-2_correspondance.bed > 1-J-2_correspondance_02.bed


for FILE in $(ls $DATADIRECTORY/*_correspondance_02.bed)
do

# count the number of position for each gene
awk -F '\t' '{print $1}' ${FILE##*/} | sort | uniq -c > ${FILE##*/}_mean_02.txt
# sum of the value for each gene
awk -F '\t' '{a[$1] += $2} END{for (i in a) print i, a[i]}' ${FILE##*/} | sort > ${FILE##*/}_mean_01.txt
# merge the data frame
paste ${FILE##*/}_mean_01.txt ${FILE##*/}_mean_02.txt > ${FILE##*/}_mean_03.txt
# calculate the means for GBM
awk '{print $1"\t"$2/$3}' ${FILE##*/}_mean_03.txt > ${FILE##*/}_GBM.txt

done ;


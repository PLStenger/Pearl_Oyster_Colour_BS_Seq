#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
#DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/99_tests
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation
GFF=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation/sspace.final.scaffolds_no_pipe_size.gff3
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

# https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

#for FILE in $(ls $DATADIRECTORY/Inversed_3V620_3J2_Diffmeth.norm_Q_0_05*.interest*.txt)
#for FILE in $(ls $DATADIRECTORY/Diffmeth.norm_Inversed_3V620_3J2_color_battle_all*interest_diff25.q0.001.txt)
#for FILE in $(ls $DATADIRECTORY/Inversed_3V620_3J2_Diffmeth.norm_Q_0_05_all_treatment_color_*time_3.txt)
#for FILE in $(ls $DATADIRECTORY/Diffmeth.norm_Inversed_3V620_3J2_color_battle_all_*yellow.txt)
#for FILE in $(ls $DATADIRECTORY/*txt)
#for FILE in $(ls $DATADIRECTORY/*_cpg_count.txt)
#
#do

#tail -n +2 ${FILE##*/} > ${FILE##*/}_no_first_line.txt
#sed 's/"//g' ${FILE##*/}_no_first_line.txt > ${FILE##*/}_no_first_line_rearranged.txt
#awk '{print $2"\t"".""\t""transcrit""\t"$4"\t"$5}' ${FILE##*/}_no_first_line_rearranged.txt > ${FILE##*/}_no_first_line_rearranged2.txt

#sort ${FILE##*/}_no_first_line_rearranged2.txt > ${FILE##*/}_no_first_line_rearranged3.txt

#split -l 200000 --numeric-suffixes ${FILE##*/}_no_first_line_rearranged3.txt ${FILE##*/}_no_first_line_rearranged3_split_

#mac2unix ${FILE##*/}_no_first_line_rearranged2.txt

#bedtools intersect -a $GFF -b $DATADIRECTORY/${FILE##*/}_no_first_line_rearranged3.txt > $OUTPUT/${FILE##*/}_annotated.txt

#done;


#for FILE in $(ls $DATADIRECTORY/*_split_*)

scp -r 3-V-620_cpg_count.txt_no_first_line_rearranged3_split_36 > 3-V-620_cpg_count.txt_no_first_line_rearranged3_split_36_2.txt

bedtools intersect -a $GFF -b 3-V-620_cpg_count.txt_no_first_line_rearranged3_split_36_2.txt > $OUTPUT/3-V-620_cpg_count.txt_no_first_line_rearranged3_split_36_annotated.txt

#done;

#
#do
#
#tail -n +2 ${FILE##*/} > ${FILE##*/}_no_first_line.txt
#awk '{print $2"\t"".""\t""transcrit""\t"$3"\t"$4"\t"$6"\t"$7"\t"$8}' ${FILE##*/}_no_first_line.txt > ${FILE##*/}_no_first_line_rearranged.txt
#
#bedtools intersect -a $GFF -b $DATADIRECTORY/${FILE##*/}_no_first_line_rearranged.txt > $OUTPUT/${FILE##*/}_annotated.txt
#
#done;
#
#for FILE in $(ls $DATADIRECTORY/Inversed_3V620_3J2_Diffmeth.norm_Q_0_05_all_control_color_time_*2.txt)
#
#do
#
#tail -n +2 ${FILE##*/} > ${FILE##*/}_no_first_line.txt
#awk '{print $2"\t"".""\t""transcrit""\t"$3"\t"$4"\t"$6"\t"$7"\t"$8}' ${FILE##*/}_no_first_line.txt > ${FILE##*/}_no_first_line_rearranged.txt
#
#bedtools intersect -a $GFF -b $DATADIRECTORY/${FILE##*/}_no_first_line_rearranged.txt > $OUTPUT/${FILE##*/}_annotated.txt
#
#done;
#
#rm *_no_first_line*


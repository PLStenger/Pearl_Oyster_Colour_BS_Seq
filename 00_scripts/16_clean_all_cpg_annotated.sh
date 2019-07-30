#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation

cd $DATADIRECTORY

#for FILE in $(ls $DATADIRECTORY/*cpg_count.txt_annotated.txt)
#
#do
#
#awk '{print $4}' ${FILE##*/} > ${FILE##*/}_column4.txt
#awk -F";" '$1=$1' OFS="\t" ${FILE##*/}_column4.txt > ${FILE##*/}_column4_split.txt 
#awk '{print $1}' ${FILE##*/}_column4_split.txt  > ${FILE##*/}_column4_split2.txt 
#sed 's/D=evm.TU.//g' ${FILE##*/}_column4_split2.txt > ${FILE##*/}_column4_split2_ok.txt 
#sed 's/ID=evm.model.//g' ${FILE##*/}_column4_split2_ok.txt > ${FILE##*/}_column4_split2_ok2.txt 
#awk -F".exon" '$1=$1' OFS="\t" ${FILE##*/}_column4_split2_ok2.txt  > ${FILE##*/}_column4_split2_ok3.txt 
#awk '{print $1}' ${FILE##*/}_column4_split2_ok3.txt  > ${FILE##*/}_column4_split2_ok3_final.txt
#sed 's/ID=cds.evm.model.//g' ${FILE##*/}_column4_split2_ok3_final.txt > ${FILE##*/}_column4_split2_ok3_final2.txt
#sed 's/Iscaff/scaff/g' ${FILE##*/}_column4_split2_ok3_final2.txt > ${FILE##*/}_notyet_column4.txt
#awk '{print $1"_"$2}' ${FILE##*/} > ${FILE##*/}_column1.txt
#paste ${FILE##*/}_column1.txt ${FILE##*/}_notyet_column4.txt > ${FILE##*/}_database.txt
##sort -u ${FILE##*/}_column4_split2_ok3_final3.txt > ${FILE##*/}_transcrits_list.txt
#
#
#done;
#
#rm *_column4*
#rm *_column1*


for FILE in $(ls $DATADIRECTORY/*_annotated.txt_database.txt)

do

awk -F '\t' '{print $2}' ${FILE##*/} | sort | uniq -c | sort -nr > number_of_cpg_by_transcript_${FILE##*/}.txt

done;



#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation
GFF=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation/sspace.final.scaffolds_no_pipe_size.gff3
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

# https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

for FILE in $(ls $DATADIRECTORY/Inversed_3V620_3J2_Diffmeth.norm_Q_0_05*.hyp*.txt)

do

tail -n +2 ${FILE##*/} > ${FILE##*/}_no_first_line.txt
awk '{print $2"\t"".""\t""transcrit""\t"$3"\t"$4"\t"$6"\t"$7"\t"$8}' ${FILE##*/}_no_first_line.txt > ${FILE##*/}_no_first_line_rearranged.txt

bedtools intersect -a $GFF -b $DATADIRECTORY/${FILE##*/}_no_first_line_rearranged.txt > $OUTPUT/${FILE##*/}_annotated.txt

done;

#rm *_no_first_line*

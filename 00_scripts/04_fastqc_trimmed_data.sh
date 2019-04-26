#!/bin/bash

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/04_fastqc_trimmed
SCRIPT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts/04_fastqc_trimmed_data
HEADER=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts/header.txt
FASTQCENV=". /appli/bioinfo/fastqc/latest/env.sh"

mkdir -p $SCRIPT

for FILE in $(ls $DATADIRECTORY/*.fastq.gz)
do
        cp $HEADER $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "$FASTQCENV"  >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "fastqc $FILE -o $DATAOUTPUT" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        qsub $SCRIPT/fastqc_${FILE##*/}.qsub ;
done ;

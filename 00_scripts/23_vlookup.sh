#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

cd /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' Correspondance_scaff_08.txt 1-J-2_correspondance_02.bed_GBM.txt > 1-J-2_correspondance_02.bed_GBM_vlookup.txt

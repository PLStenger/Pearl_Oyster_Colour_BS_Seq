#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

scp -r /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark/xxxx.txt /home/datawork-ihpe-nos/Pmarg_color/BS-Seq

#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

cd /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-J-2_correspondance_02.bed_GBM.txt  > 1-J-2_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-V-620_correspondance_02.bed_GBM.txt  > 1-V-620_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-V-613_correspondance_02.bed_GBM.txt  > 2-V-613_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-R-183_correspondance_02.bed_GBM.txt  > 3-R-183_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-J-7_correspondance_02.bed_GBM.txt  > 1-J-7_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-J-2_correspondance_02.bed_GBM.txt  > 2-J-2_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-V-620_correspondance_02.bed_GBM.txt  > 2-V-620_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-V-613_correspondance_02.bed_GBM.txt  > 3-V-613_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-R-180_correspondance_02.bed_GBM.txt  > 1-R-180_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-J-7_correspondance_02.bed_GBM.txt  > 2-J-7_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-J-2_correspondance_02.bed_GBM.txt  > 3-J-2_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-V-620_correspondance_02.bed_GBM.txt  > 3-V-620_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-R-183_correspondance_02.bed_GBM.txt  > 1-R-183_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-R-180_correspondance_02.bed_GBM.txt  > 2-R-180_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-J-7_correspondance_02.bed_GBM.txt  > 3-J-7_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 1-V-613_correspondance_02.bed_GBM.txt  > 1-V-613_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 2-R-183_correspondance_02.bed_GBM.txt  > 2-R-183_correspondance_02.bed_GBM_vlookup.txt

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
FNR==NR{
  a[$1]=$2
  next
}
{ if ($1 in a) {print $1, a[$1]} else {print $1, "NA"}  }' Correspondance_scaff_08.txt 3-R-180_correspondance_02.bed_GBM.txt  > 3-R-180_correspondance_02.bed_GBM_vlookup.txt

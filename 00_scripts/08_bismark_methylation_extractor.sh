#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


GENOME=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome
BAM=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home1/scratch/plstenge/bismark_methylation_extractor
BISMARK_ENV=". /appli/bioinfo/bismark/0.19/env.sh" #version 0.19
NCPU=4

#cd $DATADIRECTORY
cd $OUTPUT
$BISMARK_ENV

for FILE in $(ls $BAM/*deduplicated.bam)

do
	
bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/${FILE##*/} -o $OUTPUT

	
done ;

	


# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_11.3-V-620_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_1.3-R-180_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_18.1-J-2_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_19.2-J-2_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_20.3-J-2_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_21.1-J-7_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_22.2-J-7_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_23.3-J-7_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_25.1-R-180_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_27.2-R-180_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_3.2-R-183_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_5.3-R-183_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_6.1-V-613_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_7.2-V-613_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_8.3-V-613_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_9.1-V-620_R1_paired_bismark_bt2_pe.bam -o $OUTPUT
# bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU $BAM/Index_2.1-R-183_R1_paired_bismark_bt2_pe.bam  -o $OUTPUT




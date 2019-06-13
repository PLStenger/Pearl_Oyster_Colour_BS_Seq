#!/usr/bin/env Rscript

library(methylKit)
library (graphics)
library (tools)

setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark")

### COMPARATIVE ANALYSIS ###


save(my_meth_treatment_all_treatment_color_against_color, file = "my_meth_treatment_all_treatment_color_against_color_clean.rda")


## Per Base ##
# with normalization #
load("my_meth_treatment_all_treatment_color_against_color_clean.rda")

# with normalization #
normalized.myallmeth=normalizeCoverage(my_meth_treatment_all_treatment_color_against_color)
str(normalized.myallmeth)
message ("normalize.done")

# Filtering samples based on read coverage #
filtered.normalized.myallmeth.10=filterByCoverage(normalized.myallmeth,
                                                  lo.count = 10,
                                                  lo.perc = NULL,
                                                  hi.count = NULL,
                                                  hi.perc = 99.9)

filtered.normalized.myallmeth.10.all_treatment_color_against_color = filtered.normalized.myallmeth.10
Allmeth.norm.all_treatment_color_against_color=unite(filtered.normalized.myallmeth.10.all_treatment_color_against_color,destrand = FALSE)



Allmeth.norm=Allmeth.norm.all_treatment_color_against_color

save(Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite.rda")
message("my_meth_treatment_all_treatment_color_against_color_cleandone")

write.table(Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)

perc.Allmeth.norm <- percMethylation(Allmeth.norm)
write.table(perc.Allmeth.norm, file = "my_meth_treatment_all_treatment_color_against_color_clean_unite_percent.txt", sep = "\t", quote = FALSE)
message ("done perc meth.norm")



### DIFFERENTIAL METHYLATION ANALYSIS ###

# with normalization #


Diffmeth.norm=calculateDiffMeth(Allmeth.norm, mc.cores = 4)

save(Diffmeth.norm, file = "Diffmeth_my_meth_treatment_all_treatment_color_against_color_clean_unite.rda")

write.table(Diffmeth.norm, file = "Diffmeth_my_meth_treatment_all_treatment_color_against_color_clean_unite.txt", sep = "\t", quote = FALSE)

message("Diffmeth_my_meth_treatment_all_treatment_color_against_color_clean_unite done")

Diffmeth.norm.interest=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01)
write.table(Diffmeth.norm.interest, file = "Diffmeth.my_meth_treatment_all_treatment_color_against_color_clean_unitediff25.q0.001.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hyper=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hyper")
write.table(Diffmeth.norm.interest.hyper, file = "Diffmeth.my_meth_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hyper.txt", sep = "\t", quote = FALSE)

Diffmeth.norm.interest.hypo=getMethylDiff(Diffmeth.norm, difference = 25, qvalue = 0.01, type = "hypo")
write.table(Diffmeth.norm.interest.hypo, file = "Diffmeth.my_meth_treatment_all_treatment_color_against_color_clean_unite.diff25.q0.001.hypo.txt", sep = "\t", quote = FALSE)




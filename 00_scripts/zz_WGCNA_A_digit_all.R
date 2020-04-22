#!/usr/bin/env Rscript

# installing WGCNA:
#source("http://bioconductor.org/biocLite.R")
#biocLite(c("AnnotationDbi", "impute", "GO.db", "preprocessCore"))
#BiocManager::install(c("AnnotationDbi", "impute", "GO.db", "preprocessCore"))
#install.packages("flashClust",repos="http://cran.us.r-project.org")
#install.packages("WGCNA",dependencies=TRUE,repos="http://cran.us.r-project.org")
#install.packages("scales")
#install.packages("assertthat")
#install.packages("ape")

library(WGCNA)
library(flashClust)
library(ape)
library("assertthat")
library("scales")
library(pheatmap)


#setwd("~/Desktop/WGCNA_A_digitifera")
setwd("/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/11_A_digitifera_mat")

# The following setting is important, do not omit.
options(stringsAsFactors=FALSE)

#Read in the expr data set, from HT-Seq count 
# https://labs.genetics.ucla.edu/horvath/htdocs/CoexpressionNetwork/Rpackages/WGCNA/faq.html
# We then recommend a variance-stabilizing transformation. For example, 
# package DESeq2 implements the function varianceStabilizingTransformation which we have found useful, 
# but one could also start with normalized counts (or RPKM/FPKM data) and log-transform them using log2(x+1). 
# For highly expressed features, the differences between full variance stabilization and a simple log transformation are small.

# If using Excel, the formalua is : =LOG(B2+1; 2)

## Bash script in local
#
#awk '{print $2}'       count_Control_1_30a.txt >       count_Control_1_30a_col.txt
#awk '{print $2}'       count_Control_1_30b.txt >       count_Control_1_30b_col.txt
#awk '{print $2}'       count_Control_1_30c.txt >       count_Control_1_30c_col.txt
#awk '{print $2}'       count_Control_2_35a.txt >       count_Control_2_35a_col.txt
#awk '{print $2}'       count_Control_2_35b.txt >       count_Control_2_35b_col.txt
#awk '{print $2}'       count_Control_2_35c.txt >       count_Control_2_35c_col.txt
#awk '{print $2}'       count_Control_3_30a.txt >       count_Control_3_30a_col.txt
#awk '{print $2}'       count_Control_3_30b.txt >       count_Control_3_30b_col.txt
#awk '{print $2}'       count_Control_3_30c.txt >       count_Control_3_30c_col.txt
#awk '{print $2}' count_Acclimation_1_31_5a.txt > count_Acclimation_1_31_5a_col.txt
#awk '{print $2}' count_Acclimation_1_31_5b.txt > count_Acclimation_1_31_5b_col.txt
#awk '{print $2}' count_Acclimation_1_31_5c.txt > count_Acclimation_1_31_5c_col.txt
#awk '{print $2}'   count_Acclimation_2_35a.txt >   count_Acclimation_2_35a_col.txt
#awk '{print $2}'   count_Acclimation_2_35b.txt >   count_Acclimation_2_35b_col.txt
#awk '{print $2}'   count_Acclimation_2_35c.txt >   count_Acclimation_2_35c_col.txt
#awk '{print $2}'   count_Acclimation_3_30a.txt >   count_Acclimation_3_30a_col.txt
#awk '{print $2}'   count_Acclimation_3_30b.txt >   count_Acclimation_3_30b_col.txt
#awk '{print $2}'   count_Acclimation_3_30c.txt >   count_Acclimation_3_30c_col.txt
#
#awk '{print $1}'       count_Control_1_30a.txt >       names_genes_col.txt
#
#paste names_genes_col.txt count_Control_1_30a_col.txt count_Control_1_30b_col.txt count_Control_1_30c_col.txt count_Control_2_35a_col.txt count_Control_2_35b_col.txt count_Control_2_35c_col.txt count_Control_3_30a_col.txt count_Control_3_30b_col.txt count_Control_3_30c_col.txt count_Acclimation_1_31_5a_col.txt count_Acclimation_1_31_5b_col.txt count_Acclimation_1_31_5c_col.txt count_Acclimation_2_35a_col.txt count_Acclimation_2_35b_col.txt count_Acclimation_2_35c_col.txt count_Acclimation_3_30a_col.txt count_Acclimation_3_30b_col.txt count_Acclimation_3_30c_col.txt > all_count.txt
#
#sed -i '1s/^/Genes Control_1_30a Control_1_30b Control_1_30c Control_2_35a Control_2_35b Control_2_35c Control_3_30a Control_3_30b Control_3_30c Acclimation_1_31_5a Acclimation_1_31_5b Acclimation_1_31_5c Acclimation_2_35a Acclimation_2_35b Acclimation_2_35c Acclimation_3_30a Acclimation_3_30b Acclimation_3_30c\n/' all_count.txt 
#
## header:
## Genes	Control_1_30a	Control_1_30b	Control_1_30c	Control_2_35a	Control_2_35b	Control_2_35c	Control_3_30a	Control_3_30b	Control_3_30c	Acclimation_1_31_5a	Acclimation_1_31_5b	Acclimation_1_31_5c	Acclimation_2_35a	Acclimation_2_35b	Acclimation_2_35c	Acclimation_3_30a	Acclimation_3_30b	Acclimation_3_30c


# And then in excel:
# =LOG(B2+1; 2)

datExpr<-read.table("logcpm.txt", header=T)
# Take a quick look at what is in the data set:
dim(datExpr)
head(datExpr)


# We first check for genes and samples with too many missing values
datExpr0 = as.data.frame(t(datExpr))
gsg = goodSamplesGenes(datExpr0, verbose = 3);
gsg$allOK #If the last statement returns TRUE, all genes have passed the cuts

# If not, we remove the offending genes and samples from the data :
if (!gsg$allOK)
{
  # Optionally, print the gene and sample names that were removed:
  if (sum(!gsg$goodGenes)>0) 
    printFlush(paste("Removing genes:", paste(names(datExpr0)[!gsg$goodGenes], collapse = ", ")));
  if (sum(!gsg$goodSamples)>0) 
    printFlush(paste("Removing samples:", paste(rownames(datExpr0)[!gsg$goodSamples], collapse = ", ")));
  # Remove the offending genes and samples from the data:
  datExpr0 = datExpr0[gsg$goodSamples, gsg$goodGenes]
}



# Next we cluster the samples (in contrast to clustering genes that will come later) to see if there are any obvious outliers.
sampleTree = hclust(dist(datExpr0), method = "average");
# Plot the sample tree: Open a graphic output window of size 12 by 9 inches
# The user should change the dimensions if the window is too large or too small.
sizeGrWindow(12,9)
#pdf(file = "Plots/sampleClustering.pdf", width = 12, height = 9);
par(cex = 0.6);
par(mar = c(0,4,2,0))
plot(sampleTree, main = "Sample clustering to detect outliers", sub="", xlab="", cex.lab = 1.5, 
     cex.axis = 1.5, cex.main = 2)

plot(sampleTree, main = "Sample clustering", sub="", xlab="", cex.lab = 1.5, 
     cex.axis = 1.5, cex.main = 2)



# Plot a line to show the cut
abline(h = 400, col = "magenta");
# Determine cluster under the line
clust = cutreeStatic(sampleTree, cutHeight = 400, minSize = 10)
table(clust)
# clust 1 contains the samples we want to keep.
keepSamples = (clust==1)
datExpr = datExpr0[keepSamples, ]
nGenes = ncol(datExpr)
nSamples = nrow(datExpr)

variancedatExpr=as.vector(apply(as.matrix(datExpr),2,var, na.rm=T))
no.presentdatExpr=as.vector(apply(!is.na(as.matrix(datExpr)),2, sum) )
# Another way of summarizing the number of pressent entries 
table(no.presentdatExpr)

# Keep only genes whose variance is non-zero and have at least 4 present entries
KeepGenes= variancedatExpr>0.05
table(KeepGenes)
datExpr=datExpr[, KeepGenes]
#View(datExpr)
name_datExpr <-colnames(datExpr)
head(name_datExpr)




allTraits = read.table("trait_02.txt", header=T);
names(allTraits)

# Form a data frame analogous to expression data that will hold the clinical traits.

temp = rownames(datExpr);
traitRows = match(temp, allTraits$Ind);
datTraits = allTraits[traitRows, -1];
rownames(datTraits) = allTraits[traitRows, 1];
str(datTraits)

collectGarbage();


# Re-cluster samples
sampleTree2 = hclust(dist(datExpr), method = "average")
# Convert traits to a color representation: white means low, magenta means high, grey means missing entry
traitColors = numbers2colors(datTraits,signed= FALSE);
# Plot the sample dendrogram and the colors underneath.
pdf("dendo_heatmap.pdf",width=12,height=9)
par(mar=c(1, 10, 1, 1))
plotDendroAndColors(sampleTree2, traitColors,
                    groupLabels = names(datTraits), 
                    main = "Sample dendrogram and trait heatmap")

dev.off()


save(datExpr, datTraits, file = "dataInput_subset.Rda")


########################## Module construction step-by-step #################################



#setting is important, do not omit.
options(stringsAsFactors = FALSE);
## Allow multi-threading within WGCNA. At present this call is necessary.
## Any error here may be ignomagenta but you may want to update WGCNA if you see one.
## Caution: skip this line if you run RStudio or other third-party R environments.
## See note above.
##enableWGCNAThreads()
## Load the data saved in the first part
#lnames = load(file = "dataInput_subset.Rda");
##The variable lnames contains the names of loaded variables.
#lnames
#
## Very important for sft !!
#allowWGCNAThreads() 
#
#load(file = "dataInput_subset.Rda")
## Choose a set of soft-thresholding powers
#powers = c(c(1:10), seq(from = 10, to=24, by=2))
## Call the network topology analysis function
#sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 5,networkType="signed")
## Plot the results:
#sizeGrWindow(9, 5)
#par(mfrow = c(1,2));
#cex1 = 0.9;
## Scale-free topology fit index as a function of the soft-thresholding power
#plot(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
#     xlab="Soft Threshold (power)",ylab="Scale Free Topology Model Fit,signed R^2",type="n",
#     main = paste("Scale independence"));
#text(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
#     labels=powers,cex=cex1,col="magenta");
## this line corresponds to using an R^2 cut-off of h
#abline(h=0.84,col="magenta") 
## Mean connectivity as a function of the soft-thresholding power
#plot(sft$fitIndices[,1], sft$fitIndices[,5],
#     xlab="Soft Threshold (power)",ylab="Mean Connectivity", type="n",
#     main = paste("Mean connectivity"))
#text(sft$fitIndices[,1], sft$fitIndices[,5], labels=powers, cex=cex1,col="magenta")
#
#
#
#save(sft,file="sft_signed.Rda")
##View(sft$fitIndices)
#
##pickSoftThreshold(
##  datExpr, 
##  dataIsExpr = TRUE,
##  weights = NULL,
##  RsquamagentaCut = 0.85, 
##  powerVector = c(seq(1, 10, by = 1), seq(12, 20, by = 2)), 
##  removeFirst = FALSE, nBreaks = 10, blockSize = NULL, 
##  corFnc = cor, corOptions = list(use = 'p'), 
##  networkType = "unsigned",
##  moreNetworkConcepts = FALSE,
##  gcInterval = NULL,
##  verbose = 0, indent = 0)
#
##softPower = 20; #reached 90 R2 # Here 20 = 0.80237680
# #Error in cor_mat^power : non-numeric argument to binary operator
##adjacency = adjacency(datExpr, power = "softPower", type="signed"); # Error in cor_mat^power : non-numeric argument to binary operator
#
#
## --> Error in cor_mat^power : non-numeric argument to binary operator
#
#
######################
## making modules
#
#load(file = "dataInput_subset.Rda")
#load(file = "sft_signed.Rda")
#
#
###s.th=18 # re-specify according to previous section
#s.th=6 # re-specify according to previous section
### the following two lines take a long time, prepare to wait 15-20 min
### (if you don;t want to wait but proceed with exercise, skip to next section - we have results of this one recorded already)
#adjacency = adjacency(datExpr, power = s.th, type="signed");
#
#save(adjacency,file="adjacency.RData")
#
#TOM = TOMsimilarity(adjacency,TOMType="signed");
#dissTOM = 1-TOM
#save(adjacency, TOM, dissTOM, file="adjacency_2.RData")
## Call the hierarchical clustering function
#geneTree = flashClust(as.dist(dissTOM), method = "average");
#
## We like large modules, so we set the minimum module size relatively high:
#minModuleSize = 30; 
#dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,
#                            deepSplit = 2, pamRespectsDendro = FALSE,
#                            minClusterSize = minModuleSize);
#dynamicColors = labels2colors(dynamicMods)
#table(dynamicColors)
#
#datt = datExpr
#
## Calculate eigengenes
#MEList = moduleEigengenes(datt, colors = dynamicColors)
#MEs = MEList$eigengenes
## Calculate dissimilarity of module eigengenes
#MEDiss = 1-cor(MEs);
#METree = flashClust(as.dist(MEDiss), method = "average");
#
#save(dynamicMods,dynamicColors,MEs,METree,geneTree,file="1stPassModules.RData")

#########################
# merging modules:

load('adjacency.RData')
load('adjacency_2.RData')
load('1stPassModules.RData')

mm=load('1stPassModules.RData')
mm
library(WGCNA)
#lnames=load('wgcnaData.RData')
datt = datExpr
# traits
print('head(datt)')
head(datt)
print('head(datExpr)')
head(datExpr)
print('head(datTraits)')
head(datTraits)

#quartz()

MEDissThres = 0.35 # in the first pass, set this to 0 - no merging (we want to see the module-traits heatmap first, then decide which modules are telling us the same story and better be merged)
sizeGrWindow(7, 6)
plot(METree, main = "Clustering of module eigengenes",
     xlab = "", sub = "")
# Plot the cut line into the dendrogram
abline(h=MEDissThres, col = "magenta")  # on 2nd pass: does this cut height meet your merging goals? If not, reset MEDissThres and replot

# Call an automatic merging function
merge = mergeCloseModules(datt, dynamicColors, cutHeight = MEDissThres, verbose = 3)
# The merged module colors
mergedColors = merge$colors;
# Eigengenes of the new merged modules:
mergedMEs = merge$newMEs

# plotting the fabulous ridiculogram
#quartz()
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors),
                    c("Dynamic Tree Cut", "Merged dynamic"),
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = FALSE, guideHang = 0.05,lwd=0.3)

# Rename to moduleColors
moduleColors = mergedColors
# Construct numerical labels corresponding to the colors
colorOrder = c("grey", standardColors(50));
moduleLabels = match(moduleColors, colorOrder)-1;
MEs = mergedMEs;

# Calculate dissimilarity of module eigengenes
#quartz()
MEDiss = 1-cor(MEs);
# Cluster module eigengenes
METree = flashClust(as.dist(MEDiss), method = "average");
# Plot the result
sizeGrWindow(7, 6)
plot(METree, main = "Clustering of module eigengenes",
     xlab = "", sub = "")

# how many genes in each module?
table(moduleColors)
# Save module colors and labels for use in subsequent parts
save(MEs, geneTree, moduleLabels, moduleColors, file = "networkdata_signed.RData")

###################
# plotting correlations with traits:
load(file = "networkdata_signed.RData")
#load(file = "wgcnaData.RData")

# Define numbers of genes and samples
nGenes = ncol(datt);
nSamples = nrow(datt);
# Recalculate MEs with color labels
MEs0 = moduleEigengenes(datt, moduleColors)$eigengenes
MEs = orderMEs(MEs0)

# correlations of genes with eigengenes
moduleGeneCor=cor(MEs,datt)
moduleGenePvalue = corPvalueStudent(moduleGeneCor, nSamples);

moduleTraitCor = cor(MEs, datTraits, use = "p");
moduleTraitPvalue = corPvalueStudent(moduleTraitCor, nSamples);

# gene-trait correlations - a gene-by-gene heatmap corresponding to the droopy tree 
# (to make augmented ridiculogram as in mice-men-embryos paper)
# quartz()
# geneTraitCor = cor(datt, traits, use = "p");
# colnames(geneTraitCor)
# geneTraitCor=geneTraitCor[geneTree$order,]
# head(geneTraitCor)
# labeledHeatmap(Matrix = geneTraitCor,
# xLabels = colnames(geneTraitCor),
# xLabelsAngle=90,
# ySymbols = FALSE,
# colorLabels = FALSE,
# colors = blueWhiteRed(50),
# setStdMargins = FALSE, cex.text = 0.5,
# zlim = c(-1,1),
# main = paste("Gene-trait relationships"))

# module-trait correlations
#quartz()
textMatrix = paste(signif(moduleTraitCor, 2), "\n(",
                   signif(moduleTraitPvalue, 1), ")", sep = "");
dim(textMatrix) = dim(moduleTraitCor)

print("table moduleColor before the labeledHeatmap")
print(data.frame(table(moduleColors))) # gives numbers of genes in each module

sizeGrWindow(9,7)
par(mar = c(6, 8.5, 3, 3));
# Display the correlation values within a heatmap plot
labeledHeatmap(Matrix = moduleTraitCor,
               xLabels = names(datTraits),
               yLabels = names(MEs),
               ySymbols = names(MEs),
               colorLabels = FALSE,
               colors = blueWhiteRed(50),
               textMatrix = textMatrix,
               setStdMargins = FALSE,
               cex.text = 0.5,
               zlim = c(-1,1),
               main = paste("Module-trait relationships"))

#print(data.frame(table(moduleColors))) # gives numbers of genes in each module

# if it was first pass with no module merging, this is where you examine your heatmap
# and dendrogram of module eigengenes to see where you would like to see 
# where you woudl like to set cut height (MEDissThres parameter) in the previous section
# to merge modules that are talling the same story for your trait data

# good way to do it is to find a group of similar modules in the heat map and then see 
# at which tree height they connect in the dendrogram.

#############
# scatterplots of gene significance (correlation-based) vs kME

load(file = "networkdata_signed.RData")
#load(file = "wgcnaData.RData");
datTraits
table(moduleColors)
whichTrait="Acclimation"

nGenes = ncol(datt);
nSamples = nrow(datt);
selTrait = as.data.frame(datTraits[,whichTrait]);
names(selTrait) = whichTrait
# names (colors) of the modules
modNames = substring(names(MEs), 3)
geneModuleMembership = as.data.frame(signedKME(datt, MEs));
MMPvalue = as.data.frame(corPvalueStudent(as.matrix(geneModuleMembership), nSamples));
names(geneModuleMembership) = paste("MM", modNames, sep="");
names(MMPvalue) = paste("p.MM", modNames, sep="");
geneTraitSignificance = as.data.frame(cor(datt, selTrait, use = "p"));
GSPvalue = as.data.frame(corPvalueStudent(as.matrix(geneTraitSignificance), nSamples));
names(geneTraitSignificance) = paste("GS.", names(selTrait), sep="");
names(GSPvalue) = paste("p.GS.", names(selTrait), sep="");
#quartz()
par(mfrow=c(3,3))
counter=0
for(module in modNames[1:length(modNames)]){
  counter=counter+1
  if (counter>9) {
    #quartz()
    par(mfrow=c(3,3))
    counter=1
  }
  column = match(module, modNames);
  moduleGenes = moduleColors==module;
  #trr="heat resistance"
  verboseScatterplot(abs(geneModuleMembership[moduleGenes, column]),
                     abs(geneTraitSignificance[moduleGenes, 1]),
                     xlab = paste(module,"module membership"),
                     ylab = paste("GS for", whichTrait),
                     col = "grey50",mgp=c(2.3,1,0))
}

################
# eigengene-heatmap plot (sanity check - is the whole module driven by just one crazy sample?)
# note: this part does not make much sense for unsigned modules

#load(file = "networkdata_signed.RData")
#load(file = "wgcnaData.RData");

which.module="magenta" 
datME=MEs
datExpr=datt
#quartz()
ME=datME[, paste("ME",which.module, sep="")]
par(mfrow=c(2,1), mar=c(0.3, 5.5, 3, 2))
plotMat(t(scale(datExpr[,moduleColors==which.module ]) ),
        nrgcols=30,rlabels=F,rcols=which.module,
        main=which.module, cex.main=2)
par(mar=c(5, 4.2, 0, 0.7))
barplot(ME, col=which.module, main="", cex.main=2,
        ylab="eigengene expression",xlab="sample")

length(datExpr[1,moduleColors==which.module ]) # number of genes in chosen module

#################
# saving selected modules for GO and KOG analysis (two-parts: Fisher test, MWU test within-module)

library(WGCNA)
#load(file = "networkdata_signed.RData") # moduleColors, MEs
#load(file = "wgcnaData.RData") # vsd table
#load(file = "../data4wgcna.RData") # vsd table

# calculating modul memberships for all genes for all modules
allkME =as.data.frame(signedKME(datt, MEs)) 
names(allkME)=gsub("kME","",names(allkME))

whichModule="magenta"
table(moduleColors==whichModule) # how many genes are in it?

# Saving data for Fisher-MWU combo test (GO_MWU)
inModuleBinary=as.numeric(moduleColors==whichModule)
combo=data.frame("gene"=row.names(t(datExpr)),"Fish_kME"=allkME[,whichModule]*inModuleBinary)
write.csv(combo,file=paste(whichModule,".csv",sep=""),row.names=F,quote=F)

################
# plotting heatmap for named top-kME genes

#load(file = "networkdata_signed.RData")
#load(file = "wgcnaData.RData");
allkME =as.data.frame(signedKME(datt, MEs))
#amil_iso2gene.tab = may be means Acropora millepora Infermagenta from Sequence Orthology to gene ? (half an hour of reflexion....... --')
#gg=read.table("../heatmaps/amil_iso2gene.tab",sep="\t")
gg=read.table("datbase.tab",sep="\t", quote = "")

library(pheatmap)

whichModule="magenta"
top=30 # number of named top-kME genes to plot

datME=MEs
datExpr=datt
modcol=paste("kME",whichModule,sep="")
sorted=t(datExpr)[order(allkME[,modcol],decreasing=T),]
head(sorted)
# selection top N names genes, attaching gene names
gnames=c();counts=0;hubs=c()
for(i in 1:length(sorted[,1])) {
	if (row.names(sorted)[i] %in% gg$V1) { 
		counts=counts+1
		gn=gg[gg$V1==row.names(sorted)[i],2]
		gn=paste(gn,row.names(sorted)[i],sep=".")
		if (gn %in% gnames) {
			gn=paste(gn,counts,sep=".")
		}
		gnames=append(gnames,gn) 
		hubs=data.frame(rbind(hubs,sorted[i,]))
		if (counts==top) {break}
	}
} 
row.names(hubs)=gnames

contrasting = colorRampPalette(rev(c("chocolate1","#FEE090","grey10", "cyan3","cyan")))(100)
contrasting2 = colorRampPalette(rev(c("chocolate1","chocolate1","#FEE090","grey10", "cyan3","cyan","cyan")))(100)
contrasting3 = colorRampPalette(rev(c("chocolate1","#FEE090","grey10", "cyan3","cyan","cyan")))(100)

pheatmap(hubs,scale="row",col=contrasting2,border_color=NA,treeheight_col=0,cex=0.9,cluster_rows=F)



#source("https://bioconductor.org/biocLite.R")
#biocLite("erccdashboard")

library("erccdashboard")

setwd("~/Desktop/transcriptomics_working/erccdashboard/")
countDat <- read.delim("~/Desktop/transcriptomics_working/htseq-count/hisat2_all_gene_read_counts.tsv", sep = " ", header=FALSE)
colnames(countDat) <- c("Feature", "UHR_1", "UHR_2", "UHR_3", "HBR_1", "HBR_2", "HBR_3")


datType = "count" # "count" for RNA-Seq data, "array" for microarray data
isNorm = FALSE # flag to indicate if input expression measures are already
# normalized, default is FALSE 
exTable = countDat # the expression measure table
filenameRoot = "Brain" # user defined filename prefix for results files
sample1Name = "UHR" # name for sample 1 in the experiment
sample2Name = "HBR" # name for sample 2 in the experiment
erccmix = "RatioPair" # name of ERCC mixture design, "RatioPair" is default
erccdilution = 1/100 # dilution factor used for Ambion spike-in mixtures
spikeVol = 1 # volume (in microliters) of diluted spike-in mixture added to 
#   total RNA mass
totalRNAmass = 0.500 # mass (in micrograms) of total RNA 
choseFDR = 0.05 # user defined false discovery rate (FDR), default is 0.05

###################################################
### code chunk number 4: inspectRatCount
###################################################
head(countDat)

###################################################
### code chunk number 5: runDashboardRatcount
###################################################
exDat <- runDashboard(datType="count", isNorm = FALSE,
                      exTable=countDat,
                      filenameRoot="Brain", sample1Name="UHR",
                      sample2Name="HBR", erccmix="RatioPair",
                      erccdilution=1/100, spikeVol=1,
                      totalRNAmass=0.500, choseFDR=0.1)


###################################################
### code chunk number 6: initializeData
###################################################
summary(exDat)


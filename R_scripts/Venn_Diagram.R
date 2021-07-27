source("http://www.bioconductor.org/biocLite.R")
biocLite("limma")
library(limma)
install.packages("rJava", dependencies = TRUE)
install.packages("gplots",dependencies = TRUE)
install.packages("VennDiagram",dependencies = TRUE)
install.packages("gridExtra", dependencies=TRUE)
require(gplots) 
require(VennDiagram)
library(RColorBrewer)
library(gridExtra)

#import and process data
setwd("C:/Users/Sophia Santos/Dropbox/DeYeast/R_files")
data = read.csv("C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/ids_model_met_DB.csv", sep=";", header=T)
data = read.csv("C:/Users/Sophia Santos/Dropbox/Biomass Task/_Artigo/Ficheiros_R/models_venn.csv", sep=";", header=T)


iAZ900 <- data[,1]
iAZ900 <- na.omit(iAZ900)
a_iAZ900 <- table (iAZ900)
write.table(a_iAZ900, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iAZ900.csv", sep=";")

iFF708 <- data[,2]
iFF708 <- na.omit(iFF708)
a_iFF708 <- table (iFF708)
write.table(a_iFF708, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iFF708.csv", sep=";")

iLL672 <- data[,4]
iLL672 <- na.omit(iLL672)
a_iLL672 <- table (iLL672)
write.table(a_iLL672, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iLL672.csv", sep=";")

iMM904 <- data[,5]
iMM904 <- na.omit(iMM904)
a_iMM904 <- table (iMM904)
write.table(a_iMM904, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iMM904.csv", sep=";")

iTO977 <- data[,6]
iTO977 <- na.omit(iTO977)
a_iTO977 <- table (iTO977)
write.table(a_iTO977, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iTO977.csv", sep=";")

iND750 <- data[,7]
iND750 <- na.omit(iND750)
a_iND750 <- table (iND750)
write.table(a_iND750, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iND750.csv", sep=";")

Yeast1 <- data[,8]
Yeast1 <- na.omit(Yeast1)
a_Yeast1 <- table (Yeast1)
write.table(a_Yeast1, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_Yeast1.csv", sep=";")

Yeast6 <- data[,9]
Yeast6 <- na.omit(Yeast6)
a_Yeast6 <- table (Yeast6)
write.table(a_Yeast6, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_Yeast6.csv", sep=";")

Yeast7 <- data[,10]
Yeast7 <- na.omit(Yeast7)
a_Yeast7 <- table (Yeast7)
write.table(a_Yeast7, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_Yeast7.csv", sep=";")

iIN800 <- data[,3]
iIN800 <- na.omit(iIN800)
a_iIN800 <- table (iIN800)
write.table(a_iIN800, "C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/rxn_iIN800.csv", sep=";")


par(mfrow=c(3,2))
#Yeast models
vp1 <- venn.diagram(list(Yeast1=Yeast1,Yeast6=Yeast6, Yeast7=Yeast7), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cat.dist=0.08, cex=1.5, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#Last models
vp2 <- venn.diagram(list(Yeast6=Yeast6,Yeast7=Yeast7,iTO977=iTO977),fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.08, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#BiGG models
vp3 <- venn.diagram(list(iAZ900=iAZ900,iND750=iND750,iMM904=iMM904), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.08, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#Branched models
vp4 <- venn.diagram(list(iFF708=iFF708,iTO977=iTO977,iIN800=iIN800, iLL672=iLL672), fill = rainbow(4, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#Branched models_1
vp5 <- venn.diagram(list(iMM904=iMM904,iLL672=iLL672,Yeast1=Yeast1), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.08, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#Branched models_2
vp6 <- venn.diagram(list(iFF708=iFF708,iTO977=iTO977,iIN800=iIN800), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.07, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp)

#Branched models_3
vp <- venn.diagram(list(iLL672=iLL672,iTO977=iTO977,iIN800=iIN800), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.08, cat.cex=1.5);
grid.newpage() #para passar para nova pagina
grid.draw(vp1,vp2)


grid.arrange(grobTree(vp3),
             grobTree(vp1),
             grobTree(vp4),
             ncol=3)

grid.arrange(grobTree(vp6),
             grobTree(vp5),
             grobTree(vp2),
             ncol=3)
#========================Models_info==========================

Ecoli <- data[,1]
Ecoli <- na.omit(Ecoli)
Ecoli <- table (Ecoli)

Other_org <- data[,2]
Other_org<- na.omit(Other_org)
Other_org <- table (Other_org)

Exp <- data[,3]
Exp <- na.omit(Exp)
Exp <- table (Exp)

Genome <- data[,4]
Genome <- na.omit(Genome)
Genome <- table (Genome)

Other_source <- data[,5]
Other_source <- na.omit(Other_source)
Other_source  <- table (Other_source)


#Venn
vp <- venn.diagram(list(E_coli=Ecoli,Other_Organism=Other_org,Experimental=Exp), fill = rainbow(3, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL, cex=1.5, cat.dist=0.08, cat.cex=1);
grid.newpage() #para passar para nova pagina
grid.draw(vp)


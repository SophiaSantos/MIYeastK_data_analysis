require(graphics); require(grDevices)
source("http://bioconductor.org/biocLite.R")
install.packages("gplots")
library(gplots)
library("limma")
library(RColorBrewer)


data<-read.csv("C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/path_heatmap.csv", sep=";", header=T)
rownames(data) = data[,1] #identificar as amostras com os dados da coluna 1
data = data[,-1]
data = as.matrix(data)

heatmap.2(data, col=redgreen(50), Rowv=FALSE, key=TRUE, symkey=FALSE, density.info="none", trace="none", cexRow=0.6, margins = c(5,5))

heatmap.2(data, col=redgreen(50), key=TRUE, symkey=FALSE, density.info="none", trace="none", cexRow=0.8, margins = c(5,17))


ds.dados <- 1 - abs(cor(t(ds.dados)))
distancet <- dist(ds.dados)
hclust_complete <- hclust(distancet, method = "complete")
dendcomplete <- as.dendrogram(hclust_complete)
plot(hclust_complete)
heatmap(ds.dados, dendcomplete, Colv=NA)

scale_colour_gradientn(colours=c("red", "blue"))
colfunc <- colorRampPalette(c("red","yellow","green"))
colfunc(10)

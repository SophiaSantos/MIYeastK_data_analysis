# Create Line Chart
require(grDevices) # for colours

data<-read.csv("C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/model_info_2.csv", sep=";", header=T)

rownames(data) = data[,1] #identificar as amostras com os dados da coluna 1
data = data[,-1]
data=as.data.frame(data)

s=data$Species
m=data$No.of.metabolites
r=data$No.of.metabolites.1
g=data$No.of.GPRs
p=data$GPRs.per.Reaction
c=data$Compartments

labels <- paste(c("iFF708", 
                  "iND750",
                  "iLL672",
                  "iIN800",
                  "iMM904",
                  "Yeast 1",
                  "iAZ900",
                  "iTO977",
                  "Yeast 6",
                  "Yeast 7"))



## add extra space to right margin of plot within frame
par(mar=c(5, 4, 4, 6) + 0.1)

## Plot the second plot and put axis scale on right
barplot(p, col=grey.colors(1, alpha=0.4), ylim=c(0,105), axes=FALSE)
box()
## a little farther out (line=4) to make room for labels
axis(4,las=1 , ylim=c(0,45))
mtext("Compartments and Pathways",side=4,col="black",line=3)

## Allow a second plot on the same graph
par(new=TRUE)

## Plot first set of data and draw its axis
bar=rbind(s,m,r,g)
colnames(bar)=labels
barplot(bar, col=rainbow(4, start=0.1, end=0.8, alpha=0.5), beside=TRUE, ylim=c(0,3600), axes=FALSE, las=2, offset=0)
legend("topleft", bty="n", legend=c("Species","Metabolites","Reactions","GPRs","Pathways", "Compartments"),cex=1, col=c(rainbow(4, start=0.1, end=0.8, alpha=0.5),"grey","black"), pch=c(rep(16,6),-1),
       lty = c(0,0,0,0,0,1))


## a little farther out (line=1) to make room for labels
axis(2,las=1, ylim=c(40,110))
mtext("Species, Metabolites, Reactions and GPRs", side=2, col="black",line=3.2)

par(new=TRUE)
plot(c, type="b", pch=16, col="black", xlab = "", ylab = "", axes=FALSE, ylim = c(0,45))

dev.off()

#=======================
par("mar")
data<-read.csv("C:/Users/Sophia Santos/Dropbox/DeYeast/R_files/model_info_2.csv", sep=";", header=T)

rownames(data) = data[,1] #identificar as amostras com os dados da coluna 1
data = data[,-1]
data=as.data.frame(data)

m=data$No.of.metabolites
m<-as.table(t(m))

colnames(m)<-labels
r<-barplot2(m,col=grey.colors(1, alpha=0.4), ylim=c(0,350))
legend("topright", bty="n", legend=c("Metabolites"),cex=1, fill=grey.colors(1, alpha=0.4))
mtext("Presence in Models",side=1,col="black",line=3)
mtext("Number of Metabolites",side=2,col="black",line=3)

rxn=data$No.of.metabolites.1
rxn<-as.table(t(rxn))
colnames(rxn)=labels

g=data$No.of.GPRs
g<-as.table(t(g))

bar=rbind(r,g)
colnames(bar)=labels

r<-barplot2(r,col=grey.colors(2, alpha=0.4), ylim=c(0,2000),beside=TRUE)
legend("topleft", bty="n", legend=c("Reactions","GPRs"),cex=1, fill=grey.colors(2, alpha=0.4))

p=data$GPRs.per.Reaction


labels <- paste(c("10", 
                  "9",
                  "8",
                  "7",
                  "6",
                  "5",
                  "4",
                  "3",
                  "2",
                  "1"))


colnames(m)=t(labels)
barplot(bar, col=rainbow(4, start=0.1, end=0.8, alpha=0.5), beside=TRUE, ylim=c(0,3600), axes=FALSE, las=2, offset=0)
legend("topleft", bty="n", legend=c("Species","Metabolites","Reactions","GPRs","Pathways", "Compartments"),cex=1, col=c(rainbow(4, start=0.1, end=0.8, alpha=0.5),"grey","black"), pch=c(rep(16,6),-1),
       lty = c(0,0,0,0,0,1))


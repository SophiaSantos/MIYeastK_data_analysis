#plot code
data = read.csv("C:/Users/sophi/Dropbox/DeYeast/R_files/met_int_Yeast_int.csv", sep=";", header=T)
for(i in 1:9){
  
  png(filename=paste("C:/Users/sophi/Dropbox/DeYeast/R_files/venn_",colnames(data)[i],".png", sep="_" ))
  for(j in 1:9){
      if(i!=j){
      drawplot(data,i,j)
    }
  }
  dev.off()
}


drawplot <- function(data, j,i){
  frame
  gl <- grid.layout(nrow=3, ncol=3)
  pushViewport(viewport(layout=gl))
  vp<- venn.diagram(list(A=data[,i],B=data[,j]), category.names = c(colnames(data)[i],colnames(data)[j]), fill = rainbow(2, start=0.1, end=0.8, alpha=0.5), alpha = 0.4, filename = NULL);
  grid.draw(vp)
  popViewport(i)
}

define_region <- function(row, col){
  viewport(layout.pos.row = row, layout.pos.col = col)
}

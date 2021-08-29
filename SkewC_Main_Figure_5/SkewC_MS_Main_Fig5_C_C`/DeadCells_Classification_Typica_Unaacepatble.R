load("./prjImage.RData")
pdf(
  "./GSE46980_full_cov_R1_deladcellsWithhiglightedTypical.pdf")
x = 1:100

color='magenta' 
par(mai=c(0.82,0.82,0.41,0.12))
plot(
  x,
  SRR1043253,col.axis="black",font.axis=2,
  type = 'l',col= color,
  main = list("mES|GSE46980|dead cells|STRT|(n=9)",cex=1.5,col = "black",font=2),
  ylab = list("Gene coverage", col = "black",cex=1.5,font=2),
  xlab = list("Gene body percentile (5'-> 3')", col = "black",cex=1.5,font=2),
  col.main = "blue",cex.lab=3,font.lab=2)
lines(x,SRR1043247,type='l',col= color)
lines(x,SRR1043271,type='l',col= 'green')
lines(x,SRR1043349,type='l',col= color)
lines(x,SRR1043331,type='l',col= color)
lines(x,SRR1043357,type='l',col= 'green')
lines(x,SRR1043379,type='l',col= color)
lines(x,SRR1043207,type='l',col= color)
lines(x,SRR1043233,type='l',col= color)

box(lty = "solid", col = 'black',lwd=3)
axis(side=1,lwd=2,lwd.ticks=4,col.ticks="black")
axis(side=2,lwd=3,lwd.ticks=4,col.ticks="black")
dev.off()


######
pdf(
  "./GSE46980_full_cov_R1_deladcellsWithhiglightedUnacceptable.pdf")
x = 1:100

color='blue' 
par(mai=c(0.82,0.82,0.41,0.12))
plot(
  x,
  SRR1043253,col.axis="black",font.axis=2,
  type = 'l',col= 'red',
  main = list("mES|GSE46980|dead cells|STRT|(n=9)",cex=1.5,col = "black",font=2),
  ylab = list("Gene coverage", col = "black",cex=1.5,font=2),
  xlab = list("Gene body percentile (5'-> 3')", col = "black",cex=1.5,font=2),
  col.main = "blue",cex.lab=3,font.lab=2)
lines(x,SRR1043247,type='l',col= color)
lines(x,SRR1043271,type='l',col= color)
lines(x,SRR1043349,type='l',col= 'red')
lines(x,SRR1043331,type='l',col= 'red')
lines(x,SRR1043357,type='l',col= color)
lines(x,SRR1043379,type='l',col= 'red')
lines(x,SRR1043207,type='l',col= 'red')
lines(x,SRR1043233,type='l',col= 'red')

box(lty = "solid", col = 'black',lwd=3)
axis(side=1,lwd=2,lwd.ticks=4,col.ticks="black")
axis(side=2,lwd=3,lwd.ticks=4,col.ticks="black")
dev.off()
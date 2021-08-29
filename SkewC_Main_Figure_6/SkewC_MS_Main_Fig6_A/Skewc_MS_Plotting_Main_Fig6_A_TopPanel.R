### 20210829
### Plotting SkewC MS main Figure 5 A top panle T-SNE with growth factor annotation of E-MTAB-2600
library(ggplot2)
tsne_plotGrowthFactor <- readRDS(file = "tsne_plotGrowthFactor.rds")
v1 <- ggplot(data = tsne_plotGrowthFactor, aes(x=x, y=y, color=col)) + geom_point(size=2.0) +
  labs(title="E-MTAB-2600:Non skewed cells", x="tSNE1", y="tSNE2")  + theme_bw() +
  guides(color=guide_legend("Growth factor",nrow =  3))


v1 <- v1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
v1 <- v1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
v1 <- v1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
v1 <- v1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
v1 <- v1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
v1 <- v1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
v1 <- v1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
v1 <- v1 + theme(axis.ticks.length = unit(0.2,"cm"))
v1 <- v1 + theme(legend.position="bottom")
pdf("./SkewC_MS_Main_Fig5A_Top.pdf")
v1
dev.off()

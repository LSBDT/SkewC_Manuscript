### 20210829
### Plotting SkewC MS main fig.6 B Middle panel
library(ggplot2)
tsne_Typical_vs_Skewed <- readRDS("tsne_Typical_vs_Skewed.rds")
  x1 <- ggplot(data = tsne_Typical_vs_Skewed, aes(x=x, y=y, color=col)) + geom_point(size=2.0) +
  labs(title="GSE98664:Non skewed vs. Skewed single-cells", x="tSNE1", y="tSNE2") + scale_color_manual(labels = c("Good", "Skewed"), values = c("green3", "magenta")) + theme_bw() + guides(color=guide_legend("Sample type"))


x1 <- x1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
x1 <- x1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
x1 <- x1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
x1 <- x1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
x1 <- x1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
x1 <- x1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
x1 <- x1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
x1 <- x1 + theme(axis.ticks.length = unit(0.2,"cm"))
x1 <- x1 + theme(legend.position="bottom")
pdf("SkewC-MS_Main_Fig6B_Middle.pdf")
x1
dev.off()

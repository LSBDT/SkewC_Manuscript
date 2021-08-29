### 20210829
### Plotting SkewC MS main Figure 5 A middle panle T-SNE with Skewed and typical annoation of E-MTAB-2600
library(ggplot2)
tsne_plotTypical_Skewed <- readRDS("tsne_plotTypical_Skewed.rds")
  z1 <- ggplot(data = tsne_plotTypical_Skewed, aes(x=x, y=y, color=col)) + geom_point(size=2.0) +
  labs(title="E-MTAB-2600", x="tSNE1", y="tSNE2")  + theme_bw() + 
  guides(color=guide_legend("SkewC annotation",nrow =  3))


z1 <- z1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
z1 <- z1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
z1 <- z1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
z1 <- z1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
z1 <- z1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
z1 <- z1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
z1 <- z1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
z1 <- z1 + theme(axis.ticks.length = unit(0.2,"cm"))
z1 <- z1 + theme(legend.position="bottom")
pdf("SkewC_Ms_Main_fig5_A_Middle.pdf")
z1
dev.off()
z1

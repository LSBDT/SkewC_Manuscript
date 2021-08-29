#### 20210605
## Plotting SkewC manuscript main Fig.5D
###########
tsne_SkewC_StatusZZ <- readRDS(file = "./tsne_SkewC_StatusZZ.rds")
library(ggplot2)

RRZ <- ggplot(data = tsne_SkewC_StatusZZ , aes(x=x, y=y,color=col)) + 
  geom_point(aes(shape=shRp1),size=5)  +
  scale_shape_manual(values=c(4, 16))+
  #scale_size_manual(values=c(10,4)) +
  scale_colour_manual(values = c("blue", "red")) +
  labs(title="control_criteria_quality annoation", x="tSNE1", y="tSNE2") + 
  theme_bw() + guides(color=guide_legend("Sample type"))
RRZ <- RRZ + theme(legend.position = "bottom")
RRZ <- RRZ + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
RRZ <- RRZ + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
RRZ <- RRZ + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
RRZ <- RRZ + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
RRZ <- RRZ + theme(panel.background = element_rect(fill = "white", colour = "white"))
RRZ <- RRZ + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
RRZ <- RRZ + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
RRZ <- RRZ + theme(axis.ticks.length = unit(0.2,"cm"))
pdf("./SkewC_MS_Main_Fig.5D.pdf")
RRZ
dev.off()


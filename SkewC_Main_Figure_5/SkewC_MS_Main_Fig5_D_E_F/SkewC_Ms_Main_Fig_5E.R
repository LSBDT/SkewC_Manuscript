#### 20210605
## Plotting SkewC manuscript main Fig.5E
###########

####### Plot t-SNe STATUS
tsne_SkewC_Status <- readRDS(file = "./tsne_SkewC_Status.rds")


z1 <- ggplot(data = tsne_SkewC_Status , aes(x=x, y=y,color=col)) + 
  geom_point(aes(shape=shRp1),size=5)  +
  scale_shape_manual(values=c(4, 16))+
  #scale_size_manual(values=c(10,4)) +
  scale_colour_manual(values = c("magenta", "green")) +
  labs(title="GSE46980 SkewC annoation", x="tSNE1", y="tSNE2") + 
  theme_bw() + guides(color=guide_legend("Sample type"))
z1 <- z1 + theme(legend.position = "bottom")
z1 <- z1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
z1 <- z1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
z1 <- z1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
z1 <- z1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
z1 <- z1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
z1 <- z1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
z1 <- z1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
z1 <- z1 + theme(axis.ticks.length = unit(0.2,"cm"))
pdf("./SkewC_MS_Main_Fig.5E.pdf")
z1
dev.off()


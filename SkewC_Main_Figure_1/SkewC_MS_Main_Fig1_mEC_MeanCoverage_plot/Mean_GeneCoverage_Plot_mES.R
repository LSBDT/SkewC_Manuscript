### 20190725
### Plotting
library(ggplot2)
mm10_mES_AllSeq_Coverage_means_DF_melted_tgc <- readRDS(file = "mm10_mES_AllSeq_Coverage_means_DF_melted_tgc.rds")
pdf("./Mean_GeneCoverage_Plot_mES.pdf",width = 12,height = 8)
meanPlot <- ggplot(mm10_mES_AllSeq_Coverage_means_DF_melted_tgc, aes(x=variable, y=value,shape=Annotation,colour=protocol)) +
  geom_errorbar(aes(ymin=value-ci, ymax=value+ci),colour="black", width=.1)  +
  geom_line(aes(group=Annotation),size=0.75)
#geom_point(size=1,shape=16, fill="white")
meanPlot =meanPlot+ geom_point(aes(group=1), size=1, shape=19, fill="white") + 
  scale_x_discrete(labels  = c(10, 20,30,40,50,60,70,80,90,100)) + 
  facet_wrap(.~sequence_f,nrow = 1)+
  theme(strip.text.x = element_text(size = 16, colour = "black",face="bold",family="ArialMT")) +
  theme(strip.background  = element_rect(colour = "black",fill="gray97")) +
  labs(x= expression(paste(mu,"of the gene body percentile (5'-> 3')"))) + 
  labs(y= "Gene coverage")+
  labs(title ="mES | Mean value of the gene body coverage")
meanPlot =meanPlot+ theme(plot.title = element_text(face = "bold", colour="black", size = 18,margin=margin(0,0,3,0))) 
meanPlot =meanPlot+ theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
meanPlot =meanPlot+ theme(axis.ticks.length=unit(.2, "cm"))
meanPlot =meanPlot+ theme(axis.title.x = element_text(colour="black", size=18,family = "ArialMT")) 
meanPlot =meanPlot+ theme(axis.title.y = element_text(colour="black", size=18,family = "ArialMT"))
meanPlot =meanPlot+ theme(legend.title = element_text(face = "bold",colour="black", size=18,family = "ArialMT"))
meanPlot =meanPlot+ theme(legend.text = element_text(colour="black", size = 16,family = "ArialMT"))
meanPlot =meanPlot+ theme(axis.text = element_text(face = "bold", colour="black", size=12,family="ArialMT")) 
meanPlot =meanPlot+ theme(panel.border  = element_rect(colour = "black",fill = NA,size = 2.2),panel.background = element_rect(fill = NA))
meanPlot =meanPlot+ theme(plot.title = element_text(hjust = 0.5))
meanPlot
dev.off()

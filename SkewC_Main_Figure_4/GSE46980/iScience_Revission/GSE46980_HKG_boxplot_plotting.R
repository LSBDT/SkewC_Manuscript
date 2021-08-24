### 20210813
### Plotting boxplot of the gene expression of the house keeping genes for GSE46980
saveRDS(GSE46980_HKGExp_ggplot,file = "./HouseKeepingGenes/iScience_Revission/GSE46980_HKGExp_ggplot.rds")
library(ggplot2)
q <- ggplot(GSE46980_HKGExp_ggplot, aes(annotation, logvalue,fill=annotation)) + 
  stat_boxplot(geom = 'errorbar',width=0.2)+ 
  geom_boxplot(alpha=1) +
  scale_fill_brewer(palette="Greys")+ geom_jitter(width = 0.1,alpha=0.1) +
  theme(legend.position="none",
        legend.box = "vertical",legend.title=element_text(family="Times",
                                                          face="bold", size=12),legend.text=element_text(family="Times",face="bold", size=12))+
  facet_wrap(~Var1, scales="free_y")+
  theme(strip.text.x = element_text(size = 12, colour = "black",face="bold",family="Times")) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y = element_text(face="bold", color="black",size=12)) +
  ggtitle("GSE46980:\nNormalized expression of housekeeping genes") +
  theme(plot.title=element_text(family="Times", face="bold", size=14))+
  theme(axis.title=element_text(size=12,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))
q <- q + labs(y = "log2(gene expression(TPM))")
q <- q + scale_y_continuous(labels = scales::number_format(accuracy = 0.1))
# q <- q + annotate(geom="text", x=0.9, y=15, label="P<.001",
#             color="black",size = 4,fontface="italic")
pdf("./HouseKeepingGenes/iScience_Revission/GSE46980_HKG_boxplot.pdf")
q
dev.off()

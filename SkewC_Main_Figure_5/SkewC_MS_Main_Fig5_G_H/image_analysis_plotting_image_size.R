### 20210523
## Plotting Cell Size
library(ggplot2)
library(ggpubr)
quality_control_criteriaLevel <- factor(c("Acceptable","Unacceptable"))
SkewCLevel <- factor(c("Typical","Skewed"))
CellSizePlot_CellQuality <- ggplot(R1_Annotation_Accep_UnaccepAlble_SkewCImageValues, aes(x=factor(SkewC,levels=SkewCLevel), y=area))+ geom_violin(trim = T)+
  geom_boxplot(width=0.1)+
  geom_point(aes(shape=quality_control_criteria,color=quality_control_criteria),size=3) +
  scale_shape_manual(values=c(1, 8))+
  #scale_size_manual(values=c(10,4)) +
  scale_colour_manual(values = c("blue", "red")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.title = element_text(lineheight = .8,size = 20,family = "Times",face="bold",hjust = 0.5)) +
  theme(axis.text.x  = element_text(size = 18, family = "Times",face="bold",colour = "black")) +
  theme(axis.text.y  = element_text(size = 18, family = "Times",face="bold",colour = "black")) +
  theme(axis.title.x  = element_text(size = 20, family = "Times",face="bold",colour = "black")) +
  theme(legend.title = element_text(color = "black", size = 18, family = "Times",face="bold"),legend.text = element_text(family = "Times",face="bold",colour = "black",size = 14)) +
  theme(legend.position = 'bottom')
  theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'solid'))+
  theme(axis.title.y  = element_text(size = 20, family = "Times",face="bold",colour = "black")) +
  theme(axis.ticks.length = unit(.25, "cm"))+
  labs(title="GSE46980:Tag count",x="Dataset QC annotation", y = "Tag count")+
  theme(panel.background = element_rect(fill = NA,colour = "black",size = 1.5,linetype = "solid"),
        panel.grid.major  = element_line(colour = "gray",size = 0.25))
CellSizePlot_CellQuality <- CellSizePlot_CellQuality +stat_compare_means(method = "t.test", label.y =0.9)+      # Add global p-value
  stat_compare_means(label = "p.signif", method = "t.test",
                     ref.group = "Typical")
pdf(file = "./Image_Analysis_V3_CR_Methods_Review_20210523/Plots/GSE46980_CellSize_CellQulaity.pdf")
CellSizePlot_CellQuality
dev.off()
######### Status
### 20210523
## Plotting Cell Size
library(ggplot2)
library(ggpubr)
StatusLevel <- factor(c("Acceptable","Unacceptable"))
SkewCLevel <- factor(c("Typical","Skewed"))
CellSizePlot_Status <- ggplot(R1_Annotation_Accep_UnaccepAlble_SkewCImageValues, aes(x=factor(SkewC,levels=SkewCLevel), y=area))+ geom_violin(trim = T)+
  geom_boxplot(width=0.1)+
  geom_point(aes(shape=Status,color=Status),size=3) +
  scale_shape_manual(values=c(8, 1))+
  #scale_size_manual(values=c(10,4)) +
  scale_colour_manual(values = c("red", "blue")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.title = element_text(lineheight = .8,size = 20,family = "Times",face="bold",hjust = 0.5)) +
  theme(axis.text.x  = element_text(size = 18, family = "Times",face="bold",colour = "black")) +
  theme(axis.text.y  = element_text(size = 18, family = "Times",face="bold",colour = "black")) +
  theme(axis.title.x  = element_text(size = 20, family = "Times",face="bold",colour = "black")) +
  theme(legend.title = element_text(color = "black", size = 18, family = "Times",face="bold"),legend.text = element_text(family = "Times",face="bold",colour = "black",size = 14)) +
  theme(legend.position = 'bottom')
theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'solid'))+
  theme(axis.title.y  = element_text(size = 20, family = "Times",face="bold",colour = "black")) +
  theme(axis.ticks.length = unit(.25, "cm"))+
  labs(title="GSE46980:Tag count",x="Dataset QC annotation", y = "Tag count")+
  theme(panel.background = element_rect(fill = NA,colour = "black",size = 1.5,linetype = "solid"),
        panel.grid.major  = element_line(colour = "gray",size = 0.25))
CellSizePlot_Status <- CellSizePlot_Status +stat_compare_means(method = "t.test", label.y =0.9)+      # Add global p-value
  stat_compare_means(label = "p.signif", method = "t.test",
                     ref.group = "Typical")
pdf(file = "./Image_Analysis_V3_CR_Methods_Review_20210523/Plots/GSE46980_CellSize_Status.pdf")
CellSizePlot_Status
dev.off()
source(file = "/work/imad-a/MultiPlot.R")

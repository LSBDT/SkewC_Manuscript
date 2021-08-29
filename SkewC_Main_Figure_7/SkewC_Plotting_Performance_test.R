### 20210829
### Plotting SkewC performance test results
install.packages("Rmisc")
library(Rmisc)
library(ggplot2)
pbmc8k_4runs <- readRDS(file = "pbmc8k_4runs.rds")
pbmc8k_4runs$Number_of_cells <- as.factor(pbmc8k_4runs$Number_of_cells)
pbmc8k_4runsSumm <- summarySE(data = pbmc8k_4runs,
                              measurevar = "seconds",
                              groupvars ="Number_of_cells")
pdf(file = "SkewC_MS_Main_Fig7.pdf")
ggplot(pbmc8k_4runsSumm, aes(x=Number_of_cells, y=seconds,group=1)) + 
  geom_errorbar(aes(ymin=seconds-se, ymax=seconds+se), colour="red", width=.1) +
  geom_line(size=1, fill="white") +
  geom_point(size=3, shape=21, fill="white")+
  theme_bw()
dev.off()
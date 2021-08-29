#### 20210605
## Plotting SkewC manuscript main Fig.5F
###########
# Visualize QC metrics as a violin plot before filtering low features
### seuratGSE46980_SkewCmetrics
##20210605
###distinguish between the dead typical cells and dead skewed cells
#####
seuratGSE46980 <- readRDS(file = "./seuratGSE46980.rds")
library(Seurat)
library(ggplot2)
h1 <- VlnPlot(
  cols = "magenta",
  pt.size = 8,
  seuratGSE46980,
  features = c("nFeature_RNA"),
  ncol = 3,
  log = F,
  split.by = "SkewC",
  y.max = 10000) + aes(color = seuratGSE46980$SkewCStatus)
h1 <- h1 + theme(legend.position = "none")
h1 <- h1 + ggplot2::scale_color_manual(values = c('blue', 'black'))
h1 <- h1 + ggplot2::scale_color_manual(values = c('blue', 'black',"turquoise1","darksalmon"))
# Visualize QC metrics as a violin plot before filtering low features
h2 <- VlnPlot(
  cols = "magenta",
  pt.size = 8,
  seuratGSE46980,
  features = c("nCount_RNA"),
  ncol = 3,
  log = F,
  split.by = "SkewC",
  y.max = 730000) + aes(color = seuratGSE46980$SkewCStatus)
h2 <- h2 + theme(legend.position = "none")
h2 <- h2 + ggplot2::scale_color_manual(values = c('blue', 'black',"turquoise1","darksalmon"))
# Visualize QC metrics as a violin plot before filtering low features
h3 <- VlnPlot(cols = "magenta",
              pt.size = 8,
              seuratGSE46980,
              features = c("percent.mt"),
              ncol = 3,
              log = F,
              split.by = "SkewC",
              y.max = 60) + aes(color = seuratGSE46980$SkewCStatus)
h3 <- h3 + theme(legend.position = "none")
h3 <- h3 + ggplot2::scale_color_manual(values = c('blue', 'black',"turquoise1","darksalmon"))
source(file = "/work/imad-a/MultiPlot.R")
pdf("./SkewC_MS_Main_Fig.5F.pdf")
multiplot(h1,h2,h3,cols = 3)
dev.off()

### 20210813
### Plotting heatmap for the expression of the mouse mtGenes
library(ggplot2)
library(pheatmap)
library(RColorBrewer)
anno_col <- list(Annotation=c(Skewed="red",Typical="blue"))
### GSE59114
GSE59114_annotationZ <- readRDS(file = "dataset/GSE59114_annotationZ.rds")
GSE59114_RLE_mouse_mt_genesMatrix_norm <- readRDS(file = "dataset/GSE59114_RLE_mouse_mt_genesMatrix_norm.rds")

pdf(file = "plots/GSE59114_heatmap.pdf")
pheatmap(GSE59114_RLE_mouse_mt_genesMatrix_norm,cluster_rows=T, show_rownames=T,show_colnames =F,
         cluster_cols=T, annotation_col=GSE59114_annotationZ,fontsize_row=10,clustering_distance_cols = "correlation",
         treeheight_col = 100,annotation_colors = anno_col,
         color = colorRampPalette(rev(brewer.pal(n = 5, name ="RdYlBu")))(30), kmeans_k = NA,
         breaks = NA, border_color = "red",main = "GSE59114")
dev.off()

####GSE68981
GSE68981_annotationZ <- readRDS (file = "dataset/GSE68981_annotationZ.rds")
GSE68981_RLE_mouse_mt_genesMatrix_norm <- readRDS(file = "dataset/GSE68981_RLE_mouse_mt_genesMatrix_norm.rds")

pdf(file = "plots/GSE68981_heatmap.pdf")
pheatmap(GSE68981_RLE_mouse_mt_genesMatrix_norm,cluster_rows=T, show_rownames=T,show_colnames =F,
         cluster_cols=T, annotation_col=GSE68981_annotationZ,fontsize_row=10,clustering_distance_cols = "correlation",
         treeheight_col = 100,annotation_colors = anno_col,
         color = colorRampPalette(rev(brewer.pal(n = 5, name ="RdYlBu")))(30), kmeans_k = NA,
         breaks = NA, border_color = "red",main = "GSE68981")
dev.off()
###GSE70657
GSE70657_annotationZ <- readRDS(file = "dataset/GSE70657_annotationZ.rds")
GSE70657_RLE_mouse_mt_genesMatrix_norm <- readRDS(file = "dataset/GSE70657_RLE_mouse_mt_genesMatrix_norm.rds")

pdf(file = "plots/GSE70657_heatmap.pdf")
pheatmap(GSE70657_RLE_mouse_mt_genesMatrix_norm,cluster_rows=T, show_rownames=T,show_colnames =F,
         cluster_cols=T, annotation_col=GSE70657_annotationZ,fontsize_row=10,clustering_distance_cols = "correlation",
         treeheight_col = 100,annotation_colors = anno_col,
         color = colorRampPalette(rev(brewer.pal(n = 5, name ="RdYlBu")))(30), kmeans_k = NA,
         breaks = NA, border_color = "red",main = "GSE70657")
dev.off()
######
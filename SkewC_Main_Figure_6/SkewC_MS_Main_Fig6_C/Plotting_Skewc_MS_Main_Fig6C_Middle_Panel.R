### 20210829
### Plotting SkewC Main Fig6 bottom panel
####
library(dplyr)
library(Seurat)
library(ggplot2)

# Download the pbmc Typical cells data object
wget(c("http://single-cell.clst.riken.jp/SkewC_Online_Main_Fig6C/SkewC_MS_Main_Fig6_C/mm10_10x_PBMC_features_Typical_cells.rds.gz"))
gunzip("mm10_10x_PBMC_features_Typical_cells.rds.gz")
mm10_10x_PBMC_features_Typical_cells <-readRDS("mm10_10x_PBMC_features_Typical_cells.rds")

# Initialize the Seurat object with the raw (non-normalized data).
pbmcTypical <- CreateSeuratObject(counts = mm10_10x_PBMC_features_Typical_cells, project = "pbmcTypical3k", min.cells = 3, min.features = 200)
pbmcTypical

pbmcTypical <- NormalizeData(pbmcTypical, normalization.method = "LogNormalize", scale.factor = 10000)
############
pbmcTypical <- FindVariableFeatures(pbmcTypical, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(pbmcTypical), 10)


########
all.genes <- rownames(pbmcTypical)
pbmcTypical <- ScaleData(pbmcTypical, features = all.genes)
pbmcTypical <- RunPCA(pbmcTypical, features = VariableFeatures(object = pbmcTypical))
print(pbmcTypical[["pca"]], dims = 1:5, nfeatures = 5)
DimPlot(pbmcTypical, reduction = "pca")
DimHeatmap(pbmcTypical, dims = 1, cells = 8000, balanced = TRUE)
# NOTE: This process can take a long time for big datasets, comment out for expediency. More
# approximate techniques such as those implemented in ElbowPlot() can be used to reduce
# computation time
pbmcTypical <- JackStraw(pbmcTypical, num.replicate = 100)
pbmcTypical <- ScoreJackStraw(pbmcTypical, dims = 1:20)
JackStrawPlot(pbmcTypical, dims = 1:15)
pbmcTypical <- FindNeighbors(pbmcTypical, dims = 1:10)
pbmcTypical <- FindClusters(pbmcTypical, resolution = 0.5)
# If you haven't installed UMAP, you can do so via reticulate::py_install(packages =
# 'umap-learn')
pbmcTypical <- RunUMAP(pbmcTypical, dims = 1:10)
# note that you can set `label = TRUE` or use the LabelClusters function to help label
# individual clusters
DimPlot(pbmcTypical, reduction = "umap")
#annotation.info <- mm10_10x_pbmcTypical_columnAnnotation
#pbmcTypical <- AddMetaData(object = pbmcTypical,metadata = annotation.info)
# pdf("./Seurat_Analysis/Umap_ATypicalSkewed.pdf")
# DimPlot(pbmcTypical, reduction = "umap",group.by = "covGroup")
# dev.off()
pdf("Skewc_MS_Main_Fig6_Bottom_Panel.pdf")
DimPlot(pbmcTypical, reduction = "umap",pt.size = 1.5)+ ggplot2::theme(legend.position = "bottom")
dev.off()

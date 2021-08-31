### 20210829
### Plotting SkewC Main Fig6 top and middle anel
####
library(dplyr)
library(Seurat)
library(HelpersMG)
library(GEOquery)
### Download filtered feature bc matrix
wget(c("http://single-cell.clst.riken.jp/SkewC_Online_Main_Fig6C/SkewC_MS_Main_Fig6_C/filtered_feature_bc_matrix.tar.gz"))
untar("filtered_feature_bc_matrix.tar.gz")
# Load the PBMC dataset

data_dir <- './filtered_feature_bc_matrix/'
list.files(data_dir)
pbmc.data <- Read10X(data.dir = data_dir)
# Initialize the Seurat object with the raw (non-normalized data).
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)
pbmc
# The [[ operator can add columns to object metadata. This is a great place to stash QC stats
pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")

pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
############
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(pbmc), 10)

########
all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)
pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc))
print(pbmc[["pca"]], dims = 1:5, nfeatures = 5)
DimPlot(pbmc, reduction = "pca")
DimHeatmap(pbmc, dims = 1, cells = 8000, balanced = TRUE)
# NOTE: This process can take a long time for big datasets, comment out for expediency. More
# approximate techniques such as those implemented in ElbowPlot() can be used to reduce
# computation time
pbmc <- JackStraw(pbmc, num.replicate = 100)
pbmc <- ScoreJackStraw(pbmc, dims = 1:20)
JackStrawPlot(pbmc, dims = 1:15)
pbmc <- FindNeighbors(pbmc, dims = 1:10)
pbmc <- FindClusters(pbmc, resolution = 0.5)
# If you haven't installed UMAP, you can do so via reticulate::py_install(packages =
# 'umap-learn')
pbmc <- RunUMAP(pbmc, dims = 1:10)
# note that you can set `label = TRUE` or use the LabelClusters function to help label
# individual clusters
DimPlot(pbmc, reduction = "umap")
### Download annotation
wget(c("http://single-cell.clst.riken.jp/SkewC_Online_Main_Fig6C/SkewC_MS_Main_Fig6_C/mm10_10x_PBMC_columnAnnotation.rds.gz"))
gunzip("mm10_10x_PBMC_columnAnnotation.rds.gz")
annotation.info <- readRDS("mm10_10x_PBMC_columnAnnotation.rds")
pbmc <- AddMetaData(object = pbmc,metadata = annotation.info)
pdf("Skewc_MS_Main_Fig6_Middle_Panel.pdf")
DimPlot(pbmc, reduction = "umap",pt.size = 1.5,group.by = "covGroup",cols = c('Good_cells'='green','Skewed_coverage_cells'='magenta'))
dev.off()
pdf("Skewc_MS_Main_Fig6_Top_Panel.pdf")
DimPlot(pbmc, reduction = "umap",pt.size = 1.5)+ ggplot2::theme(legend.position = "bottom")
dev.off()

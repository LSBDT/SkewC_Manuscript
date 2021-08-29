## 20210523
R1_Annotation_Accep_UnaccepAlble_SkewCImageValues <- merge(R1_Annotation_Accep_UnaccepAlble_SkewC,
                                                           GSE46980_cell_measurements,by.x='cell_label',
                                                           by.y='cell_label')
rownames(R1_Annotation_Accep_UnaccepAlble_SkewCImageValues) <- R1_Annotation_Accep_UnaccepAlble_SkewCImageValues$cell_label

R1_Annotation_Accep_UnaccepAlble_SkewCImageValues <- R1_Annotation_Accep_UnaccepAlble_SkewCImageValues[,c(2,3,5,7,15)]

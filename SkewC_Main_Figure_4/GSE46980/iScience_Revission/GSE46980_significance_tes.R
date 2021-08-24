### 20210813
### GSE46980 significance test of the difference between Skewed and typical cells
saveRDS(GSE46980_HKGExp,file = "./HouseKeepingGenes/iScience_Revission/GSE46980_HKGExp.rds")
#### t.test
GSE46980_HKGExpPValueT_test <- as.data.frame(apply(GSE46980_HKGExp,1, function(x)t.test(x[1:39], x[40:87],
                                                                          alternative = "greater",
                                                                          conf.level = 0.95)$p.value))
names(GSE46980_HKGExpPValueT_test)[1] <- "P-value"
GSE46980_HKGExpT_testPValue <- GSE46980_HKGExpPValueT_test$`P-value`
GSE46980_HKGExpPValueT_test$adjustedp <- p.adjust(GSE46980_HKGExpT_testPValue,method="hochberg")
write.table(GSE46980_HKGExpPValueT_test,file = "./HouseKeepingGenes/iScience_Revission/GSE46980_HKGExpPValueT_test.tsv",sep = "\t",quote = F)

#### wilcox.test
GSE46980_HKGExpPValuewilcox.test <- as.data.frame(apply(GSE46980_HKGExp,1, function(x)wilcox.test(x[1:39], x[40:87],
                                                                                          alternative = "greater",
                                                                                          conf.level = 0.95)$p.value))
names(GSE46980_HKGExpPValuewilcox.test)[1] <- "P-value"
GSE46980_HKGExpwilcox.testPValue <- GSE46980_HKGExpPValuewilcox.test$`P-value`
GSE46980_HKGExpPValuewilcox.test$adjustedp <- p.adjust(GSE46980_HKGExpwilcox.testPValue,method="hochberg")
write.table(GSE46980_HKGExpPValuewilcox.test,file = "./HouseKeepingGenes/iScience_Revission/GSE46980_HKGExpPValuewilcox.test.tsv",sep = "\t",quote = F)

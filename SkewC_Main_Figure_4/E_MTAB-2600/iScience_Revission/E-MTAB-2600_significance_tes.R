### 20210813
### E-MTAB-2600 significance test of the difference between Skewed and typical cells
saveRDS(EMTAB2600_HKGExp,file = "./HouseKeepingGenes/iScience_Revission/EMTAB2600_HKGExp.rds")
#### t.test
EMTAB2600_HKGExpPValueT_test <- as.data.frame(apply(EMTAB2600_HKGExp,1, function(x)t.test(x[1:765], x[766:850],
                                                                          alternative = "greater",
                                                                          conf.level = 0.95)$p.value))
names(EMTAB2600_HKGExpPValueT_test)[1] <- "P-value"
EMTAB2600_HKGExpT_testPValue <- EMTAB2600_HKGExpPValueT_test$`P-value`
EMTAB2600_HKGExpPValueT_test$adjustedp <- p.adjust(EMTAB2600_HKGExpT_testPValue,method="hochberg")
write.table(EMTAB2600_HKGExpPValueT_test,file = "./HouseKeepingGenes/iScience_Revission/EMTAB2600_HKGExpPValueT_test.tsv",sep = "\t",quote = F)

#### wilcox.test
EMTAB2600_HKGExpPValuewilcox.test <- as.data.frame(apply(EMTAB2600_HKGExp,1, function(x)wilcox.test(x[1:765], x[766:850],
                                                                                          alternative = "greater",
                                                                                          conf.level = 0.95)$p.value))
names(EMTAB2600_HKGExpPValuewilcox.test)[1] <- "P-value"
EMTAB2600_HKGExpwilcox.testPValue <- EMTAB2600_HKGExpPValuewilcox.test$`P-value`
EMTAB2600_HKGExpPValuewilcox.test$adjustedp <- p.adjust(EMTAB2600_HKGExpwilcox.testPValue,method="hochberg")
write.table(EMTAB2600_HKGExpPValuewilcox.test,file = "./HouseKeepingGenes/iScience_Revission/EMTAB2600_HKGExpPValuewilcox.test.tsv",sep = "\t",quote = F)

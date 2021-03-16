## In terminal convert bed file to csv file
# cat ceres.overlapsComparsionValues.tab.bed >> ceres.output.csv

# R: To visualize Ceres data
setwd("~/Desktop/Ernst_Lab/UNIX/Updated_Dataset")
firstbar1<-read.csv('ceres.output.csv')
head(firstbar1)

#load raw data into R- Studios
overlaps1 <- read.csv("ceres.output.csv", header = F)
View(overlaps1)
temp1 <- overlaps1
temp1$correctedV1 <- gsub('_', ' ', temp1$V1)
head(temp1)
library(gtools)
temp1 <- temp1[mixedorder(temp1$correctedV1),]
temp1$correctedV1 <- factor(temp1$correctedV1, levels=(mixedsort(temp1$correctedV1)))


View(ceres_std_errs)
View(ceres_length)

library(ggplot2)
colors = c(rgb(255,0,0, maxColorValue = 255), rgb(255,69,0, maxColorValue = 255), rgb(255,69,0, maxColorValue = 255), rgb(255,69,0, maxColorValue = 255), rgb(0,128,0, maxColorValue = 255), rgb(0,128,0, maxColorValue = 255), rgb(0,128,0, maxColorValue = 255), rgb(0,150,0, maxColorValue = 255), rgb(194,225,5, maxColorValue = 255), rgb(194,225,5, maxColorValue = 255), rgb(194,225,5, maxColorValue = 255), rgb(194,225,5, maxColorValue = 255), rgb(255,195,77, maxColorValue = 255), rgb(255,195,77, maxColorValue = 255), rgb(255,195,77, maxColorValue = 255), rgb(255,255,0, maxColorValue = 255), rgb(255,255,0, maxColorValue = 255), rgb(255,255,0, maxColorValue = 255), rgb(255,255,102, maxColorValue = 255), rgb(102,205,170, maxColorValue = 255), rgb(138,145,208, maxColorValue = 255), rgb(230,184,183, maxColorValue = 255), rgb(112,48,160, maxColorValue = 255), rgb(128,128,128, maxColorValue = 255), rgb(255,255,255, maxColorValue = 255))
library(Hmisc)
ggplot(temp1, aes(x=correctedV1, y=V2, fill=correctedV1)) +
  geom_histogram(stat='identity') +
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=temp1$V2-ceres_std_errs$X2, ymax=temp1$V2+ceres_std_errs$X2), 
                width=.2, 
                position=position_dodge(.9)) +
  scale_fill_manual(values = colors) +
  theme_bw() +
  labs(x='Chromatin State', y='Score', title='Expression Scores for CERES Dataset') +
  theme(axis.title = element_text(size=16)) +
  theme(axis.text.x = element_text(angle=90, hjust=1)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ggsave('~/Desktop/ceres_somebargraph.pdf', height=6, width=7)


finalCeres_output <- read_csv("~/Desktop/Ernst_Lab/Updated_Code/finalCeres.overlapsComparsionValues.tab.bed", 
                                                                         col_names = FALSE)
View(finalCeres_output)

finalCeres_std_errs <- read_delim("~/Desktop/Ernst_Lab/Updated_Code/finalCeres_std_errs.csv", 
                                                        "\t", escape_double = FALSE, col_names = FALSE, 
                                                        trim_ws = TRUE)
View(finalCeres_std_errs)

overlaps1 <- finalCeres_output
temp1 <- overlaps1
temp1$correctedX1 <- gsub('_', ' ', temp1$X1)
library(gtools)
temp1 <- temp1[mixedorder(temp1$correctedX1),]
temp1$correctedX1 <- factor(temp1$correctedX1, levels=(mixedsort(temp1$correctedX1)))

library(ggplot2)
colors = c(rgb(255,0,0, maxColorValue = 255), rgb(255,0,0, maxColorValue = 255), rgb(255,105,105, maxColorValue = 255), rgb(207,11,198, maxColorValue = 255), rgb(250,202,0, maxColorValue = 255), rgb(250,202,0, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(10,190,254, maxColorValue = 255), rgb(10,190,254, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255),rgb(194,214,154, maxColorValue = 255), rgb(225,225,225, maxColorValue = 255), rgb(225,225,225, maxColorValue = 255))
library(Hmisc)
#finalCeres_std_errs$X2 <- sqrt(finalCeres_std_errs$X2)
summary(finalCeres_std_errs$X2)
ggplot(temp1, aes(x=correctedX1, y=X2, fill=correctedX1)) +
  geom_histogram(stat='identity') +
  scale_fill_manual(values = colors, 'Chromatin States') +
  # geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=temp1$X2-finalCeres_std_errs$X2, ymax=temp1$X2+finalCeres_std_errs$X2), 
                width=.2, position=position_dodge(.9)) +
  theme_bw() +
  labs(x='Chromatin State', y='gRNA Count', title='Chromatin State Distributions for the CERES Dataset') +
  theme(axis.title = element_text(size=16)) +
  theme(axis.text.x = element_text(angle=90, hjust=1)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ggsave('~/Desktop/finalCeres1_somebargraph.pdf', height=6, width=7)

X_mpra_final <- read_csv("~/Desktop/Ernst_Lab/Updated_Code/finalMpra.overlapsComparsionValues.tab.tab.bed", 
                         col_names = FALSE)
X_ceres_final <- read_csv("~/Desktop/Ernst_Lab/Updated_Code/finalCeres.overlapsComparsionValues.tab.bed", 
                          col_names = FALSE)


MPRA = X_mpra_final[with(X_mpra_final, order(X1)),]
CERES = X_ceres_final[with(X_ceres_final, order(X1)),]

X = data.frame(MPRA)
X$X3= CERES$X2

ggplot(X, aes(x=X3, y=X2)) +
  geom_point(color = colors) + 
  #geom_jitter(height = 0.05, color = colors) +
  #binomial_smooth(formula = y ~ splines::ns(x, 2))
  theme_bw() +
  labs(x='Average gRNA Count \n per chromatin state', y='Averaged Sharpr-MPRA\n activity scores', title='CERES and MPRA\ncomparsion') +
#  #geom_smooth(span = 0.3) +
#  geom_smooth(se = FALSE, method = "lm")
  #geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3), se = FALSE)
#  ggsave('~/Desktop/final_comparison.pdf', height=6, width=7)

  
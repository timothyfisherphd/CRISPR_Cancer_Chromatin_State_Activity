finalCeres_output <- read_csv("~/Desktop/Ernst_Lab/UNIX/Updated_Dataset/finalCeres.output.csv", 
                              col_names = FALSE)
View(finalCeres_output)

finalCeres_std_errs <- read_delim("~/Desktop/Ernst_Lab/Python/big_project/finalCeres_std_errs.csv", 
                                  "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
View(finalCeres_std_errs)

overlaps1 <- finalCeres_output
View(overlaps1)
temp1 <- overlaps1
temp1$correctedX1 <- gsub('_', ' ', temp1$X1)
library(gtools)
temp1 <- temp1[mixedorder(temp1$correctedX1),]
temp1$correctedX1 <- factor(temp1$correctedX1, levels=(mixedsort(temp1$correctedX1)))


library(ggplot2)
colors = c(rgb(255,0,0, maxColorValue = 255), rgb(255,0,0, maxColorValue = 255), rgb(255,105,105, maxColorValue = 255), rgb(207,11,198, maxColorValue = 255), rgb(250,202,0, maxColorValue = 255), rgb(250,202,0, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(255,252,4, maxColorValue = 255), rgb(10,190,254, maxColorValue = 255), rgb(10,190,254, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(0,176,80, maxColorValue = 255), rgb(194,214,154, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255), rgb(127,127,127, maxColorValue = 255), rgb(225,225,225, maxColorValue = 255), rgb(225,225,225, maxColorValue = 255))
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
  labs(x='Chromatin State', y='Score', title='Expression Scores for CERES Dataset') +
  theme(axis.title = element_text(size=16)) +
  theme(axis.text.x = element_text(angle=90, hjust=1)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ggsave('~/Desktop/finalCeres1_somebargraph.pdf', height=6, width=7)

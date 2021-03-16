#redirect excelspread sheet(csv file) to a bed file. Four columns are present.
cat GSE96875_CERES_data_new.csv >> CERES_data.bed

#Tab-delimit the whitespaces and commas. 
sed 's/,/   /g' CERES_data.bed > CERES_data.tab.bed

#Sort the data by chromosome start
sort -k1,1 -k2,2n CERES_data.tab.bed

#Inital Intersection to align chromosome number 11 with its respective overlapping segmented regions
intersectBed -a E123_25_imputed12marks_dense.bed  -b CERES_data.tab.bed > ceres.overlaps.bed

#The intersected regions are appended to -a in the respective to the compared file from -b
intersectBed -a E123_25_imputed12marks_dense.bed -b CERES_data.tab.bed -wa -wb > ceres.overlapsComparsion.bed

#To find and replace a the desired fields in a file.
awk {'print $1,$2,$3,$4,$13,$6,$7,$8,$9'} ceres.overlapsComparsion.bed  > ceres.overlapsComparsionValues.bed

#Tab delimit the whitespaces and commas.
sed 's/,//g' ceres.overlapsComparsionValues.bed > ceres.overlapsComparsionValues.tab.bed
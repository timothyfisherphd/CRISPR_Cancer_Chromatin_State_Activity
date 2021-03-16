%%bash
# sed 's/,/	/g' Workbook1.csv > CERES_data.tab.bed

#Inital Intersection to align chromosome number 11 with its respective overlapping segmented regions
intersectBed -a wgEncodeAwgSegmentationChromhmmK562.bed -b mpra.tab.bed > finalMpra.overlaps.bed

#The intersected regions are appended to -a in the respective to the compared file from -b
intersectBed -a wgEncodeAwgSegmentationChromhmmK562.bed -b mpra.tab.bed -wa -wb > finalCeres.overlapsComparsion.bed

#To find and replace a the desired fields in a file.
awk {'print $1,$2,$3,$4,$13,$6,$7,$8,$9'} finalCeres.overlapsComparsion.bed > finalCeres.overlapsComparsionValues.bed 

#Tab delimit the whitespaces and commas.
sed 's/,//g' finalCeres.overlapsComparsionValues.bed > finalCeres.overlapsComparsionValues.tab.bed 
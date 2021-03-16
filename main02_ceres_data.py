## Generating Ceres Data
from collections import defaultdict
import pandas as pd

mainDicticionary=defaultdict(list)
stateDictionary=defaultdict(list)
countScoreDictionary=defaultdict(int)
sumScoreDictionary=defaultdict(int)
meanScoreDictionary=defaultdict(int)

n = 0
with open('/Users/timothyfisher/Desktop/Ernst_Lab/UNIX/Updated_Dataset/ceres.overlapsComparsionValues.tab.bed', 'r') as dictList:
     for line in dictList:
        chromosome, start, end, state, score, strand, signal, end2, color = line.strip().split()
        score = float(score)
        
        stateDictionary[state].append(score)
      
        n += 1
      
with open('/Users/timothyfisher/Desktop/Ernst_Lab/UNIX/Updated_Dataset/ceres.overlapsComparsionValues.tab.bed', 'w') as outfile:
    for state in stateDictionary:
        countScoreDictionary[state] = len(stateDictionary[state])
        sumScoreDictionary[state]= sum(stateDictionary[state])
        meanScoreDictionary[state]= sumScoreDictionary[state]/countScoreDictionary[state]
        mainDicticionary[state].append(stateDictionary)
        mainDicticionary[state].append(countScoreDictionary)
        mainDicticionary[state].append(sumScoreDictionary)
        mainDicticionary[state].append(meanScoreDictionary)
        outfile.write(state+','+str(meanScoreDictionary[state])+'\n')
        
print(countScoreDictionary.items())


import numpy as np
with open('ceres_std_errs.csv','w') as f:
    for state, l in stateDictionary.items():
        print('{}\t{}'.format(state,np.std(l)), file=f)


import numpy as np
with open('ceres_length.csv','w') as f:
    for state in countScoreDictionary.items():
        print('{}\t'.format(state), file=f)

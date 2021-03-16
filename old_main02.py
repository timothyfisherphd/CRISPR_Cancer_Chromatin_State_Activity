
with open('./mpra.tab.bed', 'w') as ff:
    with open('./mpra_workbook.csv', 'r') as f:
        for line in f:
            region, score = line.strip().split(',')
            _, _, _, chromosome, middle = region.split('_')
            start = int(middle) - 147
            end   = int(middle) + 146
            print('{}\t{}\t{}\t{}'.format(chromosome, start, end, score), file = ff)

with open('./mpra.tab.bed', 'w') as ff:
    with open('./basepredictions_K562_ScaleUpDesign1and2_combinedP.txt') as f:
        for line in f:
            l= line.strip().split('\t')
            _, _, _, chromosome, middle = l[0].split('_')
            scores = l[1:]
            i = - 147
            for s in scores:
                start = int(middle) + i
                end = start + 1
                print(chromosome,start,end,s, sep='\t', file = ff)
                i += 1

from collections import defaultdict
import pandas as pd

mainDicticionary=defaultdict(list)
stateDictionary=defaultdict(list)
countScoreDictionary=defaultdict(int)
sumScoreDictionary=defaultdict(int)
meanScoreDictionary=defaultdict(int)

# flat_list = [item for sublist in stateDictionary.values() for item in sublist]

n = 0
with open('finalCeres.overlapsComparsionValues.tab.bed', 'r') as dictList:
     for line in dictList:
        chromosome, start, end, state, score, strand, signal, end2, color = line.strip().split()
#         score = (float(score)-np.mean(flat_list))/np.std(flat_list)
        score = float(score)

        stateDictionary[state].append(score)
      
        n += 1

with open('finalCeres.overlapsComparsionValues.tab.tab.bed', 'w') as outfile:
    for state in stateDictionary:
        
        countScoreDictionary[state] = len(stateDictionary[state])
        sumScoreDictionary[state]= sum(stateDictionary[state])
        meanScoreDictionary[state]= sumScoreDictionary[state]/countScoreDictionary[state]
        mainDicticionary[state].append(stateDictionary)
        mainDicticionary[state].append(countScoreDictionary)
        mainDicticionary[state].append(sumScoreDictionary)
        mainDicticionary[state].append(meanScoreDictionary)
        outfile.write(d[state]+','+str(meanScoreDictionary[state])+'\n')
        
print(countScoreDictionary.items())


state_map = ["Tss",
"TssF",
"PromF",
"PromP",
"Enh",
"EnhF",
"EnhWF",
"EnhW",
"DnaseU",
"DnaseD",
"FaireW",
"CtcfO",
"Ctcf",
"Gen5'",
"Elon",
"ElonW",
"Gen3'",
"Pol2",
"H4K20",
"ReprD",
"Repr",
"ReprW",
"Low",
"Quies",
"Art"]

d = {}
for i in range(0,len(state_map)):
    new_state = '{}_{}'.format(i+1, state_map[i])
    d[state_map[i]] = new_state

import numpy as np
with open('finalCeres_std_errs.csv','w') as f:
    for state in state_map:
        l = stateDictionary[state]
        print('{}\t{}'.format(d[state],np.std(l)/np.sqrt(len(l))), file=f)
        print('{}\t{}'.format(d[state],np.std(l)/np.sqrt(len(l))))

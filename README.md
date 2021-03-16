# CRISPR_Cancer_Chromatin_State_Activity
Evaluating the Chromatin State Activity of Cancer Cell Line using CRISPR
- Author: Timothy Fisher
- PI: Dr. Jason Ernst
- Mentor: Tevfik Umut Dincer, Shan Sabri
- Collaborator: Heater Han

## Abstract
CRISPR-Cas9 based epigenetic regulatory element screening (CERES) is an assay that measures regulatory element activity within the original genomic context; as opposed to ectopic reporter assays like the Massively Parallel Reporter Assay (MPRA), that captures activation and repression outside the original genomic context. CERES utilizes the enzyme Cas9, and a piece of RNA, called guide-RNA, to introduce a targeted modification to the genome and quantify its effect. MPRA and CERES both produce a quantitative readout of some functional activity of cis-regulatory elements but their correlation in terms of chromatin-state annotations remain unclear. We used chromatin state annotations from the 25-state extended ChromHMM model to quantify CERES-assayed regions’ activity for each chromatin state. We hypothesized that if there are intersecting segments of the same MaxPos Sharpr-MPRA (MPS-MPRA) activating scores then the CERES segmented region can be used to find the most activating state(s). Using a custom analysis pipeline, we intersected the chromatin states with its respective scores, analyzed the overlapping regions and plotted MPS-MPRA scores to determine most activating CERES scores. We observed moderate agreement between highly expressed activity in CERES and highly expressed activity in MPRA. This analysis puts the CERES data into perspective of chromatin states and provides a better understanding of the gene regulatory landscape in its native genomic context.


The poster from 2017 UCLA BIG SUMMER Conference:
 <img src="https://github.com/timothyfisherphd/CRISPR_Cancer_Chromatin_State_Activity/blob/main/2017_BIG_Poster_TimFIsher.pdf" align="center">

 ## Contact
For questions, please contact: Timothy B. Fisher (tfisher10@student.gsu.edu)
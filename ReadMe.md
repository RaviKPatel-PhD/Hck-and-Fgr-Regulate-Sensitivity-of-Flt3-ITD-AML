# Read Me for
# "The Myeloid Src-family Kinases Hck and Fgr Regulate Sensitivity of Flt3-ITD+ AML cells to the Pyrrolopyrimidine Kinase Inhibitor, A-419259"

## Authors:
Ravi K. Patel, Mark C. Weir, Kexin Shen, Daniel Snyder, Vaughn S. Cooper, and Thomas E. Smithgall

## Description:

This Github repo contains code related to the original research publication mentioned above. The original research publication has been submitted to 'Journal of Biological Chemistry'. I will updated this page with a link to the publication when it is published. Below is a brief description of the paper. **Please see below for a description of each file in this repository.**

Acute myelogenous leukemia (AML) is a devastating hematologic cancer with limited treatment options. While diverse genetic changes drive AML pathogenesis, upregulation of tyrosine kinase signaling pathways is a common feature that offers opportunities for targeted therapy. One important example involves activating mutations in the Flt3 receptor tyrosine kinase, which are observed in about one-third of AML cases. Non-receptor tyrosine ki-nases have also been implicated in AML pathogenesis, including the three Src-family kinases expressed in mye-loid cells (Hck, Fgr, and Lyn). In particular, Hck expression is upregulated in leukemic stem cells from AML pa-tients resistant to conventional chemotherapy. Inhibition of Hck activity with the pyrrolopyrimidine kinase inhibi-tor A-419259 (also known as RK-20449) reduced AML cell bone marrow engraftment in a patient-derived xeno-graft mouse model. Here, we show that A-419259 inhibits not only Hck but also Fgr, Lyn as well as Flt3 bearing a common AML-associated mutation (internal tandem duplication or ITD). To better understand the contributions of Flt3, Hck and Fgr to the A-419259 response, we generated stable human TF-1 myeloid cell populations express-ing Flt3-ITD either alone or in combination with Hck and Fgr.  TF-1 cells expressing Flt3-ITD alone became sensi-tive to growth arrest by A-419259 treatment, while cells transformed with inhibitor-resistant A-419259 mutants (D835Y or F691L) were far less sensitive, supporting direct action of this compound on the Flt3 kinase domain. Co-expression of wild-type Hck or Fgr with inhibitor-resistant Flt3-ITD mutants partially restored sensitivity to A-419259, suggesting that Hck and Fgr are relevant A-419259 inhibitor targets. Conversely, co-expression of inhibitor-resistant mutants of Hck or Fgr with Flt3-ITD decreased A-419259 sensitivity, implicating these Src-family members in inhibitor action as well. To investigate de novo mechanisms of resistance to A-419259 in AML, we selected populations of the Flt3-ITD+ AML cell lines MV4-11 and MOLM14 by gradually increasing exposure to the compound over a period of several months. Whole exome sequencing of potential A-419259 target kinases predicted by KINOMEscan analysis revealed mutations only in the Flt3-ITD kinase domain. The most common A-419259-associated resistance mutation, N676S, has been previously described for the clinical tyrosine kinase in-hibitors midostaurin (Rydapt; PKC412) and pexidartinib (PLX3397). Taken together, our findings demonstrate that the anti-AML activity of A-419259 is due to direct inhibition of Flt3-ITD, with Hck and Fgr playing a supporting role.

## Prerequisite programs used for this repo & links to where they can be downloaded:

### University of Pittsburgh Center for Research Computing Cluster
[Trimmomatic version 0.3348](http://www.usadellab.org/cms/?page=trimmomatic)        
[Burrows-Wheeler aligner maximal exact matches (BWA-MEM) algorithm version 0.7.1549](https://sourceforge.net/projects/bio-bwa/files/)                                  
[Samtools version 1.3.1](https://sourceforge.net/projects/samtools/files/samtools/1.3.1/)       
[Picard Mark Duplicates version 2.11.050](https://broadinstitute.github.io/picard/)       
[Genome analysis Toolkit (GATK) version 3.8.1 Haplotypecaller](https://software.broadinstitute.org/gatk/download/archive)      
[SnpEff version 4.3](http://snpeff.sourceforge.net/)        
[Cancer-specific High-throughput Annotation of Somatic Mutations (CHASM)](http://www.cravat.us/CRAVAT/)  - This is a Web tool, no download required

### On a local machine
[Python 3.6.4](https://www.python.org/downloads/release/python-364/)  
And the following python libraries:      
[matplotlib 2.2.2](https://matplotlib.org/users/installing.html)    
[seaborn 0.9.0](https://seaborn.pydata.org/installing.html)     
[pandas 0.23.4](https://pypi.org/project/pandas/)          
[numpy 1.14.2](https://github.com/numpy/numpy/releases)           
[scipy 1.0.0](https://docs.scipy.org/doc/scipy-1.0.0/reference/)       


## Description of all files in repository
ExomeSeq_Analysis_script.sh is the script for the Exome sequencing analysis performed at the University of Pittsburgh Center for Research Computing. The Raw sequencing data can be accessed at the sequencing read archive here (insert link to SRA).
Each directory contains a jupyter notebook which contains the code for analysis and generation of each of the figures made using python code (Figure 1A, Supplementary Figure 1A, Supplementary Figure 1B, Supplementary Figure 4). All other files within each directory (or subdirectories) are raw data for the analysis.

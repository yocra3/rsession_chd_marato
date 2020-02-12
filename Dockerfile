# Docker inheritance
FROM bioconductor/bioconductor_docker:RELEASE_3_10

# Install tidyverse (latest versions available when creating the file)
## cowplot: make panel plots
RUN R -e 'devtools::install_version("dplyr", version = "0.8.4");\
	  devtools::install_version("readr", version = "1.3.1");\
	  devtools::install_version("tidyr", version = "1.0.2");\
	  devtools::install_version("cowplot", version = "1.0.0");}'

# Install required Bioconductor package
## mCSEA: Find genes differentially methylated
## OUTRIDER: Find expression outliers in RNAseq data
## minfi: manage methylation data
## bumphunter: used in algorithm to detect epi-variants
## fgsea: GSEA analysis
## reactome.db: pathways to test
RUN R -e 'BiocManager::install(c("limma", "OUTRIDER", mCSEA",\
				 "minfi", "bumphunter", "reactome.db", "fgsea"))'


# Install github packages (last commit when creating docker)
## meffil: preprocess methylation
## FRASER: Find splicing outlier in RNAseq data
## mlm: Find genes with differential splicing between conditions
RUN R -e 'devtools::install_github("perishky/meffil", ref = "96d448d");\
	  devtools::install_github("dgarrimar/mlm", ref = "fb73a9f");\
	  devtools::install_github("gagneurlab/FRASER", ref = "22c617c")'



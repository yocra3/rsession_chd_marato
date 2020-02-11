# Docker inheritance
FROM bioconductor/bioconductor_docker:RELEASE_3_10

# Install tidyverse (latest versions available when creating the file)
RUN R -e 'devtools::install_version("dplyr", version = "0.8.4");\
	  devtools::install_version("readr", version = "1.3.1");\
	  devtools::install_version("tidyr", version = "1.0.2")}'

# Install required Bioconductor package
RUN R -e 'BiocManager::install("MultiDataSet")'

# Docker inheritance
FROM bioconductor/bioconductor_docker:RELEASE_3_10

# Install required Bioconductor package
RUN R -e 'BiocManager::install("MultiDataSet")'

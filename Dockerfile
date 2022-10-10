# Building on top of the alabaster image.
FROM ghcr.io/artifactdb/alabaster-docker/builder:latest

WORKDIR /home/rstudio/sources

# Pulling down zircon and the calcite packages. 
RUN git clone https://github.com/ArtifactDB/zircon-R
RUN git clone https://github.com/ArtifactDB/calcite.schemas
RUN git clone https://github.com/ArtifactDB/calcite-R

# Trawling through their dependencies.
RUN R -f install.R

# Installing for each directory
RUN R CMD INSTALL zircon-R
RUN R CMD INSTALL calcite.schemas
RUN R CMD INSTALL calcite-R

# Setting the working directory to the home.
WORKDIR /home/rstudio

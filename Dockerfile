# Copyright (c) UBC-DSCI Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/r-notebook

USER root

# R packages
RUN conda install --quiet --yes \
    'r-testthat=2.0*' \
    'r-plotly=4.7*' \
    'r-repr=0.15*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

RUN Rscript -e "install.packages(c('infer', 'scatterplot3d'), repos = 'https://cran.rstudio.com')"

# Install nbgitpuller
RUN pip install git+https://github.com/data-8/nbgitpuller
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix

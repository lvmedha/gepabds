# gepabds — containerized single-cell gene expression tools
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC

# system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    jq \
    && rm -rf /var/lib/apt/lists/*

# install miniconda
ENV CONDA_DIR=/opt/conda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p $CONDA_DIR \
    && rm /tmp/miniconda.sh

ENV PATH=$CONDA_DIR/bin:$PATH

# conda channels
RUN conda config --system --remove channels defaults 2>/dev/null || true \
    && conda config --system --prepend channels conda-forge \
    && conda config --system --append channels bioconda \
    && conda config --system --set channel_priority strict

# create environment from your environment.yml
COPY environment.yml /tmp/environment.yml
RUN sed -i '/^prefix:/d' /tmp/environment.yml \
    && conda env create -y -p /opt/conda/envs/gepabds -f /tmp/environment.yml \
    && rm /tmp/environment.yml \
    && conda clean -afy

# activate env
ENV PATH=/opt/conda/envs/gepabds/bin:$PATH \
    R_HOME=/opt/conda/envs/gepabds/lib/R

# working directory
WORKDIR /gepabds

# copy your package
COPY . .

# install Rapp (for CLI)
RUN Rscript -e 'options(repos = c(CRAN = "https://cloud.r-project.org")); install.packages("Rapp")'

# install YOUR package (CRITICAL FIX)
RUN R CMD INSTALL /gepabds

# install CLI from YOUR package (FIXED NAME)
RUN Rscript -e 'options(repos = c(CRAN = "https://cloud.r-project.org")); Rapp::install_pkg_cli_apps("gepabds")'

# make CLI available
ENV PATH=/root/.local/bin:$PATH

# default command (optional)
CMD ["R", "--no-save", "-q"]
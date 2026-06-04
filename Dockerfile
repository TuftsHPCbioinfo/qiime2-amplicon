FROM quay.io/qiime2/amplicon:2024.2

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    ipython \
    ipykernel \
    matplotlib
RUN pip install Cython==0.29.37 && \
pip install iow==1.0.7 && \
pip --no-cache-dir install gemelli==0.0.10

RUN qiime dev refresh-cache && qiime gemelli --help

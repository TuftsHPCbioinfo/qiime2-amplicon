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

RUN pip install --no-cache-dir gemelli

RUN qiime dev refresh-cache && qiime gemelli --help

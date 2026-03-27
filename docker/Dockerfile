FROM ubuntu:22.04

LABEL image.authors="csaba.berta@aimms.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Etc/UTC

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y software-properties-common ca-certificates curl apt-transport-https lsb-release gnupg wget && \
    add-apt-repository ppa:deadsnakes/ppa -y

RUN mkdir -p /etc/apt/keyrings
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/keyrings/microsoft.gpg > /dev/null
RUN chmod go+r /etc/apt/keyrings/microsoft.gpg

RUN AZ_DIST=$(lsb_release -cs) \
    && echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_DIST main" | tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update

RUN apt-get install -y \
        docker.io \
        rsync \
        python3 \
        python3-dev \
        python3-pip \
        python3-distutils \
        azure-cli \
        libenchant-2-2

RUN apt-get install -y \
        texlive-latex-recommended \
        texlive-fonts-recommended \
        texlive-latex-extra \
        latexmk

RUN wget -O azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux && tar -xf azcopy_v10.tar.gz && cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

COPY requirements.txt /tmp/requirements.txt

RUN python3 -mpip install --upgrade pip \
    && python3 -mpip install -r /tmp/requirements.txt

CMD ["/bin/bash"]

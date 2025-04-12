FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bc \
    bison \
    build-essential \
    flex \
    gcc-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    git \
    libssl-dev \
    make \
    python3 \
    python3-pip \
    python-dev \
    swig \
    u-boot-tools \
    libgnutls28-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /u-boot

RUN pip3 install importlib_resources

ENV CROSS_COMPILE=arm-linux-gnueabihf-

COPY . .

RUN make CROSS_COMPILE=arm-linux-gnueabihf- Business_Card_V3s_defconfig
RUN make CROSS_COMPILE=arm-linux-gnueabihf- dtbs

RUN make CROSS_COMPILE=arm-linux-gnueabihf-

CMD ["/bin/bash"]

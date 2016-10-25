# Mininet

FROM iwaseyusuke/mininet

MAINTAINER IWASE Yusuke <iwase.yusuke0@gmail.com>
ARG user=iwaseyusuke

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gcc \
    git \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    python-setuptools \
    python-pip \
    python-eventlet \
    python-lxml \
    python-msgpack \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/* \
 && git clone https://github.com/osrg/ryu.git /root/ryu \
 && pip install -r ryu/tools/pip-requires -r ryu/tools/test-requires \
 && pip install /root/ryu \
 && apt-get purge -y \
    gcc \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    zlib1g-dev \
 && chmod +x /ENTRYPOINT.sh

ENTRYPOINT ["/ENTRYPOINT.sh"]

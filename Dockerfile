# Mininet

FROM iwaseyusuke/mininet

MAINTAINER IWASE Yusuke <iwase.yusuke0@gmail.com>
ARG user=iwaseyusuke

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /root/

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    python-setuptools \
    python-pip \
    python-eventlet \
    python-lxml \
    python-msgpack \
 && rm -rf /var/lib/apt/lists/* \
 && git clone https://github.com/osrg/ryu.git /root/ryu \
 && pip install /root/ryu \
 && chmod +x /root/ENTRYPOINT.sh

ENTRYPOINT ["/root/ENTRYPOINT.sh"]

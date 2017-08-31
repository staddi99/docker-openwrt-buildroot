FROM resin/rpi-raspbian:latest

ENTRYPOINT []

RUN apt-get update &&\
    apt-get install -y build-essential git subversion quilt gawk unzip python wget zlib1g-dev libncurses5-dev \
                       fakeroot ca-certificates libssl-dev &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone https://github.com/openwrt/openwrt.git &&\
    sudo -iu openwrt openwrt/scripts/feeds update -a &&\
    sudo -iu openwrt openwrt/scripts/feeds install -a

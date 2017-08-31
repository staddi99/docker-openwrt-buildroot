FROM resin/rpi-raspbian:latest

ENTRYPOINT []

RUN apt-get update &&\
    apt-get install -y git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone https://github.com/openwrt/openwrt.git &&\
    sudo -iu openwrt openwrt/scripts/feeds update -a
    sudo -iu openwrt openwrt/scripts/feeds install -a

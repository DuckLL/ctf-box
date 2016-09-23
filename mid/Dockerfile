FROM duckll/ctf-box:small

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color

EXPOSE 3002 4000

CMD ["/sbin/my_init","--","sh"]

# apt-get
RUN apt-add-repository --yes ppa:pwntools/binutils \
&& echo "deb http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main" > /etc/apt/sources.list.d/pwntools-ubuntu-binutils-xenial.list \
&& apt-get update \
&& apt-get install -yq \
   bash-completion \
   binutils-*-linux-gnu* \
   gdb-multiarch \
   libc6-*-cross \
   make \
   p7zip-full \
   qemu \
   qemu-user \
   qemu-user-static \
   sudo \
&& apt-get clean

#qemu
RUN mkdir /etc/qemu-binfmt \
&& ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel \
&& ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm

#qira
RUN cd ~ \
&& git clone https://github.com/BinaryAnalysisPlatform/qira.git \
&& cd qira/ \
&& ./install.sh \
&& ./fetchlibs.sh

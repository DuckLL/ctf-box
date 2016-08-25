FROM duckll/ctf-box:small

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color

EXPOSE 3002 4000

CMD ["tmux"]

# apt-get
RUN apt-add-repository --yes ppa:pwntools/binutils \
&& echo "deb http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main" > /etc/apt/sources.list.d/pwntools-ubuntu-binutils-xenial.list \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -yq \
   bash-completion \
   binutils-*-linux-gnu* \
   exuberant-ctags \
   gdb-multiarch \
   libc6-*-cross \
   make \
   p7zip-full \
   qemu \
   qemu-user \
   qemu-user-static \
   sudo

#pip
RUN pip install \
   angr

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

#pintool
RUN wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
&& tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
&& rm pin-3.0-76991-gcc-linux.tar.gz \
&& mv pin-3.0-76991-gcc-linux pin \
&& cd pin/source/tools \
&& make

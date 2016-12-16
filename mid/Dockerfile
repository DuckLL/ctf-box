FROM duckll/ctf-box:small

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# apt-get
RUN apt-add-repository --yes ppa:pwntools/binutils \
&& echo "deb http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main" > /etc/apt/sources.list.d/pwntools-ubuntu-binutils-xenial.list \
&& apt-fast update \
&& apt-fast -y install \
   binutils-*-linux-gnu* \
   # gdb-multiarch \
   libc6-*-cross \
   make \
   p7zip-full \
   # qemu \
   # qemu-user \
   # qemu-user-static \
   sudo \
&& apt-fast clean

# qemu
# RUN mkdir /etc/qemu-binfmt \
# && ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel \
# && ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm

# qira qemu pintool
RUN git clone https://github.com/BinaryAnalysisPlatform/qira.git --depth 1 \
&& cd ./qira \
&& ./install.sh \
&& ./fetchlibs.sh \
&& cd ./tracers/ \
&& ./qemu_build.sh
&& ln -s /qira/tracers/qemu/qemu-latest /qemu
&& echo 'export PATH="/qemu/aarch64-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/arm-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/i386-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/mips-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/mipsel-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/ppc-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/x86_64-linux-user:$PATH"' >> ~/.bashrc \
&& ./pin_build.sh \
&& ln -s /qira/tracers/pin/pin-2.14-71313-gcc.4.4.7-linux/ /pin \
&& cd /pin/source/tools/ManualExamples \
&& make CXX=g++-4.9 \
&& echo 'export PATH="/pin:$PATH"' >> ~/.bashrc \
&& rm -rf /tmp/*

FROM duckll/base

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# qira qemu
RUN apt-fast update \
&& apt-fast -y install sudo \
&& git clone https://github.com/BinaryAnalysisPlatform/qira.git --depth 1 \
&& cd ./qira \
&& ./install.sh \
&& ./fetchlibs.sh \
&& cd ./tracers/ \
&& ./qemu_build.sh \
&& ln -s /qira/tracers/qemu/qemu-latest /qemu \
&& echo 'export PATH="/qemu/aarch64-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/arm-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/i386-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/mips-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/mipsel-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/ppc-linux-user:$PATH"' >> ~/.bashrc \
&& echo 'export PATH="/qemu/x86_64-linux-user:$PATH"' >> ~/.bashrc \
&& ./pin_build.sh \
&& rm -rf /tmp/*

# apt
RUN dpkg --add-architecture i386 \
&& apt-add-repository --yes ppa:pwntools/binutils \
&& echo "deb http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main" > /etc/apt/sources.list.d/pwntools-ubuntu-binutils-xenial.list \
&& apt-fast update \
&& apt-fast -y install \
   binutils-*-linux-gnu* \
   gdb-multiarch \
   g++-multilib \
   libffi-dev \
   libssh-dev \
   libc6-*-cross \
   ltrace \
   make \
   nasm \
   nmap \
   p7zip-full \
   strace \
&& apt-fast clean

#pip
RUN pip2 install \
   ipython \
   pwntools \
&& rm -rf /tmp/*

# gdb
RUN git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

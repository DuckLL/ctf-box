FROM duckll/base

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

COPY ./flask-fix.sh /tmp/

# qira qemu
RUN git clone https://github.com/BinaryAnalysisPlatform/qira.git --depth 1 \
&& apt-fast update \
&& apt-fast -y install \
   sudo \
&& cd ./qira \
&& ./install.sh \

# fix flask bug
&& /tmp/flask-fix.sh \

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
&& rm -rf /tmp/* \

# apt
&& dpkg --add-architecture i386 \
&& apt-fast update \
&& apt-fast -y install \
   binutils-*-linux-gnu* \
   gdb-multiarch \
   g++ \
   libc6:i386 \
   libncurses5:i386 \
   libstdc++6:i386 \
   libffi-dev \
   libssh-dev \
   libc6-*-cross \
   ltrace \
   make \
   nasm \
   nmap \
   p7zip-full \
   strace \
&& apt-fast clean \

#pip
&& pip2 install \
   ipython \
   pwntools \

# gdb
&& git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

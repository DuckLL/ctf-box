FROM duckll/base

EXPOSE 3002

COPY ./python.snippets /root/.config/nvim/plugged/vim-snippets/UltiSnips

# qira qemu
RUN git clone https://github.com/DuckLL/qira.git --depth 1 \
&& apt update \
&& apt -y install \
   sudo \
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
&& echo 'for dir in $HOME/.gem/ruby/*; do' >> ~/.bashrc \
&& echo '     [ -d "$dir/bin" ] && PATH="${dir}/bin:${PATH}"' >> ~/.bashrc \
&& echo 'done' >> ~/.bashrc \
&& ./pin_build.sh \
&& rm -rf /tmp/* \

# apt
&& dpkg --add-architecture i386 \
&& apt update \
&& apt -y install \
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

#pip
&& pip2 install \
   ipython \
   pwntools \

# gdb
&& git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/ \

# cleanup
&& apt clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

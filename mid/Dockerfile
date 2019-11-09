FROM duckll/base

COPY ./python.snippets /root/.config/nvim/plugged/vim-snippets/UltiSnips

# apt
RUN dpkg --add-architecture i386 \
&& apt update \
&& apt -y install \
   g++ \
   g++:i386 \
   gdb-multiarch \
   ltrace \
   make \
   nasm \
   python-pip \
   qemu \
   ruby-dev \
   strace \

#pip
&& pip2 install \
   ipython \
   pwntools \

# rubypwn
&& gem install \
    one_gadget \
    seccomp-tools \
    heapinfo \
&& echo 'for dir in $HOME/.gem/ruby/*; do' >> ~/.bashrc \
&& echo '     [ -d "$dir/bin" ] && PATH="${dir}/bin:${PATH}"' >> ~/.bashrc \
&& echo 'done' >> ~/.bashrc \

# gdb
&& wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cat ~/Pwngdb/.gdbinit >> ~/.gdbinit \

# cleanup
&& apt clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

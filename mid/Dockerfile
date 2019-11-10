FROM duckll/base

COPY ./python.snippets /root/.config/nvim/plugged/vim-snippets/UltiSnips

# apt
RUN dpkg --add-architecture i386 \
&& apt update \
&& apt -y install \
   cmake \
   g++ \
   gdb-multiarch \
   libc6:i386 \
   ltrace \
   make \
   nasm \
   python-pip \
   qemu \
   ruby-dev \
   strace \

# pip2
&& pip2 install \
   ipython \
   pwntools \

# pip3
&& pip3 install \
   capstone \
   keystone-engine \
   ropper \
   unicorn \

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

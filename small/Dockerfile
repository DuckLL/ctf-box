FROM duckll/base

MAINTAINER DuckLL <a347liao@gmail.com>

# apt-get
RUN dpkg --add-architecture i386 \
&& apt-fast update \
&& apt-fast -y install \
   gdb \
   g++-multilib \
   libffi-dev \
   libssh-dev \
   nasm \
   nmap \
&& apt-fast clean

#pip
RUN pip2 install \
   ipython \
   pwntools \
&& rm -rf /tmp/*

#gdb
RUN git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

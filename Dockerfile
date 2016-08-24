FROM phusion/baseimage:latest

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color

EXPOSE 3002 4000

CMD ["tmux"]

# apt-get
RUN dpkg --add-architecture i386 \
&& apt-add-repository --yes ppa:pwntools/binutils \
&& echo -e "deb http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main\ndeb-src http://ppa.launchpad.net/pwntools/binutils/ubuntu vivid main" > /etc/apt/sources.list.d/pwntools-ubuntu-binutils-xenial.list \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -yq \
   g++-multilib \
   python-pip \
   git \
   vim \
   tmux \
   wget \
   make \
   gdb-multiarch \
   sudo \
   exuberant-ctags \
   bash-completion \
   p7zip-full \
   libssh-dev \
   libffi-dev \
   qemu \
   qemu-user \
   qemu-user-static \
   libc6-*-cross \
   binutils-*-linux-gnu*

#pip
RUN pip install --upgrade pip \
&& pip install \
   ipython \
   pwntools \
   angr

#dotfiles
RUN cd ~ \
&& git clone https://github.com/DuckLL/ctf-box.git \
&& cp ~/ctf-box/.tmux.conf ~/.tmux.conf \
&& cp ~/ctf-box/.vimrc ~/.vimrc \
&& mkdir -p ~/.vim/colors/ \
&& cp ~/ctf-box/Tomorrow-Night-Bright.vim ~/.vim/colors/Tomorrow-Night-Bright.vim \
&& mkdir /etc/qemu-binfmt \
&& ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel \
&& ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm

#vim plugin
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
&& vim +PluginInstall +qall

#gdb
RUN git clone https://github.com/longld/peda.git ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

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

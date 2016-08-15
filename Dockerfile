FROM phusion/baseimage:latest

# apt-get
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y
RUN apt-get install -yq \
    g++-multilib \
    python-pip \
    git \
    vim \
    tmux \
    nasm \
    nmap \
    wget \
    make \
    gdb \
    sudo \
    bash-completion \
    p7zip-full \
    libssh-dev \
    libffi-dev

#pip
RUN pip install --upgrade pip
RUN pip install \
    ipython \
    ropgadget \
    ropper \
    angr

#dotfiles
RUN cd ~ \
&& git clone https://github.com/DuckLL/ctf-box.git \
&& cp ~/ctf-box/.tmux.conf ~/.tmux.conf \
&& cp ~/ctf-box/.vimrc ~/.vimrc \
&& mkdir -p ~/.vim/colors/ \
&& cp ~/ctf-box/Tomorrow-Night-Bright.vim ~/.vim/colors/Tomorrow-Night-Bright.vim

#vim plugin
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
&& vim +PluginInstall +qall

#pwntools
RUN pip install --upgrade git+https://github.com/binjitsu/binjitsu.git

#pwngdb
RUN cd ~ \
&& git clone https://github.com/scwuaptx/Pwngdb.git \
&& cp ~/Pwngdb/.gdbinit ~/

#peda-gdb
RUN git clone https://github.com/longld/peda.git ~/peda \
&& echo "source ~/peda/peda.py" >> ~/.gdbinit

#qira
RUN cd ~ \
&& git clone https://github.com/BinaryAnalysisPlatform/qira.git \
&& cd qira/ \
&& ./install.sh \
&& ./fetchlibs.sh

#pintool
RUN wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
&& tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
&& mv pin-3.0-76991-gcc-linux pin \
&& cd pin/source/tools \
&& make

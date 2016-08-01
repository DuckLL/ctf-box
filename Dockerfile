FROM phusion/baseimage:latest

# apt-get
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -yq \
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
RUN apt upgrade -y

#pip
RUN pip install --upgrade pip
RUN pip install \
    ipython \
    pwntools \
    capstone \
    angr

#peda-gdb
RUN git clone https://github.com/longld/peda.git ~/peda && echo "source ~/peda/peda.py" >> ~/.gdbinit

# qira
RUN cd ~ && git clone https://github.com/BinaryAnalysisPlatform/qira.git && cd qira/ && ./install.sh && ./fetchlibs.sh

# dotfiles
RUN cd ~ && git clone https://github.com/DuckLL/ctf-box.git
RUN cp ~/ctf-box/.vimrc ~/.vimrc
RUN mkdir -p ~/.vim/colors && cp ~/ctf-box/Tomorrow-Night-Bright.vim ~/.vim/colors
RUN cp ~/ctf-box/.tmux.conf ~/.tmux.conf

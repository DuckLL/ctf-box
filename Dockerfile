FROM phusion/baseimage:latest

# apt-get
RUN dpkg --add-architecture i386 && apt update && apt install -yq \
    g++-multilib \
    python-pip \
    git \
    vim \
    tmux \
    nasm \
    wget \
    make \
    libssh-dev \
    p7zip-full \
    gdb

#pip
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
COPY ./.vimrc ~/.vimrc
COPY ./.tmux.conf ~/.tmux.conf

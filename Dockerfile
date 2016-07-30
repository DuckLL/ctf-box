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
    wget \
    make \
    gdb \
    p7zip-full \
    libssh-dev \
    libffi-dev

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
COPY ./.vimrc ~/.vimrc
COPY ./.tmux.conf ~/.tmux.conf

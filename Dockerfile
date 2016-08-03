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

# enable ssh
RUN rm -f /etc/service/sshd/down && /etc/my_init.d/00_regen_ssh_host_keys.sh

# dotfiles
ADD ./.tmux.conf ~/.tmux.conf
ADD ./.vimrc ~/.vimrc
ADD ./Tomorrow-Night-Bright.vim ~/.vim/colors/Tomorrow-Night-Bright.vim
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstal +qall

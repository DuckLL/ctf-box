FROM phusion/baseimage:latest

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color
ENV LC_ALL en_US.UTF-8

CMD ["/sbin/my_init"]

# apt-get
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -yq \
   bash-completion \
   exuberant-ctags \
   gdb \
   git \
   g++-multilib \
   libffi-dev \
   libssh-dev \
   nasm \
   nmap \
   python-pip \
   tmux \
   vim \
   wget \
&& apt-get clean

#pip
RUN pip install --upgrade pip \
&& pip install \
   ipython \
   pwntools

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

#gdb
RUN git clone https://github.com/longld/peda.git ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

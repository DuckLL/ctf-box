FROM phusion/baseimage:latest

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color
ENV LC_ALL en_US.UTF-8

CMD ["/sbin/my_init"]

# apt-get
RUN dpkg --add-architecture i386 \
&& add-apt-repository ppa:neovim-ppa/unstable \
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
   neovim \
   python-pip \
   tmux \
   wget \
&& apt-get clean

#pip
RUN pip install --upgrade pip \
&& pip install \
   neovim \
   ipython \
   pwntools

#dotfiles
RUN cd ~ \
&& git clone https://github.com/DuckLL/ctf-box.git --depth 1 \
&& cp ~/ctf-box/.tmux.conf ~/.tmux.conf \
&& cp ~/ctf-box/.vimrc ~/.vimrc \

#vim plugin
git clone https://github.com/Shougo/neobundle.vim --depth 1 ~/.vim/bundle/neobundle.vim
nvim -c "NeoBundleInstall" -c "q"

#gdb
RUN git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

FROM phusion/baseimage:latest

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color
ENV LC_ALL en_US.UTF-8

CMD ["/sbin/my_init"]

# apt-get
RUN dpkg --add-architecture i386 \
&& add-apt-repository --yes ppa:neovim-ppa/unstable \
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
   python3-pip \
   tmux \
   wget \
&& apt-get clean

#pip
RUN pip2 install --upgrade pip \
&& pip2 install \
   neovim \
   ipython \
   pwntools \
&& pip3 install --upgrade pip \
&& pip3 install \
   neovim

#dotfiles
RUN git clone https://github.com/DuckLL/ctf-box.git --depth 1 ~/ctf-box \
&& cp ~/ctf-box/.tmux.conf ~/.tmux.conf \
&& cp ~/ctf-box/.vimrc ~/.vimrc \
&& mkdir -p ~/.config/nvim \
&& ln -s ~/.vimrc ~/.config/nvim/init.vim \
&& echo 'alias vim="nvim"' >> ~/.bashrc

#vim plugin
RUN mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim \
&& git clone https://github.com/Shougo/dein.vim.git --depth 1 ~/.vim/dein/repos/github.com/Shougo/dein.vim \
&& nvim +":silent! call dein#install()" +:q

#gdb
RUN git clone https://github.com/longld/peda.git --depth 1 ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git --depth 1 ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

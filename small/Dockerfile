FROM phusion/baseimage:latest

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color

EXPOSE 3002 4000

CMD ["tmux"]

# apt-get
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -yq \
   g++-multilib \
   python-pip \
   git \
   vim \
   tmux \
   nmap \
   wget \
   make \
   gdb \
   libssh-dev

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

#gdb
RUN git clone https://github.com/longld/peda.git ~/peda \
&& git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb \
&& cp ~/Pwngdb/.gdbinit ~/

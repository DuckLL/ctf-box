FROM duckll/ctf-box:mid

MAINTAINER DuckLL <a347liao@gmail.com>

ENV TERM screen-256color

EXPOSE 3002 4000

CMD ["tmux"]

#pip
RUN pip install \
   angr

#pintool
RUN wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
&& tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
&& rm pin-3.0-76991-gcc-linux.tar.gz \
&& mv pin-3.0-76991-gcc-linux pin \
&& cd pin/source/tools \
&& make

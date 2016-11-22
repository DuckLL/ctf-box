FROM duckll/ctf-box:mid

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# binwalk
RUN git clone https://github.com/devttys0/binwalk.git \
&& cd binwalk \
&& ./setup.py install \
&& cd ../ \
&& rm -rf ./binwalk

#pip
RUN pip2 install \
   angr \
   pycrypto \
   sympy \
&& rm -rf /tmp/*

#pintool
RUN wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
&& tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
&& rm pin-3.0-76991-gcc-linux.tar.gz \
&& mv pin-3.0-76991-gcc-linux pin \
&& cd pin/source/tools \
&& make

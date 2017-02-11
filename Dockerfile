FROM duckll/ctf-box:mid

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# apt
Run apt-fast update \
&& apt-fast install -y \
   libtool-bin \
   libpcre++-dev \
   pcregrep \
&& apt-fast clean \

# pip
&& pip2 install \
   angr \
   distorm3 \
   gmpy \
   openpyxl \
   pycrypto \
   Pillow \
   sympy \
   ujson \
   xortool \
   yara-python \
&& rm -rf /tmp/* \

# afl
&& wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz \
&& tar -xvf ./afl-latest.tgz \
&& cd ./afl-2.35b \
&& make \
&& cd ./qemu_mode \
&& ./build_qemu_support.sh \
&& cd / \
&& rm ./afl-latest.tgz \

# binwalk
&& git clone https://github.com/devttys0/binwalk.git --depth 1 \
&& cd ./binwalk \
&& ./setup.py install \
&& cd ../ \
&& rm -rf ./binwalk \

#pintool
&& wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
&& tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
&& rm pin-3.0-76991-gcc-linux.tar.gz \
&& mv pin-3.0-76991-gcc-linux pin \
&& echo 'export PATH="/pin:$PATH"' >> ~/.bashrc \
&& cd pin/source/tools \
&& make \

#volatility
&& git clone https://github.com/volatilityfoundation/volatility.git \
&& cd ./volatility \
&& python setup.py install 

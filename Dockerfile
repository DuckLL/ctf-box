FROM duckll/ctf-box:mid

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# apt
RUN apt-fast update \
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
   ruby-dev \
   sympy \
   ujson \
   xortool \
   yara-python \
&& rm -rf /tmp/* \


# rubypwn
&& gem install \
    pry \
    one_gadget \
    seccomp-tools \
    heapinfo \

# afl
&& wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz \
&& tar -zxvf ./afl-latest.tgz \
&& cd ./afl-2.51b \
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

# pintool
# && wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.4-97438-gf90d1f746-gcc-linux.tar.gz \
# && tar -zxvf pin-3.4-97438-gf90d1f746-gcc-linux.tar.gz \
# && rm pin-3.4-97438-gf90d1f746-gcc-linux.tar.gz \
# && mv pin-3.4-97438-gf90d1f746-gcc-linux pin \
# && echo 'export PATH="/pin:$PATH"' >> ~/.bashrc \
# && cd pin/source/tools \
# && make \

# volatility
&& cd / \
&& git clone https://github.com/volatilityfoundation/volatility.git \
&& cd ./volatility \
&& python setup.py install \
&& cd ../ \
&& rm -rf ./volatility

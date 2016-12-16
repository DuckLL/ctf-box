FROM duckll/ctf-box:mid

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# afl
Run wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz \
&& apt-fast install -y libtool-bin \
&& tar -xvf ./afl-latest.tgz \
&& cd afl-2.35b \
&& make \
&& cd qemu_mode \
&& ./build_qemu_support.sh \
&& echo 'export PATH="/afl-2.35b:$PATH"' >> ~/.bashrc

# binwalk
RUN git clone https://github.com/devttys0/binwalk.git --depth 1 \
&& cd binwalk \
&& ./setup.py install \
&& cd ../ \
&& rm -rf ./binwalk

# angr python
RUN pip2 install \
   angr \
   pycrypto \
   sympy \
   xortool \
   gmpy \
&& rm -rf /tmp/*

#pintool
# RUN wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-3.0-76991-gcc-linux.tar.gz \
# && tar -xvf pin-3.0-76991-gcc-linux.tar.gz \
# && rm pin-3.0-76991-gcc-linux.tar.gz \
# && mv pin-3.0-76991-gcc-linux pin \
# && cd pin/source/tools \
# && make

FROM duckll/base

MAINTAINER DuckLL <a347liao@gmail.com>

EXPOSE 3002

# apt-get
RUN apt-fast update \
&& apt-fast -y install \
   sudo \
&& apt-fast clean

# qira qemu
RUN git clone https://github.com/BinaryAnalysisPlatform/qira.git --depth 1 \
&& cd ./qira \
&& ./install.sh \
&& ./fetchlibs.sh \
&& cd ./tracers/ \
&& ./qemu_build.sh \
&& rm -rf /tmp/*

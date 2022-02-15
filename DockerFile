FROM ubuntu:focal

WORKDIR /var/local

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
# combine into one run command to reduce image size
RUN apt-get update && apt-get install -y perl wget libfontconfig1 font-manager make && \
    wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh  && \
    apt-get clean
ENV PATH="${PATH}:/root/bin"
RUN tlmgr install xetex
RUN fmtutil-sys --all

# install only the packages you need
# this is the bit which fails for most other methods of installation
RUN tlmgr install xcolor pgf fancyhdr parskip babel-english units lastpage mdwtools comment fontawesome xifthen ifmtarg titlesec nth enumitem xecjk

RUN wget https://github.com/chrissimpkins/codeface/raw/master/cjk-fonts/source-han-sans-HWSC/SourceHanSansHWSC-Regular.otf && mkdir ~/.fonts && cp SourceHanSansHWSC-Regular.otf ~/.fonts
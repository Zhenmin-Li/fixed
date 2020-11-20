FROM rocker/verse
MAINTAINER Sam Hawke <shawke@unc.edu>
RUN echo "Hello World"

RUN R -e "install.packages(c('tidyverse', \
    'dplyr', \
    'ggplot2'),repos='https://mirrors.tuna.tsinghua.edu.cn/CRAN/')"

RUN apt-get update


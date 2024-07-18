FROM linuxserver/rdesktop:ubuntu-mate

LABEL maintainer Niko "aug3073911@outlook.com"
ENV REFRESHED_AT 2024-07-17

# Default user: abc, password: abc

RUN apt update && apt -y upgrade
RUN apt install -y software-properties-common sudo \
        wget \
        android-sdk
# JDK
# RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk
RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-11-jdk

# ASfP
ENV ASFP_FILE=asfp-2023.1.1.19-linux.deb
COPY $ASFP_FILE $HOME/
RUN dpkg -i $HOME/$ASFP_FILE
RUN rm $HOME/$ASFP_FILE

# Android Studio
WORKDIR /opt
RUN wget -O android_studio.tgz \
        'https://r3---sn-j5o7dn7s.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.20/android-studio-2022.3.1.20-linux.tar.gz?cms_redirect=yes&mh=5B&mip=58.248.106.93&mm=28&mn=sn-j5o7dn7s&ms=nvh&mt=1696914999&mv=m&mvi=3&pl=21&rmhost=r4---sn-j5o7dn7s.gvt1.com&shardbypass=sd&smhost=r4---sn-j5o7dn7z.gvt1.com' && \
        tar xvf android_studio.tgz && \
        rm android_studio.tgz
WORKDIR $HOME

# IDEA
ENV IDEA_FILE=ideaIU-2019.3.5-jbr8.tar.gz
COPY $IDEA_FILE $HOME/
RUN tar xzf $HOME/$IDEA_FILE -C /opt/
RUN rm $HOME/$IDEA_FILE

# LayoutMaster
ENV LAYOUTMASTER_PLUGIN=LayoutMaster-1.0.8.zip
ENV LAYOUTMASTER_SOURCE=LayoutMaster-1.0.0.zip
COPY $LAYOUTMASTER_PLUGIN $HOME
COPY $LAYOUTMASTER_SOURCE $HOME

# Native code
# WORKDIR $HOME
# RUN wget https://download.jetbrains.com/cpp/CLion-2022.3.tar.gz
# RUN tar xzf CLion-*.tar.gz -C /opt/ \
        # && rm CLion-*.tar.gz
# RUN apt update && apt install -y cmake gcc g++ clang
# RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Chinese Support
RUN sudo locale-gen zh_CN.UTF-8 && sudo dpkg-reconfigure locales && \
    sudo apt --fix-broken -y install `check-language-support -l zh-hans`

# Spark Store
COPY spark-store_4.2.13.1_amd64.deb $HOME
RUN sudo apt --fix-broken -y install $HOME/spark-store_4.2.13.1_amd64.deb

RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*


FROM linuxserver/rdesktop:ubuntu-mate

LABEL maintainer Niko "aug3073911@outlook.com"
ENV REFRESHED_AT 2025-11-13

# Default user: abc, password: abc

RUN apt update -y
RUN apt install -y software-properties-common sudo \
        wget \
        android-sdk \
        desktop-file-utils
# JDK
# RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk
RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-11-jdk

# ASfP
# WORKDIR $HOME
# RUN wget -O $HOME/asfp.deb 'https://dl.google.com/android/asfp/asfp-Narwhal%203%20Feature%20Drop-2025.1.3.7-linux.deb?hl=zh-cn' && \
#        dpkg -i $HOME/asfp.deb && \
#        rm $HOME/asfp.deb

# Android Studio
WORKDIR /opt
RUN wget -O android_studio.tgz \
        'https://r1---sn-a5mekndd.googlevideo.com/edgedl/android/studio/ide-zips/2025.2.1.7/android-studio-2025.2.1.7-linux.tar.gz?met=1763021081,&mh=oe&pl=21&rms=ltu,ltu&shardbypass=sd&redirect_counter=1&cm2rm=sn-j5oy7l&rrc=191&req_id=dfd11248f9f19a90&cms_redirect=yes&cmsv=e&mip=58.248.106.93&mm=34&mn=sn-a5mekndd&ms=ltu&mt=1763020486&mv=u&mvi=1&rmhost=r2---sn-a5mekndd.googlevideo.com&smhost=r5---sn-a5meknsd.googlevideo.com' && \
        tar xvf android_studio.tgz && \
        rm android_studio.tgz
WORKDIR $HOME

# IDEA
# ENV IDEA_FILE=ideaIU-2019.3.5-jbr8.tar.gz
# COPY $IDEA_FILE $HOME/
# RUN tar xzf $HOME/$IDEA_FILE -C /opt/
# RUN rm $HOME/$IDEA_FILE

# LayoutMaster
# ENV LAYOUTMASTER_PLUGIN=LayoutMaster-1.0.8.zip
# ENV LAYOUTMASTER_SOURCE=LayoutMaster-1.0.0.zip
# COPY $LAYOUTMASTER_PLUGIN $HOME
# COPY $LAYOUTMASTER_SOURCE $HOME

# Native code
# WORKDIR $HOME
# RUN wget https://download.jetbrains.com/cpp/CLion-2022.3.tar.gz
# RUN tar xzf CLion-*.tar.gz -C /opt/ \
        # && rm CLion-*.tar.gz
# RUN apt update && apt install -y cmake gcc g++ clang
# RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Chinese Support
# RUN sudo locale-gen zh_CN.UTF-8 && sudo dpkg-reconfigure locales && \
#       sudo apt --fix-broken -y install `check-language-support -l zh-hans`

# Spark Store
# COPY spark-store_4.2.13.1_amd64.deb $HOME
# RUN sudo apt --fix-broken -y install $HOME/spark-store_4.2.13.1_amd64.deb

RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*


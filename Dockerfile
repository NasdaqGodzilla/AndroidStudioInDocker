FROM linuxserver/rdesktop:ubuntu-mate

LABEL maintainer Niko "aug3073911@outlook.com"
ENV REFRESHED_AT 2024-07-17

ENV USER_ID 1000

# Default user: abc, password: abc

USER 0
RUN apt update && apt -y upgrade
RUN apt install -y software-properties-common sudo \
        wget \
        android-sdk
# JDK
# RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk
RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-11-jdk
USER $USER_ID

# ASfP
ENV ASFP_FILE=asfp-2023.1.1.19-linux.deb
COPY $ASFP_FILE $HOME/
USER 0
RUN dpkg -i $HOME/$ASFP_FILE
RUN rm $HOME/$ASFP_FILE
USER $USER_ID

# Android Studio
WORKDIR /opt
USER 0
RUN wget -O android_studio.tgz \
        'https://r3---sn-j5o7dn7s.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.20/android-studio-2022.3.1.20-linux.tar.gz?cms_redirect=yes&mh=5B&mip=58.248.106.93&mm=28&mn=sn-j5o7dn7s&ms=nvh&mt=1696914999&mv=m&mvi=3&pl=21&rmhost=r4---sn-j5o7dn7s.gvt1.com&shardbypass=sd&smhost=r4---sn-j5o7dn7z.gvt1.com' && \
        tar xvf android_studio.tgz && \
        rm android_studio.tgz
USER $USER_ID
WORKDIR $HOME

# IDEA
USER 0
ENV IDEA_FILE=ideaIU-2019.3.5-jbr8.tar.gz
COPY $IDEA_FILE $HOME/
RUN tar xzf $HOME/$IDEA_FILE -C /opt/
RUN rm $HOME/$IDEA_FILE
USER $USER_ID

# LayoutMaster
ENV LAYOUTMASTER_PLUGIN=LayoutMaster-1.0.8.zip
ENV LAYOUTMASTER_SOURCE=LayoutMaster-1.0.0.zip
COPY $LAYOUTMASTER_PLUGIN $HOME
COPY $LAYOUTMASTER_SOURCE $HOME

# Native code
# USER $USER_ID
# WORKDIR $HOME
# RUN wget https://download.jetbrains.com/cpp/CLion-2022.3.tar.gz
# USER 0
# RUN tar xzf CLion-*.tar.gz -C /opt/ \
        # && rm CLion-*.tar.gz
# RUN apt update && apt install -y cmake gcc g++ clang
# RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*
# USER $USER_ID

USER 0
RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*
USER $USER_ID


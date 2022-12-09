FROM consol/ubuntu-xfce-vnc:latest

LABEL maintainer Niko "aug3073911@outlook.com"

ENV REFRESHED_AT 2022-10-24

ENV VNC_RESOLUTION 1920x1080
ENV VNC_PW ppllmmoo

# Switch to root user to install pakcages
USER 0

RUN set -x; \
        apt update \
        && apt -y upgrade

RUN apt install -y software-properties-common sudo

# JDK
RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk

# Android Studio
RUN add-apt-repository -y ppa:maarten-fonville/android-studio \
        && apt update \
        && apt install -y android-studio

# Apt clean
RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Back to normal
USER 1000

ENV HOME=/headless

WORKDIR $HOME

# Set workspace size
# RUN echo 'xfconf-query -c xfwm4 -p /general/workspace_count -s 1' >> ~/.bashrc

# Set wallpaper
RUN rm -rf $HOME/.config/bg_sakuli.png
ADD wallpaper_ballon.png $HOME/.config/bg_sakuli.png
# RUN echo 'xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVNC-0/workspace0/last-image --set ~/.config/wallpaper_ballon.jpg' >> ~/.bashrc

USER 0

# Set Theme
ENV THEME_FILE=os-catalina-xfce-4.16.tar.xz
ENV THEME_FILE_EXTRACTED=Os-Catalina-XFCE-4.16
ENV THEME_DIR=.themes
# ENV THEME_SETTINGS=$HOME/.config/xfce4/xfconf/xfce-prechannel-xml/xsettings.xml
ENV THEME_SETTINGS=/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
ENV THEME_OLD=Default
ENV THEME_NEW=Os-Catalina-XFCE-4.16
RUN mkdir $THEME_DIR
COPY $THEME_FILE $HOME/
RUN tar xf $HOME/$THEME_FILE -C $THEME_DIR && rm $HOME/$THEME_FILE
RUN sed -i "s/Greybird/Os-Catalina-XFCE-4.16/" $THEME_SETTINGS

USER 1000

USER 0

# IDEA
ENV IDEA_FILE=ideaIU-2019.3.5-jbr8.tar.gz
COPY $IDEA_FILE $HOME/
RUN tar xzf $HOME/$IDEA_FILE -C /opt/
RUN rm $HOME/$IDEA_FILE

USER 1000

USER 0

RUN add-apt-repository ppa:nilarimogard/webupd8 && apt update \
    && apt -y install android-tools-adb android-tools-fastboot
RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

USER 1000

# LayoutMaster
ENV LAYOUTMASTER_PLUGIN=LayoutMaster-1.0.8.zip
ENV LAYOUTMASTER_SOURCE=LayoutMaster-1.0.0.zip
COPY $LAYOUTMASTER_PLUGIN $HOME
COPY $LAYOUTMASTER_SOURCE $HOME

# Native code
USER 1000
WORKDIR $HOME
RUN wget https://download.jetbrains.com/cpp/CLion-2022.3.tar.gz
USER 0
RUN tar xzf CLion-*.tar.gz -C /opt/ \
        && rm CLion-*.tar.gz
RUN apt update && apt install -y cmake gcc g++ clang
RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*
USER 1000


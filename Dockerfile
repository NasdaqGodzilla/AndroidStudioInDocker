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

RUN apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk

RUN add-apt-repository -y ppa:maarten-fonville/android-studio \
        && apt update \
        && apt install -y android-studio

RUN apt autoremove --purge -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Back to normal
USER 1000


# Credit to https://github.com/rroemhild/docker-errbot/ for some ideas

FROM ubuntu:xenial

MAINTAINER Alex Sheluchin <alex.sheluchin@gmail.com>

ENV WEB_USER web
ENV DEBIAN_FRONTEND noninteractive
ENV PATH app/env/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN useradd -Um -s /bin/bash $WEB_USER

RUN apt-get -q update \
    && apt-get -q -y install --no-install-recommends \
        apt-utils \
        build-essential \
        curl \
        libfontconfig \
        libffi-dev \
        libssl-dev \
        libssl-dev \
        locales \
        python-dev \
        python-pip \
        python-virtualenv \
        python3-pip \
        python3.5 \
        python3.5-dev \
    && apt-get -q update \
    && pip3 install virtualenv \
    && pip3 install -U setuptools \
        && rm -rf /var/lib/apt/lists/*

USER $WEB_USER
WORKDIR /home/$WEB_USER/
RUN mkdir -p app/data/ app/plugins \
     && chown -vR $WEB_USER: app

COPY requirements.txt app/requirements.txt

RUN virtualenv app/env
RUN . app/env/bin/activate; pip install --no-cache-dir -r app/requirements.txt

COPY config.py app/config.py

EXPOSE 3141 3142
CMD ["app/env/bin/errbot", "-c", "app/config.py"]

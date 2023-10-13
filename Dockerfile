# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04 AS base

# export timezone - for python3.9-dev install
ENV TZ=Europe/London
ENV DEBIAN_FRONTEND=noninteractive

# place timezone data /etc/timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/t

# Update the package list and install things
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git curl ansible sudo vim && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean autoclean && \
    apt-get autoremove --yes


FROM base AS t
ARG TAGS
RUN addgroup --gid 1000 t
RUN adduser --gecos t --uid 1000 --gid 1000 --disabled-password t
USER t
WORKDIR /home/t

COPY . .

RUN chmod +x setupEnv.sh && chmod +x nvim.sh && chmod +x zsh.sh && chmod +x dotfiles.sh && chmod +x dotfiles-clone.sh
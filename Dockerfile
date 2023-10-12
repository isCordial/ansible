# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# export timezone - for python3.9-dev install
ENV TZ=Europe/London

# place timezone data /etc/timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/tester

# Update the package list and install things
RUN apt-get update && \
    apt-get install -y git curl ansible sudo vim && \
    rm -rf /var/lib/apt/lists/*

# Create a new user named "tester" and add them to the sudo group without a password prompt
# RUN useradd -m -s /bin/bash tester && \
#     mkdir -p /etc/sudoers.d && \
#     echo "tester ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/tester && \
#     chmod 0440 /etc/sudoers.d/tester

# Set the HOME environment variable for the "tester" user

# Switch to the new user
# USER tester

# Set the working directory to the user's home directory
# WORKDIR /home/tester

COPY setupEnv.sh nvim.sh zsh.sh dotfiles.sh dotfiles-clone.sh /

RUN chmod +x setupEnv.sh && chmod +x nvim.sh && chmod +x zsh.sh && chmod +x dotfiles.sh && chmod +x dotfiles-clone.sh

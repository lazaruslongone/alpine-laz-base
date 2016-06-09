FROM lazaruslongone/alpine-openrc-base:latest
MAINTAINER lazaruslongone

# non-root user
RUN adduser -G abuild -g "alpiner" -s /bin/bash -D alpiner
RUN apk update && apk add sudo && \
    echo "alpiner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install openrc
RUN apk update && \
  apk add openssh bash \
  vim rsync git curl coreutils \
  gawk sed grep bc go

USER alpiner
RUN echo "source /etc/profile" > /home/alpiner/.bashrc
WORKDIR /home/alpiner

ENTRYPOINT ["/bin/bash"]

FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:21-jre-jammy

LABEL author="sora-skylab" \
      maintainer="soraskylab@gmail.com" \
      org.opencontainers.image.source="https://github.com/skylabnetwork/Docker-Images" \
      org.opencontainers.image.licenses=MIT

# Update package lists and install required packages
RUN apt-get update -y \
    && apt-get install -y iproute2 tzdata \
    && ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Copy entrypoint script
COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]

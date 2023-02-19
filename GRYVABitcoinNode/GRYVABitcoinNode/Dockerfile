FROM debian:stable-slim

ARG TargetEnvironmentType
ARG Version="0.2.2"
LABEL maintainer "marius.goecke@gmail.com"
LABEL version="v$Version"
LABEL description="GRYVABitcoinNode is a docker-image for simply running a bitcoin-node in a docker-container."

ENV bitcoinversion="22.0"
RUN mkdir /Workspace
RUN mkdir /Workspace/Program
RUN mkdir /Workspace/Data
WORKDIR /Workspace

RUN apt update
RUN apt install -y wget

RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/*

COPY ./GRYVABitcoinNode/EntryPointScript.sh /Workspace/Program/EntryPointScript.sh
RUN chmod +x /Workspace/Program/EntryPointScript.sh

WORKDIR /Workspace/Program
ENTRYPOINT ["/Workspace/Program/EntryPointScript.sh"]

FROM debian:stable-slim as builder

ARG TargetEnvironmentType
ARG Version="0.2.6"
ENV bitcoinversion="22.0"
LABEL maintainer "marius.goecke@gmail.com"
LABEL version="v$Version"
LABEL description="GRYVABitcoinNode is a docker-image for simply running a bitcoin-node in a docker-container."

RUN mkdir /Workspace && \
    mkdir /Workspace/Program && \
    mkdir /Workspace/Data && \
    mkdir /Workspace/Temp && \
    mkdir /Workspace/Logs && \
    apt update && \
    apt install -y wget
WORKDIR /Workspace/Temp
RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz &&\
    tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz && \
    install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/* && \
    rm bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
COPY ./GRYVABitcoinNode/EntryPointScript.sh /Workspace/Program/EntryPointScript.sh
RUN chmod +x /Workspace/Program/EntryPointScript.sh && \
    rm -rf /Workspace/Temp && \
    apt-get clean

FROM debian:stable-slim
COPY --from=builder / /
WORKDIR /Workspace/Program
ENTRYPOINT ["/Workspace/Program/EntryPointScript.sh"]

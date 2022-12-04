FROM debian:stable-slim

LABEL maintainer "marius.goecke@gmail.com"
LABEL version="$Version"
LABEL description="GRYVABitcoinNode is a docker-image for simply running a bitcoin-node in a docker-container."
ARG TargetEnvironmentType
ARG Version="0.2.1"

ENV bitcoinversion="22.0"
RUN mkdir /Workspace
RUN mkdir /Workspace/Program
WORKDIR /Workspace

RUN apt update
RUN apt install -y git wget

RUN git clone --depth 1 --single-branch --branch main https://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/Other/OtherScripts

RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/*

COPY ./EntryPointScript.sh /Workspace/Program/EntryPointScript.sh
RUN chmod +x /Workspace/Program/EntryPointScript.sh

RUN /Workspace/ScriptCollection/Other/OtherScripts/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$TargetEnvironmentType" "/Workspace/ScriptCollection" "" "/Workspace/ScriptCollection"

WORKDIR /Workspace/Program
ENTRYPOINT ["/Workspace/Program/EntryPointScript.sh"]

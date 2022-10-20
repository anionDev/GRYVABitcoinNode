FROM debian:stable-slim

ARG EnvironmentStage="QualityCheck"
ARG Version="0.1.0"

LABEL version="$Version"
LABEL description="Represents a Bitcoin-Node."

ENV bitcoinversion="22.0"

RUN mkdir /Workspace
RUN mkdir /Workspace/App
WORKDIR /Workspace

RUN apt update
RUN apt install -y git wget

RUN git clone --depth 1 --single-branch --branch main https://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/OtherScripts

RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/*

COPY ./EntryPointScript.sh /Workspace/App/EntryPointScript.sh
RUN chmod +x /Workspace/App/EntryPointScript.sh

RUN /Workspace/ScriptCollection/OtherScripts/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace/ScriptCollection"

WORKDIR /Workspace/App
ENTRYPOINT ["/Workspace/App/EntryPointScript.sh"]

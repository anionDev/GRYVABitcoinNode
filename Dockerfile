FROM debian:stable-slim

ARG EnvironmentStage

ENV bitcoinversion=0.21.1

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apt update
RUN apt install -y git wget

RUN git clone --single-branch --branch main git://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/Other

RUN /Workspace/ScriptCollection/Other/ServerMaintenance/Debian/Common/CreateUser.sh "user" "/userhome" "false" "" "false" "false"

RUN mkdir /Data

RUN mkdir /App
WORKDIR /App

RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/*
# TODO install application

COPY ./EntryPointScript.sh /App/EntryPointScript.sh
RUN chmod +x /App/EntryPointScript.sh
RUN chown -R user /App
RUN chown -R user /Data

RUN /Workspace/ScriptCollection/Other/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace"

USER user
WORKDIR /Data

ENTRYPOINT ["/App/EntryPointScript.sh"]

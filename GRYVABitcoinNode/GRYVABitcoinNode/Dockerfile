FROM debian:stable-slim

ARG EnvironmentStage="QualityCheck"
ARG Version="0.1.0"

LABEL version="$Version"
LABEL description="Represents a Bitcoin-Node."

ENV bitcoinversion="22.0"

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apt update
RUN apt install -y git wget

RUN git clone --depth 1 --single-branch --branch main https://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/OtherScripts

RUN ./ScriptCollection/OtherScripts/ServerMaintenance/Debian/Common/CreateUser.sh "user" "/Workspace/userhome" "false" "" "false" "false"

RUN mkdir /Data

RUN mkdir /App
WORKDIR /App

RUN wget https://bitcoin.org/bin/bitcoin-core-$bitcoinversion/bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-$bitcoinversion-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$bitcoinversion/bin/*


COPY ./EntryPointScript.sh /App/EntryPointScript.sh
RUN chmod +x /App/EntryPointScript.sh
RUN chown -R user /App
RUN chown -R user /Data

RUN /Workspace/ScriptCollection/OtherScripts/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace/ScriptCollection"

USER user
WORKDIR /Data

ENTRYPOINT ["/App/EntryPointScript.sh"]

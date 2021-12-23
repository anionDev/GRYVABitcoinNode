FROM debian:stable-slim

ARG EnvironmentStage
ARG ApplicationVersion=0.21.1

RUN apt update
RUN apt install -y git wget

RUN mkdir /Content

RUN git clone --depth 1 --single-branch --branch main git://github.com/anionDev/ScriptCollection.git /Content/ScriptCollection
RUN chmod -R +x /Content/ScriptCollection/Other

RUN mkdir /Content/Data

RUN /Content/ScriptCollection/Other/ServerMaintenance/Debian/Common/CreateUser.sh "user" "/Content/Data" "false" "" "false" "false"

RUN mkdir /Content/App
WORKDIR /Content/App

RUN wget https://bitcoincore.org/bin/bitcoin-core-${ApplicationVersion}/bitcoin-${ApplicationVersion}-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-${ApplicationVersion}-x86_64-linux-gnu.tar.gz
RUN rm bitcoin-${ApplicationVersion}-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -t /usr/local/bin bitcoin-${ApplicationVersion}/bin/*

COPY ./EntryPointScript.sh /Content/App/EntryPointScript.sh
RUN chmod +x /Content/App/EntryPointScript.sh
RUN chown -R user /Content

RUN /Content/ScriptCollection/Other/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$EnvironmentStage" "/Content/ScriptCollection" "" "/Content/ScriptCollection"

USER user

ENTRYPOINT ["./EntryPointScript.sh"]

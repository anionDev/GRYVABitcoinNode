FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG EnvironmentStage

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apk --no-cache add --update git bash

RUN git clone --single-branch --branch development git://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/Other

RUN ./ScriptCollection/Other/ServerMaintenance/Alpine/Other/BitcoinInstall.sh

RUN ./ScriptCollection/Other/ServerMaintenance/Alpine/Common/CreateUser.sh "user" "/userhome" "false" "" "false" "false"

RUN mkdir -p /userhome
RUN chown -R user:1000 /userhome

RUN ./ScriptCollection/Other/ServerMaintenance/Alpine/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace"

USER user
WORKDIR /userhome

ENTRYPOINT ["bitcoind"]

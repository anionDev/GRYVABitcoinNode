FROM debian:stable-slim

ARG EnvironmentStage

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apt update
RUN apt install -y git openjdk-17-jre wget

RUN git clone --single-branch --branch main git://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/Other

RUN /Workspace/ScriptCollection/Other/ServerMaintenance/Debian/Common/CreateUser.sh "user" "/userhome" "false" "" "false" "false"

RUN mkdir /Data

RUN mkdir /App
WORKDIR /App

# TODO install application

COPY ./EntryPointScript.sh /App/EntryPointScript.sh
RUN chmod +x /App/EntryPointScript.sh
RUN chown -R user /App
RUN chown -R user /Data

RUN /Workspace/ScriptCollection/Other/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace"

USER user
WORKDIR /Data

ENTRYPOINT ["/App/EntryPointScript.sh"]

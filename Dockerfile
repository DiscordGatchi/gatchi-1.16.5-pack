FROM itzg/minecraft-server

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.18.2
ENV MEMORY=4G
EXPOSE 25565

RUN curl -L https://api.github.com/repos/DiscordGatchi/the-gatchi-pack/releases/latest -o latest-release-data.json
RUN cat latest-release-data.json | jq -r '.assets[] | select(.name | contains("server.zip")) | .browser_download_url' > latest-release-url.txt
RUN curl -L $(cat latest-release-url.txt) -o /data/server.zip

RUN unzip /data/server.zip -d /
RUN mv /server /data

RUN rm /data/server.zip
RUN rm latest-release-url.txt
RUN rm latest-release-data.json

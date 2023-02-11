FROM itzg/minecraft-server

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.18.2
ENV MEMORY=4G
EXPOSE 25565

RUN curl -L https://api.github.com/repos/DiscordGatchi/the-gatchi-pack/releases/latest -o /release-data.json
RUN cat /release-data.json
RUN cat /release-data.json | jq -r '.assets[] | select(.name | contains("server.zip")) | .browser_download_url' > /release-url.txt
RUN cat /release-url.txt
RUN curl -L $(cat /release-url.txt) -o /server.zip

RUN unzip /server.zip -d /

RUN ls -la /server

RUN mv /server /data

RUN ls -la /data

RUN rm /server.zip
RUN rm /latest-release-url.txt
RUN rm /latest-release-data.json
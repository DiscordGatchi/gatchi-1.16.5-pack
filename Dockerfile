FROM itzg/minecraft-server

ENV EULA=TRUE
ENV TYPE=FABRIC
ENV VERSION=1.18.2
ENV MEMORY=4G

RUN curl -L releases/1.18.2.zip -o /data/servermods.zip && \
    unzip /data/servermods.zip -d /data/servermods && \
    rm /data/servermods.zip
FROM openjdk:21

COPY files/dc-server /opt/dc-server

ARG arg_memxmx='1024m'
ARG arg_ip='127.0.0.1'
ARG arg_port='9000'
ARG arg_imageserverport='9001'
ARG arg_webserverport='8080'
ARG arg_credentials='SA'

ENV XMX=$arg_memxmx
ENV IP=$arg_ip
ENV PORT=$arg_port
ENV IMAGESERVERPORT=$arg_imageserverport
ENV WEBSERVERPORT=$arg_webserverport
ENV CREDENTIALS=$arg_credentials

WORKDIR /opt/dc-server

CMD java -Xmx$XMX -jar /opt/dc-server/datacrow-server.jar -ip:$IP -userdir:/opt/dc-user -port:$PORT -imageserverport:$IMAGESERVERPORT -webserverport:$WEBSERVERPORT  -credentials:$CREDENTIALS

FROM v2fly/v2fly-core:latest

RUN apk add gettext
RUN apk add curl
RUN apk add jq

COPY config.json.tp /root/

ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

ENTRYPOINT /startup.sh


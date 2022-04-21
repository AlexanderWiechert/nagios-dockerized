FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

COPY scripts/install_nagios.sh .
RUN ./install_nagios.sh

COPY scripts/install_nagios_plugins.sh .
RUN ./install_nagios_plugins.sh

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD /bin/bash
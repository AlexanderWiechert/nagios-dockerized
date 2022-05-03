FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

COPY scripts/install_nagios.sh .
RUN ./install_nagios.sh

COPY scripts/install_nagios_plugins.sh .
RUN ./install_nagios_plugins.sh

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY nagios/ /usr/local/nagios/etc
RUN chown -R nagios:nagios /usr/local/nagios/

RUN apt-get -y autoremove && \
    apt-get -y clean  && \
    rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["entrypoint.sh"]

CMD /bin/bash
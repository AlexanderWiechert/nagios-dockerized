FROM ubuntu:mantic-20240427 as build

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

#WORKDIR /usr/local/nagios
COPY scripts/* /usr/local/bin/

RUN install_nagios.sh && \
    install_nagios_plugins.sh

COPY nagios/ /usr/local/nagios/etc
RUN chown -R nagios:nagios /usr/local/nagios/ && \
    apt-get -y autoremove && \
    apt-get -y clean  && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf nagios-4.4.7* && \
    rm -rf nagios-plugins-$NAGIOS_PLUGINS_VERSION*


#FROM ubuntu:latest as main
#COPY --from=build /usr/local/nagios /usr/local/nagios
#COPY scripts/entrypoint.sh /usr/local/bin/
CMD /bin/bash -x entrypoint.sh
#CMD /bin/bash

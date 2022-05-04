FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

COPY scripts/* usr/local/bin/

RUN install_nagios.sh && \
    install_nagios_plugins.sh

COPY nagios/ /usr/local/nagios/etc
RUN chown -R nagios:nagios /usr/local/nagios/ && \
    apt-get -y autoremove && \
    apt-get -y clean  && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf nagios-4.4.7* && \
    rm -rf nagios-plugins-$NAGIOS_PLUGINS_VERSION*


#ENTRYPOINT ["entrypoint.sh"]
#CMD ["entrypoint.sh"]
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
CMD /bin/bash -x entrypoint.sh
#CMD /bin/bash
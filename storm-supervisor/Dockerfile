ARG version
FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:$version
MAINTAINER jikeapp

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

ADD newrelic.jar /opt/newrelic.jar
ADD newrelic.yml /opt/newrelic.yml
ADD add_newrelic.sh /usr/bin/add_newrelic.sh
RUN chmod 777 /usr/bin/add_newrelic.sh
CMD /usr/bin/add_newrelic.sh

RUN chmod 777 /usr/bin/config-supervisord.sh
RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
RUN chmod 777 /usr/bin/start-supervisor.sh
CMD /usr/bin/start-supervisor.sh

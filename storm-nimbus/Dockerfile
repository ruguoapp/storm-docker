ARG version
FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:$version
MAINTAINER jikeapp

RUN /usr/bin/config-supervisord.sh nimbus
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773
ADD start-supervisor.sh /usr/bin/start-supervisor.sh
RUN chmod 777 /usr/bin/start-supervisor.sh
CMD /usr/bin/start-supervisor.sh
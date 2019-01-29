ARG version
FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:$version
MAINTAINER jikeapp
RUN chmod 777 /usr/bin/config-supervisord.sh
RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
RUN chmod 777 /usr/bin/start-supervisor.sh
CMD /usr/bin/start-supervisor.sh

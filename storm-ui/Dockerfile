FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:master-fix
MAINTAINER jikeapp
RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
CMD /usr/bin/start-supervisor.sh

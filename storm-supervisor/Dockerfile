FROM 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:master-2c7cf4a
MAINTAINER jikeapp

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
CMD /usr/bin/start-supervisor.sh





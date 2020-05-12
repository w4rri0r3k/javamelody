FROM anapsix/alpine-java:8_jdk_unlimited
MAINTAINER w4rri0r3k "w4rri0r3k@gmail.com"

ENV JM_VERSION 1.83.0

RUN apk --update add tzdata && \
  cp /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
  echo "Europe/Warsaw" >  /etc/timezone && \
  apk del tzdata && \
  rm -rf /var/cache/apk/*

VOLUME ["/tmp"]

ADD https://github.com/javamelody/javamelody/releases/download/javamelody-core-$JM_VERSION/javamelody-collector-server-$JM_VERSION.war /opt/jm/jm.war

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-server", "-Xmx512m", "-jar", "/opt/jm/jm.war"]

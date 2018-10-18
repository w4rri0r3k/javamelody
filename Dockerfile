FROM anapsix/alpine-java:8_jdk_unlimited
MAINTAINER w4rri0r3k "w4rri0r3k@gmail.com"

RUN apk --update add tzdata && \
  cp /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
  echo "Europe/Warsaw" >  /etc/timezone && \
  apk del tzdata && \
  rm -rf /var/cache/apk/*

VOLUME ["/tmp"]

ADD https://github.com/javamelody/javamelody/releases/download/javamelody-core-1.74.0/javamelody-collector-server-1.74.0.war /opt/jm/

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-server", "-Xmx512m", "-jar", "/opt/jm/javamelody-collector-server-1.74.0.war"]

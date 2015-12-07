FROM debian:wheezy

RUN apt-get update && apt-get install -y git autoconf automake libtool bzip2 curl g++ make \
 && git clone https://github.com/google/protobuf && cd /protobuf && git checkout tags/v2.6.1 -b v2.6.1 \
 && ./autogen.sh && ./configure --prefix=/usr && make && make check && make install \
 && mkdir /opt/protobuf-java && cd /opt/protobuf-java \
 && curl -O http://central.maven.org/maven2/com/google/protobuf/protobuf-java/2.6.1/protobuf-java-2.6.1.jar \
 && cd /opt \
 && curl -kLb "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz | tar xzf - \
 && apt-get remove -y autoconf automake libtool bzip2 curl g++ make \
 && rm -rf /var/lib/apt/lists/* /protobuf               \
    /opt/jdk1.7.0_79/*src.zip                           \
    /opt/jdk1.7.0_79/lib/missioncontrol                 \
    /opt/jdk1.7.0_79/lib/visualvm                       \
    /opt/jdk1.7.0_79/lib/*javafx*                       \
    /opt/jdk1.7.0_79/jre/lib/plugin.jar                 \
    /opt/jdk1.7.0_79/jre/lib/ext/jfxrt.jar              \
    /opt/jdk1.7.0_79/jre/bin/javaws                     \
    /opt/jdk1.7.0_79/jre/lib/javaws.jar                 \
    /opt/jdk1.7.0_79/jre/lib/desktop                    \
    /opt/jdk1.7.0_79/jre/plugin                         \
    /opt/jdk1.7.0_79/jre/lib/deploy*                    \
    /opt/jdk1.7.0_79/jre/lib/*javafx*                   \
    /opt/jdk1.7.0_79/jre/lib/*jfx*                      \
    /opt/jdk1.7.0_79/jre/lib/amd64/libdecora_sse.so     \
    /opt/jdk1.7.0_79/jre/lib/amd64/libprism_*.so        \
    /opt/jdk1.7.0_79/jre/lib/amd64/libfxplugins.so      \
    /opt/jdk1.7.0_79/jre/lib/amd64/libglass.so          \
    /opt/jdk1.7.0_79/jre/lib/amd64/libgstreamer-lite.so \
    /opt/jdk1.7.0_79/jre/lib/amd64/libjavafx*.so        \
    /opt/jdk1.7.0_79/jre/lib/amd64/libjfx*.so

ENV JAVA_HOME /opt/jdk1.7.0_79
ENV PATH      $PATH:$JAVA_HOME/bin

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "sh", "entrypoint.sh" ]

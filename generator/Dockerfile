FROM debian:wheezy

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y autoconf automake libtool bzip2 g++ make \
 && git clone https://github.com/google/protobuf && cd /protobuf \
 && git checkout tags/v2.6.1 -b v2.6.1                           \
 && ./autogen.sh && ./configure --prefix=/usr                    \
 && make && make check && make install                           \
 && apt-get remove -y autoconf automake libtool bzip2 g++ make   \
 && rm -rf /var/lib/apt/lists/* /protobuf

WORKDIR /usr/local

ENV JAVA_HOME /usr/local/jdk1.7.0_79

RUN curl -O http://central.maven.org/maven2/com/google/protobuf/protobuf-java/2.6.1/protobuf-java-2.6.1.jar \
 && curl -kLb "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz | tar xzf - \
 && rm -rf $JAVA_HOME/*src.zip                 \
 $JAVA_HOME/lib/missioncontrol                 \
 $JAVA_HOME/lib/visualvm                       \
 $JAVA_HOME/lib/*javafx*                       \
 $JAVA_HOME/jre/lib/plugin.jar                 \
 $JAVA_HOME/jre/lib/ext/jfxrt.jar              \
 $JAVA_HOME/jre/bin/javaws                     \
 $JAVA_HOME/jre/lib/javaws.jar                 \
 $JAVA_HOME/jre/lib/desktop                    \
 $JAVA_HOME/jre/plugin                         \
 $JAVA_HOME/jre/lib/deploy*                    \
 $JAVA_HOME/jre/lib/*javafx*                   \
 $JAVA_HOME/jre/lib/*jfx*                      \
 $JAVA_HOME/jre/lib/amd64/libdecora_sse.so     \
 $JAVA_HOME/jre/lib/amd64/libprism_*.so        \
 $JAVA_HOME/jre/lib/amd64/libfxplugins.so      \
 $JAVA_HOME/jre/lib/amd64/libglass.so          \
 $JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so \
 $JAVA_HOME/jre/lib/amd64/libjavafx*.so        \
 $JAVA_HOME/jre/lib/amd64/libjfx*.so

ENV GOPATH /usr/local/go/work
ENV PATH   $PATH:$JAVA_HOME/bin:/usr/local/go/bin:$GOPATH/bin

RUN curl -k https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz | tar xzf - \
 && go get -u github.com/golang/protobuf/protoc-gen-go \
 && go get -u github.com/golang/protobuf/proto


ADD entrypoint.sh /entrypoint.sh
WORKDIR /
ENTRYPOINT [ "sh", "entrypoint.sh" ]

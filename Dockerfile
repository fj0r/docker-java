FROM nnurphy/deb

ENV JAVA_VERSION=11 JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 \
    SCALA_HOME=/opt/scala SCALA_VERSION=2.13.0
ENV PATH=${SCALA_HOME}/bin:$PATH

RUN set -ex \
  ; apt-get update \
  ; apt-get -y --no-install-recommends install openjdk-${JAVA_VERSION}-jdk \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN set -ex \
  ; mkdir -p /usr/share/man/man1 \
  ; mkdir -p ${SCALA_HOME} \
  ; wget -q -O- https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz \
      | tar xzf - -C ${SCALA_HOME} --strip-components=1
  #; rm -rf ${HOME}/.cache/coursier/*

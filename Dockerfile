# syntax=docker/dockerfile:1
FROM debian:12-slim

ARG JDK_VERSION=7u80
ARG JDK_BUILD=b15
ARG JDK_HASH=d54c1d3a095b4ff2b6607d096fa80163
ARG JDK_ARCHIVE=jdk-${JDK_VERSION}-linux-x64.tar.gz
ARG JDK_URL=https://download.oracle.com/otn/java/jdk/${JDK_VERSION}-${JDK_BUILD}/${JDK_HASH}/${JDK_ARCHIVE}

ENV JAVA_HOME=/opt/java/jdk1.7.0_80
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        fontconfig \
        libxext6 \
        libxrender1 \
        libxtst6 \
        libxi6 \
        tar; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    mkdir -p /opt/java; \
    curl -fsSL --retry 5 --retry-delay 5 --header "Cookie: oraclelicense=accept-securebackup-cookie" "${JDK_URL}" -o /tmp/${JDK_ARCHIVE}; \
    tar -xzf /tmp/${JDK_ARCHIVE} -C /opt/java; \
    rm /tmp/${JDK_ARCHIVE}; \
    ln -sf ${JAVA_HOME}/bin/java /usr/local/bin/java; \
    ln -sf ${JAVA_HOME}/bin/javac /usr/local/bin/javac

RUN java -version

CMD ["/bin/bash"]

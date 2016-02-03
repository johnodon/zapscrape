FROM ubuntu:14.04

# Set correct environment variables
ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US.UTF-8

RUN [ "apt-get", "-q", "update" ]
RUN [ "apt-get", "-qy", "--force-yes", "upgrade" ]
RUN [ "apt-get", "-qy", "--force-yes", "dist-upgrade" ]
RUN [ "apt-get", "install", "-qy", "--force-yes", \
      "perl", \
      "build-essential", \
      "cpanminus" ]
RUN [ "apt-get", "clean" ]
RUN [ "rm", "-rf", "/var/lib/apt/lists/*", "/tmp/*", "/var/tmp/*" ]

RUN ["cpanm", "Proc::ProcessTable", "Data::Dumper" ]

COPY [ "./src/zap2xml.pl", "/app/zap2xml.pl" ]
RUN [ "chmod", "+x",  "/app/zap2xml.pl" ]


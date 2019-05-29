FROM pataquets/supervisor

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y python-pip \
  && \
  pip install mr.laforge && \
  pip install superlance && \
  pip install supervisor-quick && \
  pip install supervisor-serialrestart && \
  pip install supervisor-stdout && \
  pip install supervisor-wildcards && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get purge -y \
      binutils build-essential cpp cpp-4.8 \
      dpkg-dev fakeroot g++ g++-4.8 gcc gcc-4.8 \
      libalgorithm-diff-perl libalgorithm-diff-xs-perl \
      libalgorithm-merge-perl libasan0 libatomic1 \
      libc-dev-bin libc6-dev libcloog-isl4 libdpkg-perl \
      libfakeroot libfile-fcntllock-perl libgcc-4.8-dev \
      libgmp10 libgomp1 libisl10 libitm1 libmpc3 libmpfr4 \
      libquadmath0 libstdc++-4.8-dev libtimedate-perl \
      libtsan0 linux-libc-dev make manpages manpages-dev \
      patch python-chardet python-colorama python-distlib \
      python-html5lib python-pip python-requests \
      python-six python-urllib3 xz-utils \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD files/ /

RUN cat /etc/supervisor/plugin-* >> /etc/supervisor/supervisord.conf

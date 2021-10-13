FROM ubuntu:20.04
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y --no-install-recommends software-properties-common ca-certificates gnupg wget git
COPY install.sh /tmp
RUN /tmp/install.sh
WORKDIR /home/samples
RUN git clone https://github.com/oneapi-src/oneAPI-samples.git
RUN cp -r /opt/intel/oneapi/vpl/latest/examples .
RUN cp -r /opt/intel/oneapi/vpl/latest/bin .
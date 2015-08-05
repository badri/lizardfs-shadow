FROM      ubuntu:14.04
MAINTAINER Lakshmi Narasimhan <badri.dilbert@gmail.com>

RUN apt-get -y update

RUN apt-get -y install wget

RUN wget http://packages.lizardfs.com/lizardfs.key 
RUN apt-key add lizardfs.key

RUN echo "deb http://packages.lizardfs.com/ubuntu/trusty trusty main" > /etc/apt/sources.list.d/lizardfs.list
RUN echo "deb-src http://packages.lizardfs.com/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/lizardfs.list

RUN apt-get -y update

RUN apt-get -y install lizardfs-master

RUN mkdir -p /var/lib/mfs

RUN cp /var/lib/mfs/metadata.mfs.empty /var/lib/mfs/metadata.mfs

RUN cp /etc/mfs/mfsexports.cfg.dist /etc/mfs/mfsexports.cfg

RUN cp /etc/mfs/mfsmaster.cfg.dist /etc/mfs/mfsmaster.cfg

RUN sed -i 's/LIZARDFSMASTER_ENABLE=false/LIZARDFSMASTER_ENABLE=true/g'  /etc/default/lizardfs-master

RUN echo "PERSONALITY=shadow" >> /etc/mfs/mfsmaster.cfg

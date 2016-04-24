# Ubuntu 15.10 with Puppet 4

FROM ubuntu:15.10
MAINTAINER mihai.rotaru@gmx.com

# install puppet
RUN  apt-get update \
  && apt-get install -y wget \
  && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-wily.deb \
  && dpkg -i puppetlabs-release-pc1-wily.deb \
  && apt-get update \
  && apt-get install -y puppet-agent \
  && rm -rf /var/lib/apt/lists/* 

#ADD modules/ /etc/puppetlabs/code/modules
ADD site.pp /etc/puppetlabs/code
#ADD common.yaml /var/lib/hiera/common.yaml
#ADD common.yaml /etc/puppetlabs/code

#RUN ls -la /opt/puppetlabs
#RUN ls -la /etc/puppetlabs/puppet

RUN /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/site.pp --verbose --detailed-exitcodes || [ $? -eq 2 ]

#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../../Community/wildfly-9.0.2.Final
JBOSS_TGT_HOME=${PWD}/../temp-eap-7.0.0/jboss-eap-7.0

JBOSS_REMOTE_IP=127.0.0.1
JBOSS_REMOTE_PORT=8180
JBOSS_REMOTE_BINDING_NAME=eap7
JBOSS_REMOTE_PATH="/Test"
JBOSS_LOCAL_PATH="/ProxyTest"

$JBOSS_TGT_HOME/bin/jboss-cli.sh --connect <<EOF
batch
/socket-binding-group==standard-sockets/remote-destination-outbound-socket-binding=eap7/:add(host=${JBOSS_REMOTE_IP}, port=${JBOSS_REMOTE_PORT})
/subsystem=undertow/configuration=handler/reverse-proxy=myproxy:add
/subsystem=undertow/configuration=handler/reverse-proxy=myproxy/host=${JBOSS_REMOTE_IP}:add(outbound-socket-binding=eap7, scheme=http, instance-id=lbroute, path=/Test)
/subsystem=undertow/server=default-server/host=default-host/location=\/ProxyTest:add(handler=myproxy)
##
## add dump of HTTP Traffic
##
/subsystem=undertow/configuration=filter/custom-filter=request-logging-filter:add(class-name=io.undertow.server.handlers.RequestDumpingHandler, module=io.undertow.core)
/subsystem=undertow/server=default-server/host=default-host/filter-ref=request-logging-filter:add
run-batch
exit
EOF


#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../../Community/wildfly-10.1.0.Final
IP=127.0.0.1
OFFSET="-Djboss.socket.binding.port-offset=100"
OFFSET=""

#$JBOSS_TGT_HOME/bin/add-user.sh admin password\$1
#ls $JBOSS_TGT_HOME/standalone/configuration

$JBOSS_TGT_HOME/bin/standalone.sh -b=$IP $OFFSET

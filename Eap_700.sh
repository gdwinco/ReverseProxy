#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../jboss-eap-7.0
IP=127.0.0.1
OFFSET=""
OFFSET="-Djboss.socket.binding.port-offset=100"

#$JBOSS_TGT_HOME/bin/add-user.sh admin password\$1
#ls $JBOSS_TGT_HOME/standalone/configuration

$JBOSS_TGT_HOME/bin/standalone.sh -b=$IP $OFFSET

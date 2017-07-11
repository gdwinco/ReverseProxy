#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../temp-eap-7.0.0/jboss-eap-7.0
JBOSS_REMOTE_IP=127.0.0.1

# -- automate all in future, for now submite 1 by 1
#UPGRADE_01=${PWD}/eap_updates/jboss-eap-7.0.1-patch.zip
#UPGRADE_02=${PWD}/eap_updates/jboss-eap-7.0.2-patch.zip
#UPGRADE_03=${PWD}/eap_updates/jboss-eap-7.0.3-patch.zip

# just need to rollback enough for failure
COUNT=3

PATCH=jboss-eap-7.0.3.CP

echo --- $PATCH
  $JBOSS_TGT_HOME/bin/jboss-cli.sh <<EOF
#  batch
#
  connect
  patch info
  patch rollback ${PATCH} --reset-configuration=TRUE
  shutdown --restart=true
#
#  run-batch
  exit
  EOF

#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../../Community/wildfly-9.0.2.Final
JBOSS_TGT_HOME=${PWD}/jboss-eap-7.0

$JBOSS_TGT_HOME/bin/add-user.sh admin password\$1

ls $JBOSS_TGT_HOME/standalone/configuration


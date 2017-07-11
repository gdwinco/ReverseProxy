# ReverseProxy

Description: This project contains some scripts for setting up and configuring Undertow as a Reverse Proxy.

The general usage is:
./Eap_700.sh // starts the EAP App Server which hosts your simple web app. Code is provided or you can pick your own app. Assumption is that the URL is: {server:8180}/Test

./{RP_-your choice}.sh // this will be your target for requests. URL is: {server:8080}/ProxyTest

./CVE2016-7046_V2.0.sh 230 // generate fault on Reverse Proxy

Base - contains the scripts for running the demonstration.

AddMgmtUser.sh - adds a default user. Useful if you unzip a new version of the server to start over.

CVE2016-7046_V2.0.sh - used to generate Curl payloads.
Usage: ./CVE2016-7046_V2.0.sh {number}, where number is used to create a long URL. Use 1 for short messages. User 230 to generate a URL which breaks the reverse proxy.

ConfigReverseProxy - use this to add the reverse proxy configuration to Wildfly or EAP

RP_Wildfly_902.sh - use this to run the Reverse Proxy Wildfly 9.0.2 code. Convenience as it points to this version.

RP_Wildfly_101.sh - Wildfly 10.1.0 Reverse Proxy

RP_EAP_703.sh -- This starts as EAP 7.0.0. You will need to upgrade to EAP 7.0.3

Assumptions: you have directories for 
wildfly
eap

PatchEAP7.sh {patch number 1,2,3} -- assumes you have patches (zip) stored in the eap_updates directory

Rollback.sh -- In case you want to rollback an update to move from EAP 7.0.3 to 7.0.2 for example


DIRECTORY:code - simple jsp, web.xml this is the target for the reverse proxy

DIRECTORY: eap_updates - this directory would contain your patches for EAP 7. You need to get these from the Red Hat Portal.

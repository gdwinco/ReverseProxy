#!/bin/bash

PROXY_HOST1=127.0.0.1
PROXY_PORT1=8080
URL1=ProxyTest/demo.jsp

HOST2=127.0.0.1
PORT2=8180
URL2=Test/demo.jsp

PORT3=8888
PORT4=9999

# - Widlfly10 call
W_HOST=${PROXY_HOST1}
W_PORT=${PROXY_PORT1}
W_BASE_URL=${URL1}

# - EAP7 call
E_HOST=${HOST2}
E_PORT=${PORT2}
E_BASE_URL=${URL2}

#LONG_URL=WELCOME='language=en%0A%0A%3Chtml%3E%3Cscript%3Ealert("Your Hacked!!!")%3C/script%3E%3Cbody%3E%3Ch1%3EWelcome!%3C/h1%3E%3C/body%3E%3C/html%3E%3C!'
LONG_URL='WELCOME=lanaguage=en%0A%0AContent-length%3A%205'
#LONG_URL='WELCOME=lanaguage=en'

MORE=%26abcdefghijklmnopqursuvwxyz123456789=abcdefghijklmnopqursuvwxyz123456789
REALLY_LONG_URL=${LONG_URL}${MORE}${MORE}${MORE}${MORE}${MORE}

XXX=${LONG_URL}

echo "+++++++++++++++++"
echo TARGE URL: ${XXX}
echo "+++++++++++++++++"

COUNT=220

if [ -z "$1" ]
  then
    echo "No argument supplied, using $COUNT "
else
    COUNT=$1
fi
    echo "COUNT is: " $COUNT

for i in $(seq 1 $COUNT)
do
    XXX+=${MORE}
done
echo "+++++++++++++++++"
echo "+++++++++++++++++"

W_FULL_URL=http://${W_HOST}:${W_PORT}/${W_BASE_URL}?${LONG_URL}
W_PROXY_FULL_URL=http://${W_HOST}:${PORT3}/${W_BASE_URL}?${LONG_URL}
W_FULL_URL=http://${W_HOST}:${W_PORT}/${W_BASE_URL}?${XXX}
#W_PROXY_FULL_URL=http://${W_HOST}:${PORT3}/ProxyTest?${REALLY_LONG_URL}
#W_PROXY_FULL_URL=http://${W_HOST}:${W_PORT}/ProxyTest?${XXX}

E_FULL_URL=http://${E_HOST}:${E_PORT}/${E_BASE_URL}?${LONG_URL}
E_PROXY_FULL_URL=http://${E_HOST}:${PORT4}/${E_BASE_URL}?${REALLY_LONG_URL}

FULL_URL=${W_FULL_URL}

echo "************************************************************"
echo "**************************** BEGIN *************************"
echo "************************************************************"
echo ${FULL_URL}

#curl -X GET ${FULL_URL}
time curl -vi ${FULL_URL}

echo "************************************************************"
echo "**************************** END ***************************"
echo "************************************************************"

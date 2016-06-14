#!/bin/bash

if [ $# -eq 0 ]; then
        echo "use deploy_nginx.sh [release_number]"
        exit 1
else
        if [ $# -gt 1 ]; then
        echo "use deploy_nginx.sh [release_number]"
        exit 1
        fi
fi


RLD=/home/cti/distr/tveapp/$1
NXD=/var/spool/nginx/

TVEVERSION=$1
echo "The tve-version you entered is: $TVEVERSION"
PATHTOTVEBUNDLE1=/home/cti/distr/tveapp/$TVEVERSION
PATHTOTVEBUNDLE2=http://172.20.1.1/tve-builds/$TVEVERSION/build/iptvmw-$TVEVERSION-full.zip
PATHTOTVEBUNDLE3=/opt/jboss/server/default/deploy/iptvmw
mkdir /home/cti/distr/tveapp/$TVEVERSION
echo "Downloading $TVEVERSION from 172.20.1.1.... to $PATHTOTVEBUNDLE1"
wget -P $PATHTOTVEBUNDLE1 $PATHTOTVEBUNDLE2

unzip $PATHTOTVEBUNDLE1/* -d $PATHTOTVEBUNDLE1

rm -rf $PATHTOTVEBUNDLE1/iptvmw-$TVEVERSION-full.zip $PATHTOTVEBUNDLE1/tve-suboperator-web.war rm -rf $PATHTOTVEBUNDLE1/tvestat.ear rm -rf $PATHTOTVEBUNDLE1/stat-app.ear

/etc/init.d/jboss stop
sleep 60
killall nginx
cp $PATHTOTVEBUNDLE3 /home/cti/backup/
rm -rf $PATHTOTVEBUNDLE3/*
cp /home/cti/distr/tveapp/$TVEVERSION/* $PATHTOTVEBUNDLE3/



        if [ ! -d $RLD ]; then
                echo "Cannot find "$RLD" ! Exiting."
                exit 1
        fi

echo -n "Removing old applications ..."
rm -rf $NXD/portal* $NXD/theme-ng-new $NXD/tve-service-chat $NXD/tve-service-news $NXD/tve-service-weather
echo "............................ done."

echo -n "Removing nginx cache ..."
rm -rf /var/cache/nginx/*
echo "............................ done."


echo -n "Coping new applications ..."
cp $RLD/portal-ng.war $NXD
cp $RLD/portal-pc-ng.war $NXD
cp $RLD/themes-ng-ear.ear $NXD
cp $RLD/tve-service-chat-app.ear $NXD
cp $RLD/tve-service-news-app.ear $NXD
cp $RLD/tve-service-weather-app.ear $NXD
echo ".............................. done."

echo -n "Unzipping new applications ..."
unzip -q $NXD/portal-ng.war -d $NXD/portal-ng
unzip -q $NXD/portal-pc-ng.war -d $NXD/portal-pc-ng
unzip -qo $NXD/themes-ng-ear.ear -d $NXD/themes-ng-ear
unzip -qo $NXD/themes-ng-ear/theme-ng-new.war -d $NXD/theme-ng-new
unzip -qo $NXD/tve-service-chat-app.ear -d $NXD/tve-service-chat-app
unzip -qo $NXD/tve-service-chat-app/tve-service-chat-webapp.war -d $NXD/tve-service-chat
unzip -qo $NXD/tve-service-news-app.ear -d $NXD/tve-service-news-app
unzip -qo $NXD/tve-service-news-app/tve-service-news-webapp.war -d $NXD/tve-service-news
unzip -qo $NXD/tve-service-weather-app.ear -d $NXD/tve-service-weather-app
unzip -qo $NXD/tve-service-weather-app/tve-service-weather-webapp.war -d $NXD/tve-service-weather
echo "........................... done."


echo -n "Removing shit ..."
rm -rf $NXD/META-INF $NXD/*.ear $NXD/*.war $NXD/tve-service-chat-app $NXD/tve-service-news-app $NXD/tve-service-weather-app $NXD/themes-ng-ear
echo "........................................ done."

echo -n "Changing owner ..."
chown -R nginx:nginx $NXD
echo "....................................... done."

echo "Restarting NGINX ..."
/etc/init.d/nginx stop
sleep 5
/etc/init.d/nginx start
echo "NGINX are ready to serve. Have a nice time!"

/etc/init.d/jboss start

manifest=/opt/jboss/MANIFEST
echo "==========================================" >> $manifest
echo "TVEngine App Version = $1"  >> $manifest
echo "Last Change = `date`"  >> $manifest
echo "==========================================" >> $manifest
echo "Added update information in $manifest"

echo ========================================================================
echo "    Обновление закончено  Запускаю tail -f server.log"
echo ========================================================================
tail -f /opt/jboss/server/default/log/server.log


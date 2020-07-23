#!/bin/sh
aozora=$1

export DISPLAY=:99
XVFB=/usr/bin/Xvfb
XVFBARGS="$DISPLAY -ac -screen 0 1024x768x16 +extension RANDR"
PIDFILE=/var/xvfb_${DISPLAY}.pid

/sbin/start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
sleep 1

cd /app/AozoraEpub3
java -cp AozoraEpub3.jar AozoraEpub3 -of /work/$aozora
cd /work
/app/kindlegen $(basename $aozora .zip).epub

/sbin/start-stop-daemon --stop --quiet --pidfile $PIDFILE

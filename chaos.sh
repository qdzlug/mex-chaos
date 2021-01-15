#!/bin/bash

# Build our file w/ the hostname
HOSTNAME=$(hostname)
cat /var/www/html/index.tmpl | sed "s/XXHOSTXX/$HOSTNAME/g" > /var/www/html/index.html

# Start the service when we start...
service nginx start

# This is the chaos loop....
while true; do
    # We want at least 5 minutes, plus a random time on top of that.
    SLEEP_INT=$(echo $(( $RANDOM % 60 + 1 )))
    let SLEEP_INT=$SLEEP_INT+300

    # Sleep for 30 seconds (nginx is down...)
    echo Will sleep for 30 seconds...
    sleep 30

    # Start the service
    service nginx start

    # Sleep for 30 seconds...
    echo Will sleep for $SLEEP_INT
    sleep $SLEEP_INT

    # Stop the service
    service nginx stop

done


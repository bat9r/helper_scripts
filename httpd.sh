#!/bin/bash
if ! pidof apache2 > /dev/null
then
   sudo service apache2 restart
else
   echo "All is well"
fi

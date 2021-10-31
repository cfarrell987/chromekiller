#!/bin/bash

#Identify the chrome pid if chrome is running. Clean up unwanted lines from grep.
processes=$(ps -ef | grep "chrome" | grep -v "grep" | grep -v "awk" | grep -v "chromekill" | awk '{print $2}')

echo $processes
#Check that $processes is not null
if test -z "$processes"

then 
	echo "Chrome is not Running"
	
else
	echo "Chrome is Running"
	
	#kills the chrome task
	pkill -f "Chrome"
	#Report Chrome restarted
	/usr/bin/printf "<result>TRUE</result>\n"
	sleep 2
	open /Applications/Google\ Chrome.app
fi 

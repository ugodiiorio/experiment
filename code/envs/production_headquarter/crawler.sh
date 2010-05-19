#!/bin/bash
if [ $1 -eq  ]; then
	echo "Pass the yaml file name on command line argument (ie. ./crawler.sh quixa.yml)"
else 
	echo @@@ $1 @@@
	echo "Starting ..."
	yml="/home/notroot/git/KTE/code/yamls/prov_1_sect_1_"$1
	cd /home/notroot/git/KTE/code/run_time/rake/tasks
	rake rc:restart
	cd /home/notroot/git/KTE/code/run_time/crawlers/script
	echo $yml
	ruby run.rb $yml
	echo "Finished!" */
fi 


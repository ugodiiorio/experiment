#!/bin/bash
if [ "$1" = "" ]; then
	echo "Pass the company yaml file name on command line argument (ie. ./crawler.sh quixa 7)"
else 
	if [ "$2" = "" ]; then
		echo "Pass the selenium rc number on command line argument (ie. ./crawler.sh quixa 7)"
		echo "conte=>1 - dialogo=>2 - directline=>3 - genertel=>4 - genialloyd=>5 - linear=>6 - quixa=>7 - zurich_connect=>8"
		else
			echo @@@ $1 @@@
			echo @@@ $2 @@@
			echo "Starting ..."
			yml="/home/notroot/git/KTE/code/yamls/prov_1_sect_1_"$1".yml"
			cd /home/notroot/git/KTE/code/rake/tasks
			selenium="rc"$2":restart"
			echo $selenium
			rake $selenium
			cd /home/notroot/git/KTE/code/run_time/crawlers/script
			echo $yml
			ruby run.rb $yml
			echo "Finished!" */
	fi
fi 


#!/bin/bash
if [ "$1" = "" ]; then
	echo "Pass the params on command line argument (ie. ./crawler2.sh quixa 2 7): param1 = company - param2 = sector - param3 = selenium instance"
else 
	if [ "$2" = "" ]; then
		echo "Pass the sector param on command line argument (ie. ./crawler2.sh quixa 2 7): param2 = sector - param3 = selenium instance"
		else
			if [ "$3" = "" ]; then
				echo "Pass the selenium rc number on command line argument (ie. ./crawler2.sh quixa 2 7): param3 = selenium instance"
				echo "conte=>1 - dialogo=>2 - directline=>3 - genertel=>4 - genialloyd=>5 - linear=>6 - quixa=>7 - zurich_connect=>8"
			else
				echo @@@ $1 @@@
				echo @@@ $2 @@@
				echo @@@ $3 @@@
				echo "Starting ..."
				yml="/home/notroot/git/KTE/code/yamls/prov_2_sect_"$2"_"$1".yml"
				cd /home/notroot/git/KTE/code/rake/tasks
				selenium="rc"$3":restart"
				echo $selenium
				rake $selenium
				cd /home/notroot/git/KTE/code/run_time/crawlers/script
				echo $yml
				ruby run.rb $yml
				echo "Finished!" */
			fi
	fi
fi 


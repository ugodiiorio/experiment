#!/bin/bash
if [ $1 -eq  ]; then
	echo "Pass the run type code on command line argument (ie. ./quixa.sh day|night)"
else 
	#cd /home/notroot/git/KTE/code/run_time/rake/tasks
	#rake rcgenertel:restart
	cd /home/notroot/git/KTE/code/yamls_TW/$1
	ruby /home/notroot/git/KTE/code/run_time/crawlers/script/run.rb prov_1_sect_1_genertel.yml
fi


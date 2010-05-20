#!/bin/bash
if [ $1 -eq  ]; then
	echo "Pass the run type code on command line argument (ie. ./quixa.sh day|night)"
else 
	#cd /home/test/kte/run_time/rake/tasks
	#rake rcgenialloyd:restart
	cd /home/test/kte/yamls/$1
	ruby /home/test/kte/run_time/crawlers/script/run.rb prov_1_sect_1_genialloyd.yml
fi


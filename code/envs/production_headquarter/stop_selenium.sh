#!/bin/bash
cd /home/test/kte/run_time/rake/tasks
if [ "$1" = "all" ]; then
	rake rc:stop
	rake rcquixacase:stop
	rake rcdirectline:stop
	rake rcgenialloyd:stop
	rake rcquixa:stop
	rake rcconte:stop
	rake rcgenertel:stop
	rake rclinear:stop
	rake rcdialogo:stop
	rake rczurich:stop
else 
	rake rc$1:stop
fi


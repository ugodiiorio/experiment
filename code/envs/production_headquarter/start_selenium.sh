#!/bin/bash
cd /home/notroot/git/KTE/code/run_time/rake/tasks
if [ "$1" = "all" ]; then
	rake rc:start
	rake rcquixacase:start
	rake rcdirectline:start
	rake rcgenialloyd:start
	rake rcquixa:start
	rake rcconte:start
	rake rcgenertel:start
	rake rclinear:start
	rake rcdialogo:start
	rake rczurich:start
else 
	rake rc$1:start
fi


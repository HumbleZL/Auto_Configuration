#!/bin/bash

# =============== log module ===============
log_path="log/"
function build_logerr() {
	echo "\033[31m [ERROR] $1 \033[0m" > $(tty)
}
function build_loginfo() {
	echo "\033[32m [INFO] $1 \033[0m" > $(tty)
}
function build_logwarn() {
	echo "\033[33m [WARN] $1 \033[0m" > $(tty)
}

redirect_fd() {
	if [ $1 ]
	then
		if [ ! -d $log_path ]; then 
			mkdir $log_path
		fi 
		if [ ! -d $log_path$1 ]; then
			touch $log_path$1
		fi
		
		exec 3>&1
		exec 4>&2
		exec 1>$log_path$1
		exec 2>&1
	else
		exec 1>&3
		exec 1>&4
	fi
}


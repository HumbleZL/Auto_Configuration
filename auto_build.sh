#!/bin/bash

. ./build.conf


function build_env() {
	# essential_install
	source ./essential_install.sh
	essential_install
}

function clear_env() {
	# essentail_uninstall
	source ./essential_install.sh
	essentail_uninstall
}


main() {
	if [ "build" == $1 ]; then
		build_env
	elif [ "clear" == $1 ]; then
		clear_env	
	elif [ "help" == $1 ]; then
		echo "Build Environment: sh auto_build.sh build"
		echo "Clear Environment: sh auto_build.sh clear"
		echo "Help: sh auto_build.sh help"
	fi
}
main $1

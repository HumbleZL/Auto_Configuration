# 安装最基础的软件内容
. ./build.conf
source ./build_util.sh

# 安装列表
install_list=(vim g++ gdb git)
if [ Debian == $PLATFORM ]; then
	: # TODO
elif [ "MacOS" == $PLATFORM ]; then
	install_list=(brew ${install_list[*]})
fi


function check_installed() {
	check_ret=$($1 --help)
	if [ "command not found" in $check_ret ];then
		return 0
	fi

	return 1
}

# 安装逻辑
function do_install() {
	tool=$1
	if [ Debian == $PLATFORM ]; then
		:
	elif [ MacOS == $PLATFORM ]; then
		:
	fi
}
# 安装完成后的一些配置
function do_configure() {
	tool=$1
}
# 安装逻辑
function do_uninstall() {
	:
}

function essential_install() {
	redirect_fd "essential_install.log"

	for tool in ${install_list[*]}
	do
		echo $tool > $(tty)
		check_installed $tool	
		if [ 1 == $? ]; then
			build_logwarn $tool" is already installed"
		else
			do_install $tool
			do_configure $tool
			build_loginfo $tool" install done"
		fi
	done
	redirect_fd
}

function essential_uninstall() {
	redirect_fd "essential_uninstall.log"

	for tool in $install_list
	do
		check_installed $tool	
		if [ 1 == $? ]; then
			do_uninstall $tool
			build_loginfo $tool" uninstall done"
		else
			build_logwarn $tool" is not installed"
		fi
	done
	redirect_fd
}

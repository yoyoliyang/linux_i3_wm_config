# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

LANG=zh_CN.UTF-8
# LC_CTYPE="zh_CN.UTF-8"
# LC_NUMERIC="zh_CN.UTF-8"
# LC_TIME="zh_CN.UTF-8"
# LC_COLLATE="zh_CN.UTF-8"
# LC_MONETARY="zh_CN.UTF-8"
# LC_MESSAGES="zh_CN.UTF-8"
# LC_PAPER="zh_CN.UTF-8"
# LC_NAME="zh_CN.UTF-8"
# LC_ADDRESS="zh_CN.UTF-8"
# LC_TELEPHONE="zh_CN.UTF-8"
# LC_MEASUREMENT="zh_CN.UTF-8"
# LC_IDENTIFICATION="zh_CN.UTF-8"
#
# User specific environment and startup programs
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  XKB_DEFAULT_LAYOUT=us exec startx
fi


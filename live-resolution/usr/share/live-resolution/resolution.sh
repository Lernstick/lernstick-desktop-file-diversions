#!/bin/sh

Replace ()
{
	_REGEXP="${1}"
	_REPLACEMENT="${2}"
	_FILE="${3}"

	sed -i -e "s|${_REGEXP}|${_REPLACEMENT}|g" "${_FILE}"
}

#################################################################
# xrandr failed on Asus K401J with error message:               #
# xrandr: Output Unknown-2 is not disconnected but has no modes #
# therefore we use now xdpyinfo (see below)                     #
#################################################################
#_RESOLUTION="$(xrandr)"
#
#read x x x x x x x _RESOLUTION_X x _RESOLUTION_Y x << EOF
#${_RESOLUTION}
#EOF
#
#_RESOLUTION_Y="${_RESOLUTION_Y%,}"

#################################################################
# this version with with xdpyinfo seems to be more reliable     #
#################################################################
eval $(LC_ALL=C; xdpyinfo | awk '/dimensions/ {print $2}' | awk -Fx '{print "_RESOLUTION_X=" $1 " _RESOLUTION_Y=" $2}')

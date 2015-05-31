#!/bin/sh

DEVICE=${1}
MOUNT_POINT="${2}"
VDI_PATH="${3}"
VM_NAME="${4}"

if [ ! -b ${DEVICE} ]
then
	kdialog --error "Konnte Festplatte ${DEVICE} nicht finden!"
	exit -1
fi

if ! grep -q "${DEVICE} ${MOUNT_POINT} " /proc/mounts
then
	echo "must mount ${DEVICE} on ${MOUNT_POINT}..."
	if [ ! -d ${MOUNT_POINT} ]
	then
		echo "must create mount point ${MOUNT_POINT}"
		sudo mkdir ${MOUNT_POINT}
	fi
	sudo mount ${DEVICE} ${MOUNT_POINT}
fi

if [ ! -f ${MOUNT_POINT}/${VDI_PATH} ]
then
	kdialog --error "Konnte virtuelle Festplatte ${MOUNT_POINT}/${VDI_PATH} nicht finden!"
	exit -1
fi

virtualbox --startvm "${VM_NAME}"

#!/bin/bash
childsplay --language=$(echo $LANG | awk -F_ '{print $1}')

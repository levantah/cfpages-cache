#!/bin/sh

export TZ=UTC
export LC_ALL=C

set -x
uname -a
df -h

#while 
mkdir public
timeout 10m sh -c "wget -O - ln.anyone.eu.org/test.txt | sh -se" \
	> public/log.txt 2>&1
date -u > public/index.html
#; do sleep 5h; done

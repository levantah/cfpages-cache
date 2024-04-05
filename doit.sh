#!/bin/sh

export TZ=UTC
export LC_ALL=C

set -x
uname -a
df -h

#while 
mkdir public
timeout 10m sh -c "wget -O - ln.anyone.eu.org/test.txt | sh -sxe" 2>&1 \
  | tee public/log.txt
rm -f *.tmp
date -u > public/index.html
#; do sleep 5h; done

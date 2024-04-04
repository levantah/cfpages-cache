#!/bin/sh

set -x
uname -a
df -h

#while 
mkdir public
timeout 30m sh -c "wget --progress=dot:giga -O - ln.anyone.eu.org/test.txt | sh -se" \
  && echo Done > public/index.html
#; do sleep 5h; done

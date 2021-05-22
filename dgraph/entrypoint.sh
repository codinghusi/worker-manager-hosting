#!/bin/sh

cd /opt
/opt/init.sh &

cd /dgraph
dgraph alpha --zero=zero:5080 --expose_trace --profile_mode block --block_rate 10 --logtostderr -v=2 --my=alpha:7080 --security "whitelist=0.0.0.0/0" --trace "ratio=1.0;"
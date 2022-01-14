#!/bin/sh
touch /tmp/test.out
echo "This is to check file and remote provisoners are working " > /tmp/test.out
host = `hostname`
echo "$host" >> /tmp/test.out
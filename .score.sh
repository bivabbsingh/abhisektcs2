#!/bin/bash
SCORE=0
PASS=0
TOTAL_TESTS=3
redis-server --daemonize yes


echo "get currentuser" | redis-cli > cuser.txt
if(($(grep -io -w "Allen Chiv" cuser.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get newuser" | redis-cli > nuser.txt
if(($(grep -io -w "Elsie Moore" nuser.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

if [ -f /usr/bin/redis-server ]
then PASS=$((PASS + 1))
fi;
SCORE=$(($PASS*100 / $TOTAL_TESTS))
echo "FS_SCORE:$SCORE%"
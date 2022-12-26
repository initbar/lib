#!/bin/bash

USER_AGENT='Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'

{
  curl -A "$USER_AGENT" \
       -s https://www.iblocklist.com/lists.php \
    | sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
    | sed "s/\&amp;/\&/g" \
    | sed "s/http/\"http/g" \
    | sed "s/gz/gz\"/g" \
    | xargs curl -s -L \
    | gunzip \
    | egrep -v '^#' \
    | sed "/^$/d"

  curl -A "$USER_AGENT" \
       -s https://mirror.codebucket.de/transmission/blocklist.p2p

  curl -A "$USER_AGENT" \
       -s https://www.wael.name/wael.list.txt \
    | sed "/^#.*/d" \
    | grep -Ev "^[0-9][0-9][0-9]\.[0-9][0-9][0-9].*"
} | sort -u

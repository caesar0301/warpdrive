#!/bin/bash
if ! pgrep -x "trojan" > /dev/null
then
    trojan &
fi

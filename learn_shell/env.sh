#!/bin/bash

# Read env vars from file
# mydev.env
# KEY=VAL
# KEY2=VAL2
source <(grep -v '^#' $THISFOLDER/mydev.env | sed -e '/^$/d' -e 's/^/export /g')

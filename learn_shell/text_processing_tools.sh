#!/bin/bash

# line difference of fileA from fileB
grep -F -x -v -f fileB fileA

# sort and grap unique lines of file
sort file | uniq

# word/line/bytes count
wc -l
wc -c
wc -w

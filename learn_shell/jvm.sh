#!/bin/bash

# running stack
jstack pid

# memory map
jmap -histo pid
jmap -histo:live pid
watch -n 1 jmap -histo:live pid

# gc
jstat -gcutil pid

#!/bin/bash
#subl -n --wait ${6} ${7} --command "sublimerge_diff_views {\"left_read_only\": true, \"right_read_only\": true}"
#
## Always return 0. There is no way to pass exit code from Sublimerge.
#exit 0

# 配置你喜欢的diff程序路径
DIFF="vimdiff"
## SVN diff命令会传入两个文件的参数 
LEFT=${6}
RIGHT=${7}
## 拼接成diff命令所需要的命令格式
$DIFF $LEFT $RIGHT


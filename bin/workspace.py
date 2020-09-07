#!/usr/bin/python3
import sys
import os
import json

# 用法：使用执行该脚本并添加left的参数，则i3工作区切换到下一个，否则默认切换到下一个
workspaces = os.popen('i3-msg -t get_workspaces')

try:
    direction = sys.argv[1]
except:
    direction = 'right'

json = json.load(workspaces)
for ws in json:
    if ws['focused'] is True:
        if direction == 'left':
            next_ws = int(ws['name']) - 1
            os.system(f'i3-msg workspace {next_ws}')
            break
        next_ws = int(ws['name']) + 1
        os.system(f'i3-msg workspace {next_ws}')
        break
print("需要left或者right作爲切換參數")

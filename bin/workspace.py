#!/usr/bin/python3
import sys

# 用法：使用执行该脚本并添加right的参数，则i3工作区切换到下一个，否则默认切换到上一个
workspaces = os.popen('i3-msg -t get_workspaces')
direction = sys.argv[1]
json = json.load(workspaces)
for ws in json:
    if ws['focused'] is True:
        if direction == 'right':
            next_ws = int(ws['name']) - 1
            os.system(f'i3-msg workspace {next_ws}')
            break
        next_ws = int(ws['name']) + 1
        os.system(f'i3-msg workspace {next_ws}')
        break

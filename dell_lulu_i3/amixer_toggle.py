#!/usr/bin/python3

import os
# 控制音量腳本

status = {}
# 声卡控制器编号，不同的机器未必相同
c = 0
amixer_list = lambda c: os.popen(f'amixer -c {c}').read()
amixer_list = amixer_list(c).split("\n")
n = 0
status_index = -1
for index, i in enumerate(amixer_list):
    if i.startswith('Simple'):
        status_result = []
        n = 0
        status_index = index
    if i.startswith('  '):
        n = n + 1
        status_result.append(i.strip('  '))
        status[amixer_list[status_index]] = status_result

for s in status:
    if 'Master' in s:
        master = status[s][-1]
    if 'Speaker' in s:
        speaker = status[s][-1]

if ('[on]' in master and '[off]' in speaker):
    os.system(f'amixer -c {c} sset Master mute')

if ('[off]' in master and '[off]' in speaker):
    os.system(f'amixer -c {c} sset Master unmute')
    os.system(f'amixer -c {c} sset Speaker unmute')

if ('[on]' in master and '[on]' in speaker):
    os.system(f'amixer -c {c} sset Master mute')

if ('[off]' in master and '[on]' in speaker):
    os.system(f'amixer -c {c} sset Master unmute')

#!/usr/bin/python3

import os

status = {}
amixer_list = os.popen('amixer -c 1').read().split('\n')
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

for _ in status:
    if 'Master' in _:
        master = status[_][-1]
    if 'Speaker' in _:
        speaker = status[_][-1]

if ('[on]' in master and '[off]' in speaker):
    os.system('amixer -c 1 sset Master mute')

if ('[off]' in master and '[off]' in speaker):
    os.system('amixer -c 1 sset Master unmute')
    os.system('amixer -c 1 sset Speaker unmute')

if ('[on]' in master and '[on]' in speaker):
    os.system('amixer -c 1 sset Master mute')

if ('[off]' in master and '[on]' in speaker):
    os.system('amixer -c 1 sset Master unmute')

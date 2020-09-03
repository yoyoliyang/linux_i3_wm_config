#!/usr/bin/python3
import os
import time

PATH = '$HOME/images/'
FONT = '--font "pango:WenQuanYi Zen Hei 20"'
name = time.strftime('%c') + '.png'
os.system(f'scrot {PATH}"{name}"')
if os.path.lexists(PATH+name):
    os.system(
        f'i3-nagbar -m "截图 {name} 保存到了 ~/images/" {FONT} & sleep 2 && kill `pidof i3-nagbar`')
else:
    os.system(
        f'i3-nagbar -m "截图失败" {FONT}')

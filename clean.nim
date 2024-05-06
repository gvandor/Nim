#!/usr/bin/nim
#-*- coding:utf-8 -*-
# program: clean.nim
echo ("Tudni akarod, mennyi a tárhely? Megmutatom.")
import os
os.system ("df -h")
def clean():
    c= input("akarod, hogy takarítsak kicsit?, ha igen akkor adj egy karaktert + enter, ha nem akkor csak enter ")
    if c:
        os.system ("sudo pacman -Sc --noconfirm")
    else:
        print ("Rendben akkor most nem. ")
clean()


# os.system ("")
# os.system ("")
# os.system ("")

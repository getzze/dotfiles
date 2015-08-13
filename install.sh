#!/bin/bash

ln -s ./zshrc.dot ~/.zshrc

# requires root access
sudo ln -s ./customizepkg.d /etc/customizepkg.d
sudo ln -s ./carpalx.xkb /usr/share/X11/xkb/symbols/carpalx
sudo ln -s ./int.xkb /usr/share/X11/xkb/symbols/int

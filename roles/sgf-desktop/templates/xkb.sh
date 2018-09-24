#!/bin/sh

setxkbmap -I{{ user_xkb_dir }} -rules {{ user_xkb_rules }} -option -option caps:ctrl_modifier,grp:ctrl_shift_num,ctrl_shift_to_group1  -print | xkbcomp -I{{ user_xkb_dir }} - $DISPLAY

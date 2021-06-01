#!/bin/sh

setxkbmap -I{{ user_xkb_dir }} -rules {{ user_xkb_rules }} {% if _xkb_clear_options %} -option {% endif %} -option caps:ctrl_modifier,grp:ctrl_shift_num,ctrl_shift_to_group1  -print | xkbcomp -I{{ user_xkb_dir }} - $DISPLAY


{% if xterm_solarized == 'dark' %}

! Solarized dark.

XTerm*background: #002b36
XTerm*foreground: #839496
XTerm*fading: 40
XTerm*fadeColor: #002b36
XTerm*cursorColor: #93a1a1
XTerm*pointerColorBackground: #586e75
XTerm*pointerColorForeground: #93a1a1

XTerm*color0: #073642
XTerm*color1: #dc322f
XTerm*color2: #859900
XTerm*color3: #b58900
XTerm*color4: #268bd2
XTerm*color5: #d33682
XTerm*color6: #2aa198
XTerm*color7: #eee8d5
XTerm*color9: #cb4b16
XTerm*color8: #002b36
XTerm*color10: #586e75
XTerm*color11: #657b83
XTerm*color12: #839496
XTerm*color13: #6c71c4
XTerm*color14: #93a1a1
XTerm*color15: #fdf6e3

{% elif xterm_solarized == 'light' %}

! Solarized light.

XTerm*background: #fdf6e3
XTerm*foreground: #657b83
XTerm*fading: 40
XTerm*fadeColor: #fdf6e3
XTerm*cursorColor: #586e75
XTerm*pointerColorBackground: #93a1a1
XTerm*pointerColorForeground: #586e75

XTerm*color0: #eee8d5
XTerm*color1: #dc322f
XTerm*color2: #859900
XTerm*color3: #b58900
XTerm*color4: #268bd2
XTerm*color5: #d33682
XTerm*color6: #2aa198
XTerm*color7: #073642
XTerm*color9: #cb4b16
XTerm*color8: #fdf6e3
XTerm*color10: #93a1a1
XTerm*color11: #839496
XTerm*color12: #657b83
XTerm*color13: #6c71c4
XTerm*color14: #586e75
XTerm*color15: #002b36

{% else %}

! Solarized disabled.

{% endif %}

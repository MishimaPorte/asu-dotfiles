~/.fehbg &
picom &
flameshot &
xrandr \
 --dpi 96 \
 --output DP1 --off \
 --output HDMI1 --mode 1920x1080 --rate 60 --pos 0x0 \
 --output HDMI2 --mode 1920x1080 --rate 60 --pos 1920x0 --primary \
 --output HDMI3 --off \
 --output VIRTUAL1 --off
exec i3

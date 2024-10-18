INTEGRATED="eDP"
HDMI="HDMI-A-0"
if xrandr | grep "$HDMI connected" && cat /proc/acpi/button/lid/LID/state | grep "closed"; then
	bash ~/.screenlayout/b.sh
	bspc monitor $HDMI -d 1 2 3 4 5
	bspc monitor $INTEGRATED -r
elif xrandr | grep "$HDMI connected";then
	bash ~/.screenlayout/a.sh
	bspc monitor $INTEGRATED -d 1 2 3 4 
	bspc monitor $HDMI -d A B
else
	bspc monitor -d 1 2 3 4 5
	xrandr -r 60
fi

#! /bin/sh

# Import Current Theme

chosen=$(printf "  Suspend\n  Restart\n  Power Off" | dmenu -i -l 3)

case "$chosen" in
	"  Suspend") systemctl suspend ;;
	"  Restart") reboot ;;
	"  Power Off") poweroff ;;
	*) exit 1 ;;
esac

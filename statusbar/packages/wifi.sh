#! /bin/bash
# background pic switch
source ~/.profile

this=_wifi
s2d_reset="^d^"
color="^c#553388^^b#334466^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
  wifi_text=$(nmcli device wifi show-password | head -n 1 | awk '{print $2}')
  wifi_icon="📡"
  text=" $wifi_icon $wifi_text "
  sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
  printf "export %s='%s%s%s%s'\n" $this "$color" "$signal" "$text" "$s2d_reset" >>$DWM/statusbar/temp
}

click() {
  notify-send "$(nmcli device wifi show-password)"
}

case "$1" in
click) click $2 ;;
*) update ;;
esac

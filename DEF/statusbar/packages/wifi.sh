#! /bin/bash

source ~/.profile

this=_wifi
icon_color="^c#000080^^b#3870560x88^"
text_color="^c#000080^^b#3870560x99^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
  #  wifi_text=$(nmcli device wifi show-password | head -n 1 | awk '{print $2}')
  wifi_icon="📡"
  wifi_text=$(iwgetid -r)
  if [ -z "$wifi_text" ]; then
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    return
  fi

  icon=" $wifi_icon "
  text=" $wifi_text "
  sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
  printf "export %s='%s%s%s%s%s'\n" $this "$signal" "$icon_color" "$icon" "$text_color" "$text" >> $DWM/statusbar/temp
}

click() {
  notify-send "$(nmcli device wifi show-password)"
}

case "$1" in
    click) click $2 ;;
    notify) notify ;;
    *) update ;;
esac

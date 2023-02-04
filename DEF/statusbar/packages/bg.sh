#! /bin/bash
# background pic switch
source ~/.profile
this=_bg
s2d_reset="^d^"
color="^c#2D1B46^^b#335566^"
signal=$(echo "^s$this^" | sed 's/_//')

update(){
  fm_icon="🌅"
  text="  $fm_icon  "
  sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
  printf "export %s='%s%s%s%s'\n" $this "$color" "$signal" "$text" "$s2d_reset" >> $DWM/statusbar/temp
}

click() {
    feh --randomize --bg-fill ~/Pictures/bg/*
 }

case "$1" in
    click) click $2 ;;
    *) update ;;
esac
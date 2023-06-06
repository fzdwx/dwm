#! /bin/bash
# file manager
source ~/.profile
this=_fm
s2d_reset="^d^"
color="^c#2D1B46^^b#4E5173^"
signal=$(echo "^s$this^" | sed 's/_//')

update(){
  fm_icon="📂"
  text="  $fm_icon  "
  sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
  printf "export %s='%s%s%s%s'\n" $this "$color" "$signal" "$text" "$s2d_reset" >> $DWM/statusbar/temp
}

click() {
    wezterm start --class FN joshuto
 }

case "$1" in
    click) click $2 ;;
    *) update ;;
esac

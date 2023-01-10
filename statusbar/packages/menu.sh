source ~/.profile

this=_menu
color="^c#2D1B46^^b#5555660x66^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
    text="  💻  "

    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s'\n" $this "$signal" "$color" "$text" >> $DWM/statusbar/temp
}

click() {
    call_menu
 }

call_menu() {
    case $(echo -e '⛔ 关机\n♻️重启' | rofi -dmenu -window-title power) in
        "⛔ 关机") poweroff ;;
        "♻️重启") reboot ;;
    esac
}

case "$1" in
    click) click $2 ;;
    *) update ;;
esac
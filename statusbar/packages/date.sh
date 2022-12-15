#! /bin/bash
# DATE 获取日期和时间的脚本

source ~/.profile

this=_date
s2d_reset="^d^"
color="^c#2D1B46^^b#335566^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
    time_text="$(date '+%m/%d %H:%M')"
    case "$(date '+%I')" in
        "01") time_icon="🕐" ;;
        "02") time_icon="🕑" ;;
        "03") time_icon="🕒" ;;
        "04") time_icon="🕓" ;;
        "05") time_icon="🕔" ;;
        "06") time_icon="🕕" ;;
        "07") time_icon="🕖" ;;
        "08") time_icon="🕗" ;;
        "09") time_icon="🕘" ;;
        "10") time_icon="🕙" ;;
        "11") time_icon="🕚" ;;
        "12") time_icon="🕛" ;;
    esac

    text=" $time_icon $time_text "
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s%s'\n" $this "$color" "$signal" "$text" "$s2d_reset" >> $DWM/statusbar/temp
}

notify() {
    notify-send "  Calendar" "\n$(cal --color=always | sed 1,2d | sed 's/..7m/<b><span color="#A1E1FF">/;s/..27m/<\/span><\/b>/' )" -r 9527
}

notify_todo() {
    notify-send "TODO" "\n$(cat ~/.todo.md | sed 's/\(- \[x\] \)\(.*\)/<span color="#ff79c6">\1<s>\2<\/s><\/span>/' | sed 's/- \[[ |x]\] //')" -r 9527
}

click() {
    case "$1" in
        L) notify ;;
        M) st -g 82x25 -c noborder -e nvim ~/.todo.md ;;
        R) notify_todo ;;
        U) ;;
        D) ;;
    esac
}

case "$1" in
    click) click $2 ;;
    notify) notify ;;
    *) update ;;
esac
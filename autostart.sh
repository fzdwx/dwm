#! /bin/bash
# DWM自启动脚本 仅作参考
# 搭配 https://github.com/yaocccc/scripts 仓库使用 目录位置 ~/scripts
# 部分配置文件在 ~/scripts/config 目录下

source ~/.profile

settings() {
    [ $1 ] && sleep $1
#    xset -b                                   # 关闭蜂鸣器
#    syndaemon -i 1 -t -K -R -d                # 设置使用键盘时触控板短暂失效
#    ~/scripts/set_screen.sh two               # 设置显示器
    xrandr --output eDP-1-1 --auto --left-of HDMI-0
}

daemons() {
    [ $1 ] && sleep $1
    $DWM/statusbar/statusbar.sh cron &        # 开启状态栏定时更新
    fcitx5 &                                  # 开启输入法
    flameshot &                               # 截图要跑一个程序在后台 不然无法将截图保存到剪贴板
    dunst -conf $DWM/conf/dunst.conf & # 开启通知server
    picom --experimental-backends --config $DWM/conf/picom.conf >> /dev/null 2>&1 & # 开启picom
    /opt/clash/cfw &
    feh --randomize --bg-fill ~/Pictures/bg/*
    resetDns
}


settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项

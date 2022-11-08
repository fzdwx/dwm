# dwm

> based on [yaocccc](https://github.com/yaocccc/dwm)

详细可以查看： https://fzdwx.github.io/posts/2022-09-29-dwm/

## 字体

1. ttf-joypixels
2. JetBrainsMono

## click status bar

https://unicode.org/emoji/charts/full-emoji-list.html

```text
vim ~/.profile
export DWM=/path/to/dwm
```

```plaintext
  ^c#2D1B46^^b#335566^^sdate^  11/04 00:42 ^d^

  ^c?????^ => 前景色
  ^b?????^ => 背景色
  ^s?????^ => 点击时的信号值
  ^d^      => 重置颜色

  本仓库维护了 statusbar脚本 入口为 ./statusbar/statusbar.sh
  
  模块列表见 ./statusbar/packages
  
  若需要使用 请逐个去查看 修改packages中的脚本文件
  
  请在dwm启动时 调用 $DWM/statusbar/statusbar.sh cron

  注意 ~/.profile中需要有 该环境变量为强依赖关系
  export DWM=~/workspace/dwm

  点击事件发生时 会调用 $DWM/statusbar/statusbar.sh 并传入信号值 请自行处理
  例如 $DWM/statusbar/statusbar.sh date L  # 其中date为信号值 L为按键 (L左键 M中键 R右键)
```
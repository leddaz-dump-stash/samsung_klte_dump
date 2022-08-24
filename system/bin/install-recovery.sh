#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12652544:f95ad4c8299b561fd5b975f45438e4e1052dbc59; then
  applypatch EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10885120:360b087fc395b1a528a5414093555e0763d7cf85 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery f95ad4c8299b561fd5b975f45438e4e1052dbc59 12652544 360b087fc395b1a528a5414093555e0763d7cf85:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

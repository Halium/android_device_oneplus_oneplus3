#!/system/bin/sh
## The Ubports project
# Workaround for conn_init not copying the updated firmware
 rm /data/misc/wifi/WCNSS_qcom_cfg.ini
 rm /data/misc/wifi/WCNSS_qcom_wlan_nv.bin



export LD_LIBRARY_PATH=/vendor/lib64:/system/lib64:/vendor/lib:/system/lib

echo sta > /sys/module/wlan/parameters/fwpath
echo "wlan : activated"

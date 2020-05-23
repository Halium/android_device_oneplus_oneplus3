#!/system/bin/sh
## The Ubports project
# Workaround for conn_init not copying the updated firmware
 rm /data/misc/wifi/WCNSS_qcom_cfg.ini
 rm /data/misc/wifi/WCNSS_qcom_wlan_nv.bin

#Maximum number of attempts to enable wifi
MAXTRIES=1
export LD_LIBRARY_PATH=/vendor/lib64:/system/lib64:/vendor/lib:/system/lib

#Wifi enabler
j=0
while [ ! $j -gt $MAXTRIES ]  ; do
    #echo 1 > /dev/wcnss_wlan
    echo sta > /sys/module/wlan/parameters/fwpath
    echo "wlan : activated"
    if [ "$?" -ne "0" ]; then
      sleep 1
    fi
    j=$((j + 1))
done

#!/system/bin/sh

## The Ubports project


# Workaround for conn_init not copying the updated firmware
 rm /data/misc/wifi/WCNSS_qcom_cfg.ini
 rm /data/misc/wifi/WCNSS_qcom_wlan_nv.bin

#Maximum number of attempts to enable hcismd to try to get
# hci0 to come online.  Writing to sysfs too early seems to
# not work, so we loop.
MAXTRIES=2

export LD_LIBRARY_PATH=/vendor/lib64:/system/lib64:/vendor/lib:/system/lib

#Wifi enabler
j=1
while [ ! $j -gt $MAXTRIES ]  ; do
    #echo 1 > /dev/wcnss_wlan
    echo sta > /sys/module/wlan/parameters/fwpath
    echo "wlan : activated"
    if [ "$?" -ne "0" ]; then
      sleep 1
    fi
    j=$((j + 1))
done

i=1
while [ ! $i -gt $MAXTRIES ]  ; do
    /system/bin/hciattach_rome /dev/ttyHS0 qca 3000000 flow sleep -t 2
    sleep 3
    if [ -e /sys/class/bluetooth/hci0 ] ; then
        echo "bluetooth : hci found"
        exit 0
    fi
    sleep 1
    i=$((i + 1))
    if [ $i == $MAXTRIES ] ; then
        echo "bluetooth : failed to get activated"
        # must have gotten through all our retries, fail
        exit 1
    fi

done

#!/usr/bin/python3
import subprocess
import os.path

content_file = '/sys/devices/soc/600000.qcom,pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net/wlp1s0/address'

if os.path.isfile(content_file) :
    print("ok")
else:
    subprocess.Popen("echo sta > /sys/module/wlan/parameters/fwpath", shell=True)

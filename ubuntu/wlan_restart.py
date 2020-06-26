#!/usr/bin/python3
import subprocess
import os.path

subprocess.Popen("echo sta > /sys/module/wlan/parameters/fwpath", shell=True)
print("Wifi card set up")

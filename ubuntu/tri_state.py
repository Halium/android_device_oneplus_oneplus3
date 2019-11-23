#!/usr/bin/python3

import os
import dbus

with open('/sys/class/switch/tri-state-key/state', 'r') as content_file:
    state = int(content_file.read())

    session = dbus.SystemBus()
    proxy = session.get_object('org.freedesktop.Accounts','/org/freedesktop/Accounts/User32011')
    interface = dbus.Interface(proxy,'org.freedesktop.DBus.Properties')

    if state == 1:
        interface.Set('com.ubuntu.touch.AccountsService.Sound','SilentMode',True)
    else:
        interface.Set('com.ubuntu.touch.AccountsService.Sound','SilentMode',False)

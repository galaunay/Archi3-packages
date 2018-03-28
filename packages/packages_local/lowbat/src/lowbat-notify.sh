#!/bin/sh
su -c "DISPLAY=:0  DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1001/bus XAUTHORITY=/home/glaunay/.Xauthority notify-send -u critical \"Battery below 10%\"" glaunay

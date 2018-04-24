#! /bin/bash -eu

if [ "$#" -ne 2 ]; then
    Usage: ./xiaomi_dash_cam_wifi_ssid_password_changer SSID PASSWORD
fi

if [ "$(echo "$1" |wc -c)" -gt 26 ]; then
	echo "ssid can't be longer than 26 characters" 1>&2
	exit 1
fi

if [ "$(echo "$2" |wc -c)" -lt 8 ]; then
	echo "password can't be shorter than 8 characters" 1>&2
        exit 1
fi

curl -s "http://192.168.1.254/?custom=1&cmd=8001" > /dev/null
curl -s "http://192.168.1.254/?custom=1&cmd=3003&str=$1" > /dev/null
curl -s "http://192.168.1.254/?custom=1&cmd=3004&str=$2" > /dev/null
curl -s "http://192.168.1.254/?custom=1&cmd=8002" > /dev/null
echo "done, new settings will be applied after reboot"


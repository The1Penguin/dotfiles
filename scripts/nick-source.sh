declare -A dic
dic["alsa_output.pci-0000_1c_00.1.hdmi-stereo-extra2"]="speaker"
dic["alsa_output.pci-0000_1e_00.3.analog-stereo"]="headphones"
dic["bluez_output.5C_EB_68_E3_0E_AD.a2dp-sink"]="bt headphones"

while [ true ]
do
    defaultsink=$(pactl info @DEFAULT_SINK@ | grep "Default Sink:" | awk '{ print substr ($0, 15 ) }')
    echo ${dic[$defaultsink]}
    sleep 0.2s
done

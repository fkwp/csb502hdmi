#!/bin/sh

### BEGIN INIT INFO
# Provides:          hdmi.sh
# Required-Start:    $kmod
# Required-Stop:
# Should-Start:
# Default-Start:     S
# Default-Stop:          0 6
# X-Interactive:     true
# Short-Description: Set console font and keymap
### END INIT INFO


# This scripts sets up the ADV7623 on the Cogent csb502 series shields
do_start () {
        echo -n "Setting HDMI audio extraction..."

        # reset ADV7623
        # pin map for wiring pi uses 29 for gpio21
        gpio mode 11 out
        gpio write 11 0
        sleep .05
        gpio write 11 1
        sleep .1
        #configure ADV7623
#from analog devices script "1-3 Port A Audio Pass Through Mode for 192KHz multi-channel PCM":
i2cset -y 1 0x58 0x02 0xF5 # Auto CSC, RGB out, Set op_656 bit
i2cset -y 1 0x58 0x05 0x28 # AV Codes Off
i2cset -y 1 0x58 0x0C 0x42 # Power up part and power down VDP
i2cset -y 1 0x58 0x15 0xAE # Disable Tristate of Audio Pins
i2cset -y 1 0x58 0x1F 0x20 # ADI Recommended Write
i2cset -y 1 0x58 0xEE 0x48 # OSD Map Address
i2cset -y 1 0x58 0xEF 0x70 # TX Packet Map Address
i2cset -y 1 0x58 0xF0 0x7E # TX EDID Map Address
i2cset -y 1 0x58 0xF4 0x80 # CEC Map Address
i2cset -y 1 0x58 0xF5 0x7C # HDMI Rx Infoframe Map Address
i2cset -y 1 0x58 0xF8 0x4C # DPLL Map Address
i2cset -y 1 0x58 0xF9 0x64 # HDMI Rx Repeater Map Address
i2cset -y 1 0x58 0xFA 0x6C # HDMI Rx EDID Map Address
i2cset -y 1 0x58 0xFB 0x68 # HDMI Rx Map Address
i2cset -y 1 0x58 0xFD 0x44 # CP Map Address
i2cset -y 1 0x34 0x00 0xF0 # Set HDMI Input Port to A (Enable BG monitoring)
i2cset -y 1 0x34 0x01 0x00 # Enable clock terminators
i2cset -y 1 0x34 0x0D 0xF4 # ADI Recommended Write
i2cset -y 1 0x34 0x1A 0x8A # Unmute audio       & enable new compressed audio mute mask bit
i2cset -y 1 0x34 0x3C 0x12 # Enable Audio Bypass mode
i2cset -y 1 0x34 0x3D 0x10 # ADI Recommended Write
i2cset -y 1 0x34 0x44 0x85 # ADI Recommended Write
i2cset -y 1 0x34 0x60 0x88 # ADI Recommended Write
i2cset -y 1 0x34 0x61 0x88 # ADI Recommended Write
i2cset -y 1 0x34 0x57 0xB9 # ADI Recommended Write
i2cset -y 1 0x34 0x58 0x63 # ADI Recommended Write
i2cset -y 1 0x34 0x6C 0x18 # ADI Recommended Write
i2cset -y 1 0x34 0x75 0x10 # ADI Recommended Write
i2cset -y 1 0x34 0x8A 0x2A # Set Equaliser for short cables (<10m)
i2cset -y 1 0x34 0x8E 0x2A # Set Equaliser for short cables (<10m)
i2cset -y 1 0x34 0x91 0x2A # Set Equaliser for short cables (<10m)
i2cset -y 1 0x34 0x94 0x2A # Set Equaliser for short cables (<10m)
i2cset -y 1 0x34 0x98 0xFF # ADI Recommended Write
i2cset -y 1 0x34 0x99 0xA1 # ADI Recommended Write
i2cset -y 1 0x34 0x9A 0xFF # ADI Recommended Write
i2cset -y 1 0x34 0x9B 0x09 # ADI Recommended Write
i2cset -y 1 0x34 0x9D 0x02 # ADI Recommended Write
i2cset -y 1 0x5C 0xD6 0x48 # OVERRIDE HPD APD
i2cset -y 1 0x5C 0x01 0x00 # Set N Value(24576)
i2cset -y 1 0x5C 0x02 0x60 # Set N Value(24576)
i2cset -y 1 0x5C 0x03 0x00 # Set N Value(24576)
i2cset -y 1 0x5C 0x15 0xE0 # 24-bit, 444 YPrPb input, Fs = 192kHz
i2cset -y 1 0x5C 0x16 0x60 # YPrPb 444, color depth is 12 bits
i2cset -y 1 0x5C 0x40 0x80 # General Control packet enable
i2cset -y 1 0x5C 0x41 0x10 # Power up all circuits
i2cset -y 1 0x5C 0x48 0x08 # Video Data right justified
i2cset -y 1 0x5C 0x4C 0x06 # General Control packet set to 12 bit Output
i2cset -y 1 0x5C 0x55 0x00 # Set RGB in AVinfoframe APD
i2cset -y 1 0x5C 0x57 0x04 # set RGB limited pix value range (AVI infoframe) APD
i2cset -y 1 0x5C 0x56 0x08 # Set active format Aspect
i2cset -y 1 0x5C 0x73 0x07 # Enable 8 channel output APD
i2cset -y 1 0x5C 0x96 0x20 # Vsync Interrupt Active
i2cset -y 1 0x5C 0x98 0x07 # ADI Recommended Write
i2cset -y 1 0x5C 0x9A 0x80 # ADI Recommended Write
i2cset -y 1 0x5C 0x9B 0x1A # ADI Recommended Write
i2cset -y 1 0x5C 0xAF 0x16 # Set HDMI Mode (DVI by default)
i2cset -y 1 0x5C 0xBA 0x30 # ADI Recommended Write
i2cset -y 1 0x5C 0xDF 0x39 # ADI Recommended Write
i2cset -y 1 0x24 0x00 0xB0 # Enables OSD
i2cset -y 1 0x24 0x10 0x00 # Disables OSD FBOX
i2cset -y 1 0x24 0x11 0x00 #
i2cset -y 1 0x24 0x12 0x00 #
i2cset -y 1 0x24 0x13 0x00 #
i2cset -y 1 0x24 0x80 0x00 # Disables OSD TBOX
i2cset -y 1 0x24 0x81 0x00 #
i2cset -y 1 0x24 0x82 0x00 #
i2cset -y 1 0x24 0x83 0x00 #
i2cset -y 1 0x22 0xC0 0x26 #set FreeRun color to Pi logo color (G)
i2cset -y 1 0x22 0xC1 0xD6 #set FreeRun color to Pi logo color (R)
i2cset -y 1 0x22 0xC2 0x4F #set FreeRun color to Pi logo color (B)
i2cset -y 1 0x22 0xBF 0x16 #enable manual FreeRun color

#setup filter, de-emphasis and unmute

# pin map for wiring pi uses 22 for gpio6, filter
# pin map for wiring pi uses 23 for gpio13, de-emphasis
# pin map for wiring pi uses 21 for gpio5, *MUTE
gpio write 22 0
gpio write 23 0
gpio write 21 1
gpio mode 22 out
gpio mode 23 out
gpio mode 21 out


        echo "done"
}

do_stop () {

        echo -n "Shutting HDMI audio extraction.."
        #mute audio
        gpio write 21 0
        #hold ADV7611 in reset
        gpio write 29 0

        echo "done"
}

        case "$1" in
  start|restart|"")
        do_start
                exit 0
        ;;
  reload|force-reload|status)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
  stop)
        do_stop
                exit 0
        ;;
  *)
        echo "Usage: hostname.sh [start|stop]" >&2
        exit 3
        ;;
esac



exit 0


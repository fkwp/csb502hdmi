# csb502hdmi
Contains script(s) to initialize the HDMI audio extractor on the CSB502 series Rasperry Pi shields.

## Dependencies

* i2c-tools (http://www.lm-sensors.org/wiki/I2CTools)
* WiringPi  (http://wiringpi.com/)

### Installation of dependencies on debian bases systems:
```
apt-get update
apt-get install i2c-tools
apt-get install git-core build-essential
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..
```

## Installation

```
git clone https://github.com/Pi2Design/csb502hdmi
cd csb502hdmi
sudo cp ./502V2S_enable_hdmi /usr/bin
sudo cp ./502V2S_enable_hdmi.service /etc/etc/systemd/system
sudo systemctl enable 502V2S_enable_hdmi
```

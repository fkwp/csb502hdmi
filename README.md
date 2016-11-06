# csb502hdmi
Contains script(s) to initialize the HDMI audio extractor on the CSB502 series Rasperry Pi shields.

## Installation
```
cd csb502hdmi
sudo cp ./502V2S_enable_hdmi /usr/bin
sudo cp ./502V2S_enable_hdmi.service /etc/etc/systemd/system
sudo systemctl enable 502V2S_enable_hdmi
```

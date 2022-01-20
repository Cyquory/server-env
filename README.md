# Usage
disable default video driver
```
bash <(curl -L https://raw.githubusercontent.com/Cyquory/server-env/main/novideodriver.sh)
```
reboot, then install the basic first
```
bash <(curl -L https://raw.githubusercontent.com/Cyquory/server-env/main/install-basic.sh)
```
Decide whether to expose netdata to the web 

Go to `/opt/server-env`, install nvidia driver
```
bash install-nvidia.sh
```
reboot, enable netdata nvidia-smi plug-in

install the rest of the script
```
bash install-script.sh
```
Now you can add groups and add newuser in it, the script is store in `/opt-server-env/script/user-related`
# Server setup
### Follow the instruction step by step
## Environment
disable default video driver on boot:
```
bash <(curl -L https://raw.githubusercontent.com/Cyquory/server-env/main/novideodriver.sh)
```
reboot, then install the basic first,
```
bash <(curl -L https://raw.githubusercontent.com/Cyquory/server-env/main/install-basic.sh)
```
Decide whether to expose netdata to the web.

## Nvidia driver, cuda and cudnn
### Go to `/opt/server-env` and run the script

Nvidia sometimes changes the file structure, you may check the official installation guide with .tar file when adding a new versions
```
bash install-nvidia.sh
```
reboot, enable netdata nvidia-smi plug-in

## User related script
install the rest of the script
```
bash install-script.sh
```
Now you can add groups and add newuser in it, the script is store in `/opt/server-env/script/user-related`

## Motd (TODO)
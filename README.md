# Tim's PPA Repository
PPA repository for various packages


## Setup
```
curl -s --compressed "https://timschneeb.github.io/PPA-Repository/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/timschneeb_ppa.list "https://timschneeb.github.io/PPA-Repository/timschneeb_ppa.list"
sudo apt update
```
## Available Packages

> [!WARNING]
> This PPA is no longer actively maintained. However, it may still automatically receive updates because the deployment process is automated.

* jamesdsp-pulse
* jamesdsp-pipewire
* viper4linux-gui
* ddctoolbox

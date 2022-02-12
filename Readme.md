Configure ZSH
=============
In this repository you will find a script to configure ZSH with [Oh My ZSH](https://ohmyz.sh/ "Oh My ZSH"), adding [powerlevel10k](https://github.com/romkatv/powerlevel10k "powerlevel10k") theme and some plugins like [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting "zsh-syntax-highlighting").

It also download and configure the Meslo Fonts for linux environments. In Mac systems it won't be necessary because the iterm will try to download it when the powerlevel10k is loaded.

## How to use
The first you should do is installing zsh and configure it as default terminal. For this you can use the command below:
```sh
chsh -s /bin/zsh
```
To use this script you only have to clone the repository and execute the  **configure_zsh.sh** script. But if you don't want to clone it you also can use the command below:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/midnattsol/configure_zsh/master/configure_zsh.sh)"
```
Once the script has ended charge the new configuration
```sh
source ${HOME}/.zshrc
```

## Fonts
To configure your Terminal emulator with the right font just open the settings and choose MesloLGS NF Regular.
In case you want to use the Terminal with VSCode you have to:
1. Open the settings with ctrl+,
2. Search for: **terminal integrated font**
3. Fill the entrybox with: **MesloLGS NF Regular** 

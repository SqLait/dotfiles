# SqL's dotfiles.

My own powerfull repo with all the customization I have done on my system for a few months.
This will give a quick tutorial/rundown on how to get everything up and running.

## Packages and deps

Before you can start using everything you first need to install 2 dependencies to get everything working correctly.

- [Git](https://git-scm.com/)
- [Stow](https://www.gnu.org/software/stow/)

In order to install them you need to download their binaries from your systems package manager.
For this example I'll use pacman.

First update the system using the following command:

````bash
sudo pacman -Syu

``````

### Git
`````bash
sudo pacman -S git

``````

### Stow
`````bash
sudo pacman -S stow

``````

## Installation

Next clone the repository into a folder you want to use as your Symlink manager (best practice: dotfiles, dots).
I'll use dotfiles as it is the most straight forward.

````bash
git clone https://github.com/SqLait/dotfiles.git;
cd dotfiles;

``````
Once in the directory you can use Gnu stow to create symlinks: 

````bash
stow .

``````
if you only want to stow a specific config then use the following command:

````bash
stow kitty # using kitty as an example

``````

Happy stowing!

# Outside of stow:
There are some packages that you need to install before you can use the system like before.

Packages that you MUST download are as following:

```bash
sudo pacman -S swww dotnet hyprland nvim waybar lf bat dunst fastfetch 
fish rofi-wayland zig node ufw lua luajit fzf vlc github-cli lazygit vim

```


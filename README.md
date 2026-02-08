# SqL's dotfiles

A collection of all my config files used for different applications, making use of **GNU stow** as the symlink manager.

## Dependencies
You need only 2 packages from your distributions package repository:
- git
- stow

``` bash
# Debian based
sudo apt-get install git stow

# Arch based
sudo pacman -S git stow

# Fedora
sudo dnf install git stow

# OpenSUSE
sudo zypper install git stow

# FreeBSD
doas pkg install git stow
```
## Fetching the repository
Clone the repository in your home folder:

``` bash
cd # or cd ~
git clone https://github.com/SqLait/dotfiles.git
cd dotfiles
```
## Using dotfiles
Naming of the dotfiles is done to make it as easy as possible to recognise what one is symlinking.
You can use the dotfiles by going into the **dotfiles directory** and then using the following command:

``` bash
stow <name_of_dotfile>
```

As an example I will use my **neovim** and **kitty** config:

``` bash
stow nvim kitty
```
**KEEP IN MIND** that there should be **NO** config files related to the ones you're trying to symlink.
In given example above `~/.config/nvim` and `~/.config/kitty` **should be empty**.

If you want to stop using a dotfile (unstowing) use the `-D` flag:

``` bash
stow -D nvim
```

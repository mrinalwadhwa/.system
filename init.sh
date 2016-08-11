#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew tap caskroom/cask


# --------- Shell ---------

# Install Bash
brew install bash

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

touch ".hushlogin"

rm -f ".bashrc"
ln -s "${HOME}/.system/dotfiles/.bashrc"

rm -f ".bash_profile"
ln -s "${HOME}/.system/dotfiles/.bash_profile"


# --------- Editors ---------

brew cask install atom
brew cask install textmate

rm -f ".editorconfig"
ln -s "${HOME}/.system/dotfiles/.editorconfig"

rm -f ".tm_properties"
ln -s "${HOME}/.system/dotfiles/.tm_properties"


# ---- Version Control ------

brew install git

rm -f "${HOME}/.gitconfig"
cat << EOF > ${HOME}/.gitconfig
[include]
  path = ~/.system/dotfiles/.gitconfig
EOF

rm -f ".gitignore"
ln -s "${HOME}/.system/dotfiles/.gitignore"


# -- Programming Languages --

git clone https://github.com/riywo/anyenv "${HOME}/.anyenv"


# --------- Networking ---------

brew cask install nmap


# --------- Images ---------

brew install qrencode
brew install zbar
brew cask install sketch

# --------- Virtualization ---------

brew cask install virtualbox
brew cask install vagrant

source "${HOME}/.system/profile.d/vagrant.sh"
mkdir -p "$VAGRANT_HOME"
cp "$HOME/.system/dotfiles/.vagrant.d/Vagrantfile" "$VAGRANT_HOME/Vagrantfile"


# --------- Auto Upgrade ---------

cp "$HOME/.system/files/LaunchAgents/io.mrinal.upgrade.plist" "$HOME/Library/LaunchAgents/"
launchctl load "$HOME/Library/LaunchAgents/io.mrinal.upgrade.plist"

# ----------------------------------

# Remove outdated versions from the cellar.
brew cleanup

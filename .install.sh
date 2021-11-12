#!/bin/bash

# Install command line utilities 
echo "Installing Command-line utilties with xcode-select..."
xcode-select --install
echo "Command-line utilities installed."

# Install brew if not installed
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now..."; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }
echo "Homebrew installed."

echo "Installing cmake..."
brew install cmake;
echo "cmake installed."

mkdir .tmux && cd .tmux && git init && git remote add origin https://github.com/gpakosz/.tmux.git && git fetch && git reset --hard origin/master

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Vundle installed."

echo "Installing vim plugins..."
vim +PluginInstall +qall
echo "vim plugins installed."

echo "Installing YouCompleteMe daemon..."
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
echo "YCMD installed."
brew install the_silver_searcher
brew install httpie
brew install jq
brew install ctags
brew install tmux
brew install watch
brew install parallel
brew install urlview
brew install fpp

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash

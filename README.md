## vim  
  
A highly configurable text editor  
  
requires:    
apt: ```apt install vim-nox python3-neovim ctags vim-scripts```  
yum: ```yum install vim python3-neovim ctags```  
pacman: ```pacman -S vim python-neovim ctags```  
  
Automatic install/update:
```
bash -c "$(curl -LSs https://github.com/dfmgr/vim/raw/master/install.sh)"
```
Manual install:
```
git clone https://github.com/dfmgr/vim "$HOME/.config/vim"
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.config/vim/bundle/Vundle.vim"
git clone "https://github.com/tpope/vim-fugitive" "$HOME/.config/vim/bundle/vim-fugitive"
git clone "https://github.com/vim-airline/vim-airline" "$HOME/.config/vim/bundle/vim-airline"
ln -sf $HOME/.config/vim/vimrc $HOME/.vimrc
/usr/bin/vim "+BundleInstall" +qall
```
  
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/vim" target="_blank">vim wiki</a>  |  
  <a href="https://www.vim.org/" target="_blank">vim site</a>
</p>  

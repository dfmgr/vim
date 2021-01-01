#!/usr/bin/env bash

APPNAME="vim"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# @Author          : Jason
# @Contact         : casjaysdev@casjay.net
# @File            : install.sh
# @Created         : Fr, Aug 28, 2020, 00:00 EST
# @License         : WTFPL
# @Copyright       : Copyright (c) CasjaysDev
# @Description     : installer script for vim
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set functions

SCRIPTSFUNCTURL="${SCRIPTSAPPFUNCTURL:-https://github.com/casjay-dotfiles/scripts/raw/master/functions}"
SCRIPTSFUNCTDIR="${SCRIPTSAPPFUNCTDIR:-/usr/local/share/CasjaysDev/scripts}"
SCRIPTSFUNCTFILE="${SCRIPTSAPPFUNCTFILE:-app-installer.bash}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ -f "$SCRIPTSFUNCTDIR/functions/$SCRIPTSFUNCTFILE" ]; then
  . "$SCRIPTSFUNCTDIR/functions/$SCRIPTSFUNCTFILE"
elif [ -f "$HOME/.local/share/CasjaysDev/functions/$SCRIPTSFUNCTFILE" ]; then
  . "$HOME/.local/share/CasjaysDev/functions/$SCRIPTSFUNCTFILE"
else
  curl -LSs "$SCRIPTSFUNCTURL/$SCRIPTSFUNCTFILE" -o "/tmp/$SCRIPTSFUNCTFILE" || exit 1
  . "/tmp/$SCRIPTSFUNCTFILE"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
user_installdirs

# OS Support: supported_os unsupported_oses

unsupported_oses

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make sure the scripts repo is installed

scripts_check

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Defaults
APPNAME="${APPNAME:-vim}"
APPDIR="${APPDIR:-$HOME/.config/$APPNAME}"
REPO="${DFMGRREPO:-https://github.com/dfmgr}/${APPNAME}"
REPORAW="${REPORAW:-$REPO/raw}"
APPVERSION="$(curl -LSs $REPORAW/master/version.txt)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Setup plugins

PLUGNAMES="Vundle vim-fugitive vim-airline vim-airline-themes "
PLUGDIR="${SHARE:-$HOME/.local/share}/$APPNAME/bundle"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# dfmgr_install fontmgr_install iconmgr_install pkmgr_install systemmgr_install thememgr_install wallpapermgr_install

dfmgr_install

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Version

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Script options IE: --help

show_optvars "$@"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Do not update

#systemmgr_noupdate

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Requires root - no point in continuing

#sudoreq  # sudo required
#sudorun  # sudo optional

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# end with a space

APP="$APPNAME ctags "
PERL=""
PYTH="pip "
PIPS="msgpack neovim pynvim wakatime "
CPAN=""
GEMS=""

# install packages - useful for package that have the same name on all oses
install_packages $APP

# install required packages using file
install_required $APP

# check for perl modules and install using system package manager
install_perl $PERL

# check for python modules and install using system package manager
install_python $PYTH

# check for pip binaries and install using python package manager
install_pip $PIPS

# check for cpan binaries and install using perl package manager
install_cpan $CPAN

# check for ruby binaries and install using ruby package manager
install_gem $GEMS

# Other dependencies
dotfilesreq git
dotfilesreqadmin

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ensure directories exist

ensure_dirs
ensure_perms

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Main progam

if [ -d "$APPDIR/.git" ]; then
  execute \
  "git_update $APPDIR" \
  "Updating $APPNAME configurations"
else
  execute \
  "backupapp && \
        git_clone -q $REPO/$APPNAME $APPDIR" \
  "Installing $APPNAME configurations"
fi

# exit on fail
failexitcode

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Plugins

if [ "$PLUGNAMES" != "" ]; then
  if [ -d "$PLUGDIR"/Vundle.vim/.git ]; then
    execute \
    "git_update $PLUGDIR/Vundle.vim" \
    "Updating plugin Vundle.vim"
  else
    execute \
    "git_clone https://github.com/VundleVim/Vundle.vim.git $PLUGDIR/Vundle.vim" \
    "Installing plugin Vundle.vim"
  fi
fi

if [ -d "$PLUGDIR/vim-fugitive/.git" ]; then
  execute \
  "git_update $PLUGDIR/vim-fugitive" \
  "Updating vim-fugitive"
else
  execute \
  "git_clone https://github.com/tpope/vim-fugitive $PLUGDIR/vim-fugitive" \
  "Installing vim-fugitive"
fi

if [ -d "$PLUGDIR/vim-airline/.git" ]; then
  execute \
  "git_update $PLUGDIR/vim-airline" \
  "Updating vim-airline"
else
  execute \
  "git_clone https://github.com/vim-airline/vim-airline $PLUGDIR/vim-airline" \
  "Installing vim-airline"
fi

if [ -d "$PLUGDIR/vim-airline-themes/.git" ]; then
  execute \
  "git_update $PLUGDIR/vim-airline-themes" \
  "Updating vim-airline-themes"
else
  execute \
  "git_clone https://github.com/vim-airline/vim-airline-themes $PLUGDIR/vim-airline-themes" \
  "Installing vim-airline-themes"
fi

# exit on fail
failexitcode

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# run post install scripts

run_postinst() {
  dfmgr_run_post
  if [ ! -L "$HOME/.vimrc" ]; then
     ln_sf "$APPDIR/vimrc" "$HOME/.vimrc"
  fi
  devnull2 vim -u "$APPDIR/plugins.vimrc" "+BundleInstall" +qall < /dev/null
  devnull2 vim -u "$APPDIR/plugins.vimrc" "+PluginInstall" +qall < /dev/null
  devnull2 vim -u "$APPDIR/plugins.vimrc" "+PluginClean" +qall < /dev/null
}

execute \
"run_postinst" \
"Running post install scripts"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# create version file

dfmgr_install_version

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# exit
run_exit

# end

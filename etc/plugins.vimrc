"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"##@Version       : 202605122018-git
"# @Author        : Jason
"# @Contact       : jason@casjaysdev.pro
"# @License       : WTFPL
"# @ReadME        : vim --help
"# @Copyright     : Copyright (c) 2021, Casjays Developments
"# @Created       : Friday Mar 26, 2021 03:55:55 EDT
"# @File          : plugins.vimrc
"# @Description   : VIM Plugin management (vim-plug) (vim-plug)
"# @TODO          :
"# @Other         :
"# @Resource      :
"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"
" NOTE: This file is normally sourced from vimrc AFTER:
"   - set nocompatible
"   - filetype off
"   - directory creation
" And BEFORE:
"   - filetype plugin indent on
"   - syntax on
"   - all other settings
"
" It is ALSO run standalone by install.sh ("vim -es -u plugins.vimrc"), and a
" standalone Vim starts in 'compatible' mode. Under 'compatible' the default
" 'cpoptions' disables leading-backslash line continuation, so plugins that
" use it (vim-fugitive) fail with "E10: \ should be followed by /, ? or &".
" nocompatible below is therefore required for the standalone path, and is a
" no-op when vimrc has already set it.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:plug_home = expand('$HOME/.local/share/vim/plugged')
" Vim requires autoload-style functions (plug#begin, plug#end, ...) to live
" in a file named exactly plug.vim -- E746 otherwise. So do NOT source it as
" 'vim-plug.vim'; drop it in autoload/ and let 'runtimepath' autoload it.
let s:plug_root = expand('$HOME/.local/share/vim')
let s:plug_autoload = s:plug_root . '/autoload'
let s:vim_plug = s:plug_autoload . '/plug.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Install vim-plug if not present
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !filereadable(s:vim_plug)
  echom "Downloading vim-plug to manage plugins..."
  call mkdir(s:plug_home, 'p', 0700)
  call mkdir(s:plug_autoload, 'p', 0700)
  " git clone treats a trailing path as a DIRECTORY, so clone to a temp dir
  " and then move plug.vim into autoload/. Clear any earlier broken attempt
  " first so a stale directory cannot wedge future runs.
  if isdirectory(s:vim_plug)
    call delete(s:vim_plug, 'rf')
  endif
  let s:tmp = s:plug_home . '/.vim-plug.tmp'
  call delete(s:tmp, 'rf')
  call system('git clone --quiet --depth 1 https://github.com/junegunn/vim-plug.git "' . s:tmp . '"')
  if filereadable(s:tmp . '/plug.vim')
    call rename(s:tmp . '/plug.vim', s:vim_plug)
  endif
  call delete(s:tmp, 'rf')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoload/plug.vim is picked up from 'runtimepath' automatically. The rtp
" entry must be the plugin ROOT that CONTAINS autoload/ -- Vim resolves
" <rtp-entry>/autoload/plug.vim, so adding the autoload dir itself yields
" E117. Note also that exists('*plug#begin') is not a valid test: exists()
" never triggers autoload, so an unloaded vim-plug looks absent.
if filereadable(s:vim_plug) && isdirectory(s:plug_root)
  execute 'set runtimepath^=' . fnameescape(s:plug_root)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin runtimepath additions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.local/share/vim/plugged/vim-sneak
set rtp+=~/.local/share/vim/plugged/powerline/powerline/bindings/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Define plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug#begin must wrap the Plug declarations: it initialises g:plugs and
" defines the PlugInstall/PlugUpdate/PlugClean commands. Without it the
" Plug lines below error out and nothing is ever installed. Calling it here
" is also what triggers the autoload of autoload/plug.vim.
try
  call plug#begin(s:plug_home)
catch
  echom "vim-plug failed to load (" . v:exception . "); skipping plugin installation"
  let g:plug_broken = 1
endtry

" If vim-plug is unavailable, stub out the Plug command so the declarations
" below are silently discarded instead of throwing 57x E492. A broken plugin
" manager must never take the rest of the vim config down with it.
" NOTE: do NOT define a plug#end() stub here -- Vim enforces E746 for
" autoload-style names outside a file named plug.vim, which is the very
" error this layout is avoiding. The real plug#end() call is guarded below.
if get(g:, 'plug_broken', 0)
  command! -nargs=* Plug
endif

" Plugin manager
Plug 'junegunn/vim-plug'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" File navigation
Plug 'scrooloose/nerdtree', { 'as': 'NERTree' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'airblade/vim-rooter'

" UI enhancements
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tinted-theming/base16-vim'

" Code editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Completion
Plug 'Shougo/ddc.vim'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'shawncplus/phpcomplete.vim'
Plug 'thesis/vim-solidity'
Plug 'ekalinin/Dockerfile.vim'

" Markdown/Wiki
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

" Search/Navigation
Plug 'mileszs/ack.vim'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

" Templates/Headers
Plug 'tibabit/vim-templates'
Plug 'alpertuna/vim-header'

" Utilities
Plug 'xolox/vim-misc'
Plug 'chrisbra/unicode.vim'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'vim-scripts/bash-support.vim'
Plug 'lifepillar/vim-colortemplate'
Plug 'wakatime/vim-wakatime'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" edkolev/tmuxline.vim is deliberately NOT installed. It hooks VimEnter and
" rewrites the tmux status option, which stomps on a hand-rolled statusline.
Plug 'tmux-plugins/vim-tmux-focus-events'

" Python-dependent plugins
if has('python3') || has('python')
  Plug 'sirver/ultisnips'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp'
endif

if !get(g:, 'plug_broken', 0)
  call plug#end()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Post-plugin settings (minimal)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snipMate = {'snippet_version': 1}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End plugins.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

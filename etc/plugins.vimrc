"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"##@Version       : 202103260355-git
"# @Author        : Jason
"# @Contact       : jason@casjaysdev.pro
"# @License       : WTFPL
"# @ReadME        : vim --help
"# @Copyright     : Copyright (c) 2021, Casjays Developments
"# @Created       : Friday Mar 26, 2021 03:55:55 EDT
"# @File          : plugins.vimrc
"# @Description   : VIM Plugin management
"# @TODO          :
"# @Other         :
"# @Resource      :
"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"
" NOTE: This file is sourced from vimrc AFTER:
"   - set nocompatible
"   - filetype off
"   - directory creation
" And BEFORE:
"   - filetype plugin indent on
"   - syntax on
"   - all other settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin runtimepath
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.local/share/vim/bundle
set rtp+=~/.local/share/vim/bundle/Vundle.vim
set rtp+=~/.local/share/vim/bundle/powerline/powerline/bindings/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Install Vundle if not present
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(expand('~/.local/share/vim/bundle/Vundle.vim/.gitignore'))
    echom "Downloading Vundle to manage plugins..."
    silent !git clone -q "https://github.com/dfvim/Vundle.vim" ~/.local/share/vim/bundle/Vundle.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Define plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin('~/.local/share/vim/bundle')

" Plugin manager
Plugin 'dfvim/Vundle.vim'

" Git integration
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" File navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'airblade/vim-rooter'

" UI enhancements
Plugin 'mhinz/vim-startify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'luochen1990/rainbow'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'chriskempson/base16-vim'

" Code editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'Chiel92/vim-autoformat'
Plugin 'editorconfig/editorconfig-vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Completion
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/ddc.vim'

" Language support
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-python/python-syntax'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'ekalinin/Dockerfile.vim'

" Markdown/Wiki
Plugin 'plasticboy/vim-markdown'
Plugin 'vimwiki/vimwiki'
Plugin 'parkr/vim-jekyll'

" Search/Navigation
Plugin 'mileszs/ack.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'unblevable/quick-scope'

" Templates/Headers
Plugin 'tibabit/vim-templates'
Plugin 'alpertuna/vim-header'
Plugin 'vitalk/vim-shebang'

" Utilities
Plugin 'xolox/vim-misc'
Plugin 'chrisbra/unicode.vim'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier'
Plugin 'chauncey-garrett/vim-tasklist'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'wolfgangmehner/vim-support'
Plugin 'jvanja/vim-bootstrap4-snippets'
Plugin 'lifepillar/vim-colortemplate'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'baskerville/vim-sxhkdrc'
Plugin 'wakatime/vim-wakatime'
Plugin 'chazy/dirsettings'

" Tmux integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Python-dependent plugins
if (has('python3') || has('python'))
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'sirver/ultisnips'
    Plugin 'roxma/vim-hug-neovim-rpc'
    Plugin 'roxma/nvim-yarp'
endif

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Post-plugin settings (minimal)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snipMate = { 'snippet_version' : 1 }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End plugins.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

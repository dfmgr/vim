"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"##@Version       : 202103260355-git
"# @Author        : Jason
"# @Contact       : jason@casjaysdev.pro
"# @License       : WTFPL
"# @ReadME        : vim --help
"# @Copyright     : Copyright (c) 2021, Casjays Developments
"# @Created       : Friday Mar 26, 2021 03:55:55 EDT
"# @File          : vimrc
"# @Description   : VIM Plugin settings
"# @TODO          : Split into individual settings
"# @Other         :
"# @Resource      :
"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.local/share/vim
set rtp+=~/.local/share/vim/plugged
set rtp+=~/.local/share/vim/bundle/powerline/powerline/bindings/vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('unix')
    if filereadable(glob("/usr/bin/bash"))
        set shell=/usr/bin/bash
    elseif filereadable(glob("/bin/bash"))
        set shell=/bin/bash
    endif
elseif has('darwin')
    if filereadable(glob("/usr/local/bin/bash"))
        set shell=/usr/local/bin/bash
    elseif filereadable(glob("/bin/bash"))
        set shell=/bin/bash
    elseif filereadable(glob("/bin/zsh"))
        set shell=/bin/zsh
    endif
endif

set nocompatible
filetype off
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python version
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
    let g:powerline_pycmd="py3"
    let g:python3_host_prog = "/usr/bin/python3"
elseif has('python')
    let g:UltiSnipsUsePythonVersion = 2
    let g:powerline_pycmd="py"
    let g:python_host_prog = "/usr/bin/python2"
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-install vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.local/share/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins with lazy loading
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/vim/plugged')

" Core plugins - always load
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'luochen1990/rainbow'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" File navigation - lazy load
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Git - lazy load
Plug 'jreybert/vimagit', { 'on': 'Magit' }

" Language support - lazy load by filetype
Plug 'sheerun/vim-polyglot'
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript', 'typescript'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'vim-scripts/bash-support.vim', { 'for': 'sh' }
Plug 'baskerville/vim-sxhkdrc', { 'for': 'sxhkdrc' }

" Completion - only one engine, lazy load
if has('python3')
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Snippets - lazy load on insert
Plug 'honza/vim-snippets'
if has('python3') || has('python')
    Plug 'sirver/ultisnips'
else
    Plug 'garbas/vim-snipmate', { 'on': [] }
    Plug 'MarcWeber/vim-addon-mw-utils', { 'on': [] }
    Plug 'tomtom/tlib_vim', { 'on': [] }
endif
Plug 'jvanja/vim-bootstrap4-snippets', { 'for': 'html' }

" Formatting - lazy load
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'json', 'markdown'] }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Markdown and docs - lazy load
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
Plug 'parkr/vim-jekyll', { 'for': 'markdown' }

" Utilities - lazy load
Plug 'scrooloose/nerdcommenter', { 'on': '<Plug>NERDCommenterToggle' }
Plug 'chauncey-garrett/vim-tasklist', { 'on': '<Plug>TaskList' }
Plug 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plug 'alpertuna/vim-header', { 'on': 'AddHeader' }
Plug 'tibabit/vim-templates', { 'on': 'TemplateExpand' }
Plug 'vitalk/vim-shebang'
Plug 'chrisbra/unicode.vim', { 'on': 'UnicodeTable' }
Plug 'dbeniamine/cheat.sh-vim', { 'on': 'Cheat' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Misc - rarely used
Plug 'chazy/dirsettings'
Plug 'chriskempson/base16-vim', { 'on': [] }
Plug 'lifepillar/vim-colortemplate', { 'on': [] }
Plug 'xolox/vim-misc'
Plug 'wolfgangmehner/vim-support', { 'on': [] }
Plug 'vim-scripts/taglist.vim', { 'for': ['c', 'cpp', 'java'] }
Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' }
Plug 'wakatime/vim-wakatime'

call plug#end()

let g:snipMate = { 'snippet_version' : 1 }

syntax enable
set number
set ts=2
set autoindent
set expandtab
set shiftwidth=2
set cursorline
set showmatch
set hlsearch
set incsearch
set colorcolumn=120

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'

    " fuzzy finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    call plug#end()

    let g:airline_powerline_fonts = 0
    colorscheme elflord

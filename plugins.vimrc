"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

if has('unix')
    set shell=/bin/bash
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python version
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has('python3') || has('pythonx'))
    let g:UltiSnipsUsePythonVersion = 3"
    let g:powerline_pycmd="py3"
    let g:python3_host_prog = "/usr/bin/python3"
    set pyxversion=3
    set pyx=3
elseif has('python')
    let g:UltiSnipsUsePythonVersion = 2"
    let g:powerline_pycmd="py"
    let g:python_host_prog = "/usr/bin/python2"
    set pyx=2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check plugins and install if needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(expand('~/.local/share/vim/bundle/vim-fugitive/.gitignore'))
    echo "installing vim-fugitive..."
    silent !git clone -q "https://github.com/tpope/vim-fugitive" ~/.local/share/vim/bundle/vim-fugitive
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline/.gitignore'))
    echo "installing vim-airline..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline" ~/.local/share/vim/bundle/vim-airline
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline-themes/.gitignore'))
    echo "installing vim-airline-themes..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline-themes" ~/.local/share/vim/bundle/vim-airline-themes
endif

if ! filereadable(expand('~/.local/share/vim/bundle/Vundle.vim/.gitignore'))
    echo "Downloading Vundle to manage plugins..."
    silent !git clone -q "https://github.com/VundleVim/Vundle.vim" ~/.local/share/vim/bundle/Vundle.vim
    silent !vim +PluginInstall +qall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.local/share/vim/bundle
set rtp+=~/.local/share/vim/bundle/Vundle.vim
set rtp+=~/.local/share/vim/bundle/powerline/powerline/bindings/vim

call vundle#begin('~/.local/share/vim/bundle')

Plugin 'VundleVim/Vundle.vim'               "plugin manager
Plugin 'airblade/vim-gitgutter'             "shows a git diff in the gutter
Plugin 'airblade/vim-rooter'                "Changes working directory to project root
Plugin 'alpertuna/vim-header'               "Easily adds brief author info and license headers
Plugin 'ap/vim-css-color'                   "Preview colours in source code
Plugin 'artur-shaik/vim-javacomplete2'      "omni-completion plugin for Java
Plugin 'chazy/dirsettings'                  "directory tree-specific settings
Plugin 'Chiel92/vim-autoformat'             "Format code with one button press
Plugin 'chriskempson/base16-vim'            "base16 theme
Plugin 'christoomey/vim-tmux-navigator'     "Seamless navigation between tmux panes and vim splits
Plugin 'ctrlpvim/ctrlp.vim'                 "Fuzzy file, buffer, mru, tag, etc finder
Plugin 'editorconfig/editorconfig-vim'      "EditorConfig plugin for Vim
Plugin 'edkolev/tmuxline.vim'               "Simple tmux statusline
Plugin 'godlygeek/tabular'                  "Vim script for text filtering and alignment
Plugin 'HerringtonDarkholme/yats.vim'       "TypeScript Syntax Highlighting
Plugin 'jiangmiao/auto-pairs'               "Insert or delete brackets
Plugin 'jistr/vim-nerdtree-tabs'            "NERDTree and tabs together
Plugin 'jreybert/vimagit'                   "Ease your git workflow
Plugin 'junegunn/fzf'                       "A command-line fuzzy finder
Plugin 'klen/python-mode'                   "PyLint, Rope, Pydoc, breakpoints
Plugin 'mattn/emmet-vim'                    "emmet
Plugin 'mhinz/vim-startify'                 "The fancy start screen
Plugin 'mileszs/ack.vim'                    "Vim plugin for the Perl module
Plugin 'plasticboy/vim-markdown'            "Syntax highlighting, matching rules and mappings
Plugin 'powerline/powerline'                "statusline plugin
Plugin 'prettier/vim-prettier'              "A vim plugin wrapper for prettier
Plugin 'scrooloose/nerdtree'                "A tree explorer plugin for vim
Plugin 'scrooloose/syntastic'               "Syntax checking hacks for vim
Plugin 'chauncey-garrett/vim-tasklist'      "based on the eclipse Task List
Plugin 'scrooloose/nerdcommenter'           "
Plugin 'sheerun/vim-polyglot'               "
Plugin 'shawncplus/phpcomplete.vim'         "
Plugin 'Shougo/neocomplete.vim'             "
Plugin 'terryma/vim-multiple-cursors'       "
Plugin 'tibabit/vim-templates'              "
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tmux-plugins/vim-tmux-focus-events' "
Plugin 'tomlion/vim-solidity'               "
Plugin 'tpope/vim-fugitive'                 "
Plugin 'tpope/vim-surround'                 "
Plugin 'vim-airline/vim-airline'            "
Plugin 'vim-airline/vim-airline-themes'     "
Plugin 'vim-python/python-syntax'           "
Plugin 'vim-scripts/bash-support.vim'       "
Plugin 'vim-scripts/taglist.vim'            "
Plugin 'vim-scripts/TaskList.vim'           "
Plugin 'vimwiki/vimwiki'                    "
Plugin 'wolfgangmehner/vim-support'         "
Plugin 'xolox/vim-misc'                     "
Plugin 'Xuyuanp/nerdtree-git-plugin'        "
Plugin 'lifepillar/vim-colortemplate'       " color template
Plugin 'dracula/vim', { 'name': 'dracula'  }
Plugin 'MarcWeber/vim-addon-mw-utils'       "
Plugin 'dbeniamine/cheat.sh-vim'            "
Plugin 'honza/vim-snippets'				    "snippets
Plugin 'roxma/nvim-yarp'                    "required for deoplete
Plugin 'roxma/vim-hug-neovim-rpc'           "required for deoplete
Plugin 'vitalk/vim-shebang'                 "set shebang line
Plugin 'chrisbra/unicode.vim'               "Unicode glyphs
Plugin 'ryanoasis/vim-devicons'             "Adds file type icons to Vim plugins
Plugin 'baskerville/vim-sxhkdrc'            "syntax for sxhkd's configuration files
Plugin 'parkr/vim-jekyll'                   "Blogging from the command line

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  "asynchronous completion framework

if (has('python') || has('python3'))
    Plugin 'sirver/ultisnips'               "
"  if has('python3')
"      Plugin 'Valloric/YouCompleteMe', { 'do': 'cd ~/.local/share/vim/bundle/YouCompleteMe ; git submodule update --init --recursive ; python3 ./install.py' }
"  elseif has('python')
"      Plugin 'Valloric/YouCompleteMe', { 'do': 'cd ~/.local/share/vim/bundle/YouCompleteMe ; git submodule update --init --recursive ; python2. /install.py' }
endif
    Plugin 'garbas/vim-snipmate'
    Plugin 'tomtom/tlib_vim' "required for snipmate
call vundle#end()


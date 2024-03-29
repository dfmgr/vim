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
set rtp+=~/.local/share/vim/bundle
set rtp+=~/.local/share/vim/bundle/Vundle.vim
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
    let g:UltiSnipsUsePythonVersion = 3"
    let g:powerline_pycmd="py3"
    let g:python3_host_prog = "/usr/bin/python3"
elseif has('python')
    let g:UltiSnipsUsePythonVersion = 2"
    let g:powerline_pycmd="py"
    let g:python_host_prog = "/usr/bin/python2"
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check plugins and install if needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(expand('~/.local/share/vim/bundle/Vundle.vim/.gitignore'))
    echoe "Downloading Vundle to manage plugins..."
    silent !git clone -q "https://github.com/dfvim/Vundle.vim" ~/.local/share/vim/bundle/Vundle.vim
    silent !vim +PluginInstall +qall
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-fugitive/.gitignore'))
    echoe "installing vim-fugitive..."
    silent !git clone -q "https://github.com/tpope/vim-fugitive" ~/.local/share/vim/bundle/vim-fugitive
    silent !vim +PluginInstall +qall
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline/.gitignore'))
    echoe "installing vim-airline..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline" ~/.local/share/vim/bundle/vim-airline
    silent !vim +PluginInstall +qall
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline-themes/.gitignore'))
    echoe "installing vim-airline-themes..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline-themes" ~/.local/share/vim/bundle/vim-airline-themes
    silent !vim +PluginInstall +qall
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin('~/.local/share/vim/bundle')
Plugin 'dfvim/Vundle.vim'                                        " plugin manager
Plugin 'airblade/vim-gitgutter'                                  " shows a git diff in the gutter
Plugin 'airblade/vim-rooter'                                     " Changes working directory to project root
Plugin 'alpertuna/vim-header'                                    " Easily adds brief author info and license headers
Plugin 'ap/vim-css-color'                                        " Preview colours in source code
Plugin 'artur-shaik/vim-javacomplete2'                           " omni-completion plugin for Java
Plugin 'chazy/dirsettings'                                       " directory tree-specific settings
Plugin 'Chiel92/vim-autoformat'                                  " Format code with one button press
Plugin 'chriskempson/base16-vim'                                 " base16 theme
Plugin 'christoomey/vim-tmux-navigator'                          " Seamless navigation between tmux panes and vim splits
Plugin 'ctrlpvim/ctrlp.vim'                                      " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'editorconfig/editorconfig-vim'                           " EditorConfig plugin for Vim
Plugin 'edkolev/tmuxline.vim'                                    " Simple tmux statusline
Plugin 'godlygeek/tabular'                                       " Vim script for text filtering and alignment
Plugin 'HerringtonDarkholme/yats.vim'                            " TypeScript Syntax Highlighting
Plugin 'jiangmiao/auto-pairs'                                    " Insert or delete brackets
Plugin 'jistr/vim-nerdtree-tabs'                                 " NERDTree and tabs together
Plugin 'jreybert/vimagit'                                        " Ease your git workflow
Plugin 'junegunn/fzf'                                            " A command-line fuzzy finder
Plugin 'klen/python-mode'                                        " PyLint, Rope, Pydoc, breakpoints
Plugin 'mattn/emmet-vim'                                         " emmet
Plugin 'mhinz/vim-startify'                                      " The fancy start screen
Plugin 'mileszs/ack.vim'                                         " Vim plugin for the Perl module
Plugin 'plasticboy/vim-markdown'                                 " Syntax highlighting, matching rules and mappings
Plugin 'prettier/vim-prettier'                                   " A vim plugin wrapper for prettier
Plugin 'scrooloose/nerdtree'                                     " A tree explorer plugin for vim
Plugin 'chauncey-garrett/vim-tasklist'                           " based on the eclipse Task List
Plugin 'scrooloose/nerdcommenter'                                "
Plugin 'sheerun/vim-polyglot'                                    "
Plugin 'shawncplus/phpcomplete.vim'                              "
Plugin 'Shougo/neocomplete.vim'                                  "
Plugin 'terryma/vim-multiple-cursors'                            "
Plugin 'tibabit/vim-templates'                                   "
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'                 "
Plugin 'tmux-plugins/vim-tmux-focus-events'                      "
Plugin 'tomlion/vim-solidity'                                    "
Plugin 'tpope/vim-fugitive'                                      "
Plugin 'tpope/vim-surround'                                      "
Plugin 'tpope/vim-commentary'                                    "
Plugin 'luochen1990/rainbow'                                     " Rainbow Parentheses Improved
Plugin 'vim-airline/vim-airline'                                 "
Plugin 'vim-airline/vim-airline-themes'                          "
Plugin 'vim-python/python-syntax'                                "
Plugin 'vim-scripts/bash-support.vim'                            "
Plugin 'jvanja/vim-bootstrap4-snippets'                          "
Plugin 'vim-scripts/taglist.vim'                                 "
Plugin 'vim-scripts/TaskList.vim'                                "
Plugin 'vimwiki/vimwiki'                                         "
Plugin 'wolfgangmehner/vim-support'                              "
Plugin 'xolox/vim-misc'                                          "
Plugin 'Xuyuanp/nerdtree-git-plugin'                             "
Plugin 'lifepillar/vim-colortemplate'                            " color template
Plugin 'MarcWeber/vim-addon-mw-utils'                            " interpret a file by function
Plugin 'dbeniamine/cheat.sh-vim'                                 " access cheat.sh sheets
Plugin 'honza/vim-snippets'                                      " snippets
Plugin 'vitalk/vim-shebang'                                      " set shebang line
Plugin 'chrisbra/unicode.vim'                                    " Unicode glyphs
Plugin 'ryanoasis/vim-devicons'                                  " Adds file type icons to Vim plugins
Plugin 'baskerville/vim-sxhkdrc'                                 " syntax for sxhkd's configuration files
Plugin 'parkr/vim-jekyll'                                        " Blogging from the command line
Plugin 'justinmk/vim-sneak'                                      "
Plugin 'unblevable/quick-scope'                                  "
Plugin 'dracula/vim', { 'name': 'dracula'  }                     " Dracula theme
Plugin 'wakatime/vim-wakatime'                                   " plugin for productivity metrics
Plugin 'ervandew/supertab'                                       " Supertab is a vim plugin which allows you to use <Tab>
Plugin 'Shougo/ddc.vim'                                          " asynchronous completion framework
Plugin 'roxma/nvim-yarp'                                         " required for deoplete
Plugin 'garbas/vim-snipmate'                                     " snippets
Plugin 'tomtom/tlib_vim'                                         " required for vim-snipmate
Plugin 'davidhalter/jedi-vim'                                    " awesome Python autocompletion
Plugin 'ekalinin/Dockerfile.vim'                                 " Docker snippets

if (has('python3') || has('python'))
    Plugin 'Shougo/deoplete.nvim'                                " asynchronous completion framework
    Plugin 'sirver/ultisnips'                                    "
    Plugin 'roxma/vim-hug-neovim-rpc'                            " required for deoplete
endif

call vundle#end()

let g:snipMate = { 'snippet_version' : 1 }

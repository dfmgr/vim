"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set vim home
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:vimdir = $HOME . '/.config/vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python version
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('python3')
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
" => create directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("*mkdir")
    for dir in ["templates", "spell", "plugin", "snippets", ".undo", ".backup", ".swp", ".info"]
        if !isdirectory($HOME . "/.config/vim/" . dir)
            call mkdir($HOME . "/.config/vim/" . dir)
        endif
    endfor
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Include plugins and install if needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(glob("~/.config/vim/plugins.vimrc"))
     source ~/.config/vim/plugins.vimrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath+=~/.config/vim/
set undodir=~/.config/vim/.undo//
set backupdir=~/.config/vim/.backup//
set directory=~/.config/vim/.swp//
set viminfo+=n~/.config/vim/.info/viminfo

set term=xterm-256color

if has('unix')
    set shell=/bin/bash
endif

set nocompatible
filetype plugin indent on
syntax on
set autoindent
set autoread
set backup
set clipboard^=unnamed,unnamedplus
set colorcolumn=+3
set complete=.,w,b,u,t,i,kspell
set completeopt=menu,preview,longest
set cursorline
set encoding=UTF-8
set expandtab
set ffs=unix,mac,dos
set hlsearch
set incsearch
set magic
set noconfirm
set nopaste
set number
set path+=**
set relativenumber
set ruler
set scrolloff=8
set shiftwidth=2
set showcmd
set showmatch
set smartindent
set softtabstop=2
set swapfile
set t_Co=256
set tabstop=2
set textwidth=120
set title
set undofile
set wildmenu
set wildmode=longest,list,full

au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
set background=dark
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=yellow guifg=yellow
highlight SpecialKey ctermfg=grey guifg=grey70
highlight link javascriptType Keyword

"hi LineNr ctermfg=242
"hi CursorLineNr ctermfg=242
set guifont=Hack\ Nerd\ Font\ 10

if has('gui_running')
     colorscheme dracula
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader='\'
let mapleader=' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow splitright
let g:minimap_highlight='visual'
let g:python_highlight_all = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startupify configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_enable_special = 10
let g:startify_files_number = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args="-e SC2059,SC2148,SC2027,SC2034,SC2086"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmd vimenter * NERDTree
map <C-z> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_synchronize_view = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snipMate = get(g:, 'snipMate', {})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetsDir="~/.config/vim/snippets"
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=r
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
map <leader>c "+y
map <leader>v "+p
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => When shortcut files are updated, renew bash and vifm configs with new material:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disables automatic commenting on newline:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Run xrdb whenever Xdefaults or Xresources are updated.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup markdown
    autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
    autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
    autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
    autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
    autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
    autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_follow_anchor = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-MULTIPLE-CURSORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = '<C-a>'
"let g:multi_cursor_select_all_word_key = '<A-a>'
"let g:multi_cursor_start_key           = 'g<SC-a>'
"let g:multi_cursor_select_all_key      = 'g<SA-a>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => go to last known place
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'racket': 'racket'}
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_headers = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-jekyll : Blogging from the command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:jekyll_post_extension = '.md'
let g:jekyll_post_filetype = 'markdown'
let g:jekyll_post_dirs = ['_posts']
let g:jekyll_site_dir = '_site'
let g:jekyll_build_command = 'jekyll --no-auto --no-server'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tasklist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>tl <Plug>TaskList
let g:tlTokenList = ['FIXME', 'TODO', 'XXX', 'HACK', 'WIP']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

"let blacklist = ['xml', 'conf']
"autocmd FileType vim,tex,xml let b:autoformat_autoindent=0
"autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ensure files are read as what I want:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile,FileType *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile,FileType *.tex set filetype=tex
autocmd BufRead,BufNewFile,FileType *.md set filetype=markdown syntax=markdown
autocmd BufRead,BufNewFile,FileType *.lua set filetype=lua
autocmd BufRead,BufNewFile,FileType *.perl,*.pl,*.cgi set filetype=perl
autocmd BufRead,BufNewFile,FileType *.py,*.pyc set filetype=python
autocmd BufRead,BufNewFile,FileType *.php,*.php5,*.php7 set filetype=php
autocmd BufRead,BufNewFile,FileType *.txt set filetype=text
autocmd BufRead,BufNewFile,FileType *.cnf,*.conf,*.cfg set filetype=conf
autocmd BufRead,BufNewFile,FileType notes set syntax=markdown
autocmd BufRead,BufNewFile,FileType vimwiki set syntax=markdown
autocmd BufRead,BufNewFile,FileType *scratch* set filetype=text syntax=text
autocmd BufRead,BufNewFile,FileType /tmp/calcurse*,~/.local/share/editors/calcurse/* set filetype=markdown syntax=markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Shebang lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup shebanglines
    autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
    autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
    autocmd BufNewFile *.js 0put =\"#!/usr/bin/env nodejs\<nl>\"|$
augroup END

AddShebangPattern! shell ^#!.*\s\+sh\>
AddShebangPattern! shell ^#!.*\s\+bash\>
AddShebangPattern! javascript ^#!.*\s\+node\>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set spelllang=en_us
set complete+=kspell

map <F7> :setlocal spell! spelllang=en_us<CR>

"vim -c ":mkspell! ~/.config/vim/spell/en.utf-8.add" -c q  # run from shell
":mkspell! ~/.config/vim/spell/en.utf-8.add                # run from vim
if filereadable(glob("~/.config/vim/spell/en.utf-8.add"))
     set spellfile=~/.config/vim/spell/en.utf-8.add
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save as root
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => create directory on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => remove whitespaces on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

let noStripWhiteSpaceTypes = ['markdown', 'notes', 'vimwiki', '*.md']
autocmd BufWritePre * if index(noStripWhiteSpaceTypes, &ft) < 0 | call StripTrailingWhitespace() | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => useful functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd InsertEnter * set colorcolumn=120
autocmd InsertLeave * set colorcolumn=""
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  tmuxline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'full'

if exists("$TMUX")
    " Get the environment variable
    let tmux_pane_name_cmd = 'tmux display -p \#D'
    let tmux_pane_name = substitute(system(g:tmux_pane_name_cmd), "\n", "", "")
    let tmux_env_var = "TMUX_PWD_" . substitute(g:tmux_pane_name, "%", "", "")
    unlet tmux_pane_name tmux_pane_name_cmd
    function! BroadcastTmuxCwd()
        let filename = substitute(expand("%:p:h"), $HOME, "~", "")
        let output = system("tmux setenv -g ".g:tmux_env_var." ".l:filename)
    endfunction
    autocmd BufEnter * call BroadcastTmuxCwd()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2
set t_Co=256
let g:rehash256 = 1
let g:airline_theme='violet'
let g:airline_section_c = '%F'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1

function! ActiveStatus()
  let statusline=""
  let statusline.="%1*"
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%3*"
  let statusline.=""
  let statusline.="%4*"
  let statusline.="\ %<"
  let statusline.="%F"
  let statusline.="%{&modified?'\ \ +':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="%3*"
  let statusline.="\ "
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%1*"
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  set statusline.="%#warningmsg#"
  set statusline.="%{SyntasticStatuslineFlag()}"
  set statusline.="%*"

  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
  let statusline.="\ %<"
  let statusline.="%F"
  let statusline.="%{&modified?'\ \ +':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="\ \ "
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  set statusline.="%#warningmsg#"
  set statusline.="%{SyntasticStatuslineFlag()}"
  set statusline.="%*"

  return statusline
endfunction

set statusline=%!ActiveStatus()
hi User1 guibg=#afd700 guifg=#005f00
hi User2 guibg=#005f00 guifg=#afd700
hi User3 guibg=#222222 guifg=#005f00
hi User4 guibg=#222222 guifg=#d0d0d0

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
  autocmd ColorScheme dark if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
  autocmd ColorScheme dark if(&background=="dark") | hi User2 guibg=#005f00 guifg=#afd700 | endif
  autocmd ColorScheme dark if(&background=="dark") | hi User3 guibg=#222222 guifg=#005f00 | endif
  autocmd ColorScheme dark if(&background=="dark") | hi User4 guibg=#222222 guifg=#d0d0d0 | endif
  autocmd ColorScheme dark if(&background=="light") | hi User1 guibg=#afd700 guifg=#005f00 | endif
  autocmd ColorScheme dark if(&background=="light") | hi User2 guibg=#005f00 guifg=#afd700 | endif
  autocmd ColorScheme dark if(&background=="light") | hi User3 guibg=#707070 guifg=#005f00 | endif
  autocmd ColorScheme dark if(&background=="light") | hi User4 guibg=#707070 guifg=#d0d0d0 | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipmate : Specify this in your ~/.config/local/vimrc.local file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:author = expand($USER_FULLNAME)
let g:email = expand($USER_EMAIL)
let g:github = expand($USER_GITHUB)
let g:snips_author = expand($USER_FULLNAME)
let g:snips_email = expand($USER_EMAIL)
let g:snips_github = expand($USER_GITHUB)
nn <Leader>rs <esc>:exec ReloadAllSnippets()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bash-support.vim : Specify this in your ~/.config/local/vimrc.local file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:BASH_InsertFileHeader  = 'no'
let g:BASH_AlsoBash = [ '*.bash' , 'rc.*' ]
"let g:BASH_MapLeader  = ','

"let g:BASH_AuthorName   = 'Name'
"let g:BASH_AuthorRef    = 'Initials'
"let g:BASH_Email        = 'E-mail'
"let g:BASH_Company      = 'Company'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-templates : Specify this in your ~/.config/local/vimrc.local file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:today             = strftime('%a, %b %d, %Y, %H:%M')
let g:tmpl_search_paths = ['~/.config/vim/templates/custom']
let g:tmpl_license = 'WTFPL'
"let g:tmpl_license_file = ''
"let g:tmpl_author_name = ''
"let g:tmpl_author_email = ''
"let g:tmpl_company = ''
"let g:tmpl_author_hostname = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-header : Specify this in your ~/.config/local/vimrc.local file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:header_auto_add_header = 0
let g:header_field_timestamp_format = '%a, %b %d, %Y, %H:%M'
let g:header_field_license_id = 'WTFPL'
"let g:header_field_author = 'Your Name'
"let g:header_field_author_email = 'your@mail'
"let g:header_field_copyright = ''
"let g:header_field_modified_by = 0

augroup templates
    au BufNewFile * silent! 0r ~/.config/vim/templates/skeleton/%:e.template
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => overwrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => if vimrc.local then lets source that
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(glob("~/.config/local/vimrc.local"))
     source ~/.config/local/vimrc.local
endif


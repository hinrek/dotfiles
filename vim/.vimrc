" CHECK SYSTEM TYPE:
if !exists("g:os")
    if has("win62") || has("win32") || has("win32")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" SET CORRECT SHELL:
if g:os == "Darwin"
    set shell=/usr/local/bin/zsh
elseif g:os == "Linux"
    set shell=/bin/zsh
elseif g:os == "Windows"
    " For windoosa
endif

" turn vim into vim not vi
set nocompatible

" set encoding
set encoding=utf8


" NEEDED FOR VUNDLE:
filetype off
" VUNDLE STUFF:
" set the runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'conradirwin/vim-bracketed-paste'


" ALL PLUGINS BEFORE:
call vundle#end()

" CLIPBOARD:
if g:os == "Darwin"
    set clipboard=unnamed
endif

" BASIC CONFIG:
" enable line numbers and relative numbering
set number
set relativenumber
set ruler

" line numbers & relative numbers on normal and insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable syntax and plugins
syntax enable
filetype plugin indent on

" tabs & spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

" vim updatetime
set updatetime=250

" allways display the status line
set laststatus=2

" elite mode, no arrows!
let g:elite_mode=1

" highlight of the current line
set cursorline


" TRY TO REMOVE TIMEOUT DELAYS:
set timeoutlen=1000 ttimeoutlen=0


" THEME AND STYLE:
"set t_Co=256
" THEME BASED IN SHELL THEME:
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" BUFFERS:
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" <leader> = "\"
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>


" INDENT LINE:
" indentline color
let g:indentLine_setColors=0

" indent char
let g:indentLine_char = '▏'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'


" FIXES:
" enable italic font support
let g:solarized_term_italics=1

" powerline fonts for vim-airline
let g:airline_powerline_fonts=1

" set the airline theme
let g:airline_theme='base16'

" setting the correct bg for solarized airline
" let g:airline_solarized_bg='dark'

" enable/disable enchanced tabline
let g:airline#extensions#tabline#enable=1

" remove airline angle at the end
let g:airline_skip_empty_sections=1

" bufferline configuration
" denotes whether the active highlight should be used when there is only one buffer.
let g:bufferline_solo_highlight=1

" denotes whether bufferline should automatically echo to the command bar
let g:bufferline_echo=0


" SHOW LINE ENDINGS AND WHITESPACE:
set list
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<

" FINDING FILES:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer

" Search down into subfolders
" Provides tab-completion for all file-related tasks
"set path+=**
set path=$PWD/**

" Display all matching files when tab complete
set wildmenu


" TAG JUMPING:
" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under corsor
" - Use g^] for ambigous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for just this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestions list


" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_brose_split=4   " open in prio window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\(|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in a h-split/v-split/tab
" - check |netrw-browse-maps| for more mapping


" SNIPPETS:
" Read any empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a


" FIX BACKSPACE:
set backspace=indent,eol,start

" SPACE FOR FOLDING:
nnoremap <space> za

" NERD TREE:
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '▸'
let NERDTreeShowHidden=1

" GITGUTTER:
" Disable gitgutter automatic key mapping
let g:gitgutter_map_keys = 0

" ALE OUTOFIX ON SAVE:
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1


" ALE SYNTAX AUTOFIX:
" Put this in vimrc or a plugin file of your own.
let g:ale_fixers = {
\   'javascript': ['standard'],
\   'python': ['autopep8'],
\}

" ALE AIRLINE:
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1


" PYTHON STUFF:
au BufNewFile,BufRead *.py
    \ setlocal modeline
    \| setlocal tabstop=4
    \| setlocal softtabstop=4
    \| setlocal shiftwidth=4
    \| setlocal textwidth=79
    \| setlocal expandtab
    \| setlocal autoindent
    \| setlocal fileformat=unix

" PYTHON USE VIRTUALENV VENV:
let g:ycm_python_binary_path='./venv/bin/python'


" HTML CSS JAVASCRIPT:
au Filetype html,css,javascript
    \ setlocal tabstop=2
    \| setlocal softtabstop=2
    \| setlocal shiftwidth=2


"
" END:
"

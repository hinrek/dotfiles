" Use Vim settings, rather then Vi settings (much better!). This must be
" first, because it changes other options as a side effect.
set nocompatible

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

" ENCODING:
set encoding=utf8

" VUNDLE:
" Required for Vundle to work properly. Disabled file type detection.
filetype off

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
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'othree/html5.vim'


" ALL PLUGINS BEFORE:
call vundle#end()

" CLIPBOARD:
if g:os == "Darwin"
    set clipboard+=unnamed
endif

" BASIC CONFIG:
" enable line numbers and relative numbering
set number
set relativenumber
set ruler
set textwidth=79
set nowrap                      " Don't wrap lines.
set linebreak                   " Wrap lines when convenient. This doesn't effect text, only display.
set history=1000                " Store lots of :cmdline history.
set showcmd                     " Show incomplete cmds down the bottom.
set showmode                    " Show current mode down the bottom.
set hidden                      " Allow buffers to exist in the background.
set autoread                    " Reload files changed outside vim
set list                        " Display unprintable characters.
set listchars=tab:▸\ ,trail:·,eol:¬ " Make tabs, trailing whitespace, and EOL characters easy to spot.
syntax enable                   " Enable syntax highlighting.

" SEARCH SETTINGS:
set incsearch                   " Find the next match as we type the search.
set smartcase                   " Search by case only if specified.
set hlsearch                    " Hilight searches by default.
set ignorecase                  " Allow case searches.
set viminfo='100,f1             " Save up to 100 marks, enable capital marks.

" SWAP FILES:
set noswapfile                  " Don't use a swapfile for buffers.
set nobackup                    " Disable file backups when writing files.
set nowritebackup               " Don't backup before overwriting files.

" PERSISTENT UNDO:
set undodir=~/.vim/undodir      " Store all change information in a undodir.
set undofile                    " Write changes to the undofile.
set undolevels=1000             " Maximum number of changes that can be undone.
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload.

" line numbers & relative numbers on normal and insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ENABLE PLUGINS:
filetype plugin indent on

" TABS AND SPACES:
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
" Set smaller tab settings for HTML type stuff.
au FileType coffee,javascript,css,xml,xhtml,html,htmldjango,haml,json set shiftwidth=2 tabstop=2

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
" airline theme
let g:airline_theme='base16'

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

" enable/disable enchanced tabline
let g:airline#extensions#tabline#enable=1

" Airline show buffers
let g:airline#extensions#tabline#show_buffers=0

" remove airline angle at the end
let g:airline_skip_empty_sections=1

" bufferline configuration
" denotes whether the active highlight should be used when there is only one buffer.
let g:bufferline_solo_highlight=1

" denotes whether bufferline should automatically echo to the command bar
let g:bufferline_echo=0

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

" TAGBAR:
" Use F8 to open tagbar
nmap <F8> :TagbarToggle<CR>

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

" FOLDS:
" Space for folding
nnoremap <space> za
set foldmethod=syntax           " Fold based on indent or syntax.
set foldnestmax=3               " Limit folds to three levels of depth.
set foldenable                  " Fold by default.
set foldlevel=99

" SCROLLING:
set scrolloff=8                 " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=15            " Minimal number of screen columns to keep to the left and the right of the cursor.
set sidescroll=1                " Minimal number of columns to scroll horizontally.

" RELOAD:
" Automatically reload Vim if you make changes to vimrc.
augroup reloadvim
    au!
    au BufWritePost .vimrc source $MYVIMRC
augroup end

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
\   'go': ['gofmt'],
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

" VIM GO:
let g:go_list_type = "quickfix"
set rtp+=~/.vim/bundle/vim-golang/
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
"
" END:
"

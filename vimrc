""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Peng Cheng
" Version:
"   0.1 - 27/05/2013 17:42:11
" Sections:
"   -> General
"   -> Vim user interface
"   -> Colors and Fonts
"   -> Files and backups
"   -> Text,tab and indent related
"   -> Visual mode related
"   -> Moving around, tabs and buffers
"   -> Editing mappings
"   -> vimgrep searching and cope displaying
"   -> Misc
"   -> Helper function
"   -> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype indent on              "针对不同文件类型采用不同缩进格式
filetype plugin on              "针对不同的文件类型加载对应的插件
filetype plugin indent on       "启用自动补全

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving and quit and so on
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Quickly get out of insert mode without your fingers having to leave
" the home row (either use 'jj' or 'jk')
imap jj <Esc> 

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR> 
            


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the wild menu
set wildmenu

" Ingore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignorecase case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax hightlighting
syntax on 
set t_Co=256
if has("gui_running")
    set guioptions-=T
    color molokai
else
    color darkblue
endif
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=ucs-bom,utf-8,gbk,gb2312,default,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off                                       
set nobk
set nowb
"set noswapfile
set directory=~/tmp/vim/swap
set undodir=~/tmp/vim/undo
"set directory=~/tmp/vim/swap if swap file is needed, use this


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab "Use spaces instead of tabs
set smarttab "Be smart when using tabs ; )

set tabstop=4       "将tab键改为4个空格
set softtabstop=4
set shiftwidth=4    "自动缩进时，使用4个空格，默认是8个

" Linebreak on 200 characters
set lbr
set tw=200

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set autoindent "C language indent
set nu              "Show line numbers 
set showcmd         "在ruler左边显示当前正在输入的命令，提示性的，避免误操作


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Visual mode related 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Moving around, tabs, windows and buffers 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break as break lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Userful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Editing mappings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Plugins configure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pathogen用于管理插件的插件
execute pathogen#infect() 

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将vim的pwd设为打开的目录，如果您的项目有tags文件，你会发现这个命令很有帮助

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Single click to fold/unfold directories and a double click to open
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.vim$', '\.class$', '\.beam$', '^CVS$', '\~$', '\.lo$', '\.o$', '\.so$']
" }}}


"taglist settings {{{
nnoremap <leader>l :TlistClose<CR>:TlistToggle<CR>
nnoremap <leader>L :TlistClose<CR>
let Tlist_Show_One_File=1 "一次只显示一个文件的TAG
let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口则自动退出
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the Taglist window when it opens
let Tlist_Close_On_Select=0
let Tlist_Use_Right_Window=1  "taglist win display right, if 0 left
let Tlist_WinWidth=40
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let g:tlist_javascript_settings='javascript;s:string;a:array;o:object;f:function'
" }}}

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"vim-markdown"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

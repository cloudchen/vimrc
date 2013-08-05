"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
"let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'

"My Bundles here:
"
"original repos on github
Bundle 'ahao/vimcdoc'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/peaksea'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-rails'
Bundle 'plasticboy/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'nelstrom/vim-visual-star-search'
"Bundle 'airblade/vim-gitgutter'
Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'bootleq/gsession.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'

"vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'

"pathogen
execute pathogen#infect()
execute pathogen#helptags()

"global
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set hidden
set history=300
set autoread
set updatetime=3000
set helplang=cn
syntax on
filetype plugin on
filetype indent on

"interface
set confirm
set number
set numberwidth=4
set wildmenu
set wildignore+=.DS_Store
set showcmd
set ruler
set showmode
set laststatus=2
set scrolloff=7
set linespace=2
set equalalways
set showtabline=1
set tabline=%!public#MyTabLine()
set title
set titlestring=%f\ %m[%n]\ %{getcwd()}@%{hostname()}%=\ %P
set statusline=%<[%l,%L]%f%h%m%r%h%w%y[%{&ff}][%{&fenc}]
if isdirectory($HOME . "/.vim/bundle/vim-fugitive") "Use folder detection rather than function detection because it's early to detect exists('*fugitive#statusline')
    set statusline+=%{fugitive#statusline()}
endif
set statusline+=\ %{strftime(\"%y/%m/%d-%H:%M:%S\",getftime(expand(\"%:p\")))}%=Col:%c%V\ Pos:%o\ ASCII:%b\ Hex:%B

"color
if !has("gui_running")
    set t_Co=256
endif
set background=dark
colorscheme molokai

"session restore
set sessionoptions=buffers,curdir,folds,help,slash,tabpages,unix,winpos
set viewoptions=cursor,folds,slash,unix
set viminfo='500,f1,%,<500,:500,@500,/500,s10,h
set viewdir=~/.vim/view

"tab space backspace
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set textwidth=0
set backspace=2
set whichwrap+=<,>,~

"code indent
set autoindent
set smartindent
set nocindent

"wrap
set wrap
set nolinebreak
set showbreak=>

"invisible character
try
    set listchars=tab:»-,eol:$,trail:.
catch
endtry
set nolist

"match bracket
set showmatch "jump to matching left bracket when keyup
set matchtime=2
set matchpairs+=<:>

"search
set magic
set incsearch
set hlsearch
set ignorecase
set smartcase
set grepprg=grep\ -nHI
set nogdefault

"auto complete
set completeopt=longest,menu

"dictionary
set dictionary+=/usr/share/dict/words "most *NIX systems have this dictionary file

"encoding
set fileformats=unix,dos,mac
if &modifiable
    set fileformat=unix
endif
set nobomb
if has("multi_byte")
    set encoding=utf-8
    let &termencoding=&encoding
    setglobal fileencoding=utf-8 nobomb
    set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
    set ambiwidth=double

    augroup i18n
        autocmd!
        autocmd BufReadPost * if &fileencoding == "utf-8" | let &encoding = &fileencoding | endif
    augroup END
endif

"IME
"temporarily comment noimdisable since it doesn't work as expected
"set noimdisable "automatically switch off IME when return to normal model

"persistent undo
if has("persistent_undo")
    if !isdirectory($HOME."/.vim/undo")
        call mkdir($HOME . "/.vim/undo", "p", 0700)
    endif
    set undofile
    set undodir=$HOME/.vim/undo
    set undolevels=500
endif

"key mapping
let mapleader=","
let g:mapleader=","
noremap \ ,
set timeoutlen=300

"spell checking
"Pressing <L>c toggles spell checking
nnoremap <Leader>c :setlocal spell!<CR>

"[Y] Yank until the end (as D does by default)
nnoremap Y y$

"Clear searching highlight
map <silent> <leader>, :noh<CR>

"Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"Smart way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"move between tabs
map <silent> <F1> :tabnew<CR>
map <silent> <F2> gT
map <silent> <F3> gt

"Quickly switch between alternate file
map <silent> <C-TAB> <C-^>

"restore previous state for all files
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

"Set working directory to the current file automatically
autocmd BufEnter * lcd %:p:h "Using autocmd to change current directory is better than autochdir command

"Fast editing of the .vimrc
map <silent> <leader>e :e! ~/.vim/vimrc<CR>

"Automatically close quick-fix window if it's last window
autocmd BufEnter * call public#AutoCloseLastQuickFixWindow()

"FuzzyFinder
let g:fuf_buffer_keyDelete="<C-d>"
let g:fuf_mrufile_keyExpand="<C-d>"
let g:fuf_bookmark_keyDelete='<C-d>'
let g:fuf_bookmarkdir_keyDelete='<C-d>'
let g:fuf_modesDisable=['help', 'changelist', 'line']
let g:fuf_keySwitchMatching='<C-f>'
let g:fuf_enumeratingLimit=50
let g:fuf_maxMenuWidth=200
let g:fuf_previewHeight = 20
let g:fuf_autoPreview = 0
let g:fuf_file_exclude = '\v\~$|\.(DS_Store)$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(COMMIT_EDITMSG)$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate|vendor|node_modules|image[s]|asset[s]|_output|bin|dist|bower_components)'
let g:fuf_mrufile_maxItem=400
let g:fuf_mrucmd_maxItem=200

noremap <leader>ff :FufFileWithCurrentBufferDir<CR>
noremap <leader>fd :FufFile<CR>
noremap <leader>fr :FufMruFile<CR>
noremap <leader>frr :FufMruFileInCwd<CR>
noremap <leader>fc :FufMruCmd<CR>
noremap <leader>fb :FufBuffer<CR>
noremap <leader>fu :FufRenewCache<CR>
noremap <leader>fm :FufBookmarkFile<CR>
noremap <leader>fma :FufBookmarkFileAdd<CR>
noremap <leader>fa :FufCoverageFile<CR>

"html indent
let g:html_indent_inctags="head,tbody,p"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

"vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_synchronize_focus=0
let g:nerdtree_tabs_focus_on_files=1
nnoremap <silent> <F4> :NERDTreeTabsToggle<CR>
inoremap <silent> <F4> <ESC>:NERDTreeTabsToggle<CR>

"syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_html_tidy_ignore_errors=['trimming empty']

"zencoding
let g:user_zen_mode='a'    "enable all function in all mode.

"tagbar
let g:tagbar_sort=0
"let g:tagbar_compact=1
let g:tagbar_autofocus=1
let g:tagbar_indent=1
let g:tagbar_expand=1
let g:tagbar_singleclick=1
let g:tagbar_autoshowtag=1
nnoremap <F5> :TagbarToggle<CR>
inoremap <F5> <ESC>:TagbarToggle<CR>

"fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>

"Ack
noremap <Leader>k :Ack <cword><CR>

"vim-rails
autocmd BufEnter * silent! if exists(":Rlcd") | Rlcd | endif "Change current directory to rails project's root directory

"vim-javascript
let javascript_enable_domhtmlcss=1

"pathogen
execute pathogen#infect()

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
if exists("+autochdir")
    set autochdir
else
    "Set working directory to the current file automtically
    autocmd BufEnter * lcd %:p:h
endif
syntax on
filetype plugin on
filetype indent on

"interface
set confirm
set number
set numberwidth=4
set wildmenu
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
set titlestring=%{getcwd()}/%t@%{hostname()}%m[%n]%=\ %P
set statusline=%<[%l,%L]%f%h%m%r%h%w%y[%{&ff}][%{&fenc}]\ %{strftime(\"%y/%m/%d-%H:%M:%S\",getftime(expand(\"%:p\")))}%=Col:%c%V\ Pos:%o\ ASCII:%b\ Hex:%B

"color
if !has("gui_running")
    set t_Co=256
endif
set background=dark
colorscheme molokai

"session restore
set sessionoptions=buffers,sesdir,folds,help,slash,tabpages,unix,winpos
set viewoptions=cursor,folds,slash,unix
set viminfo='500,f1,%,<500,:500,@500,/500,s10,h

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
set showmatch "jump to matching left backet when keyup
set matchtime=2
set matchpairs+=<:>

"search
set magic
set incsearch
set hlsearch
set ignorecase
set smartcase
set grepprg=grep\ -nHI

"auto complete
set completeopt=longest,menu

"encoding
set fileformats=unix,dos,mac
set fileformat=unix
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
let mapleader = ","
let g:mapleader = ","
set timeoutlen=300

"Clear searching highlight
map <silent> <leader>, :noh<CR>

"Smart way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"move between tabs
map <silent> <F1> :tabnew<CR>
map <silent> <F2> gT
map <silent> <F3> gt

"FuzzyFind
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

"html indent
let g:html_indent_inctags = "head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

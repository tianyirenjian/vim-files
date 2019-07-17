set nocompatible
set backspace=indent,eol,start
set nu
set smartindent
set autoindent
set hls
set bufhidden=hide
set hidden
set linespace=3
set wildmenu
set cmdheight=1
set showmatch
set matchtime=5
set ignorecase
set go=
set nobackup
set cursorline
let mapleader=','
set ruler
set showcmd
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set guifont=Consolas:h12:cANSI
set guifont=FiraCode_NF:h11
set fileformats=unix,dos
let &colorcolumn="120"
set nostartofline
set showmatch
set ignorecase
syntax on

set laststatus=2

source $VIMRUNTIME/macros/matchit.vim

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'VundleVim/Vundle.vim'
"Bundle 'AutoComplPop'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'dietsche/vim-lastplace'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'

Bundle 'scrooloose/syntastic'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'jiangmiao/auto-pairs'
Bundle 'wakatime/vim-wakatime'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'CharlesGueunet/quickmenu.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'Yggdroot/indentLine'

Bundle 'altercation/vim-colors-solarized'
Bundle 'petelewis/vim-evolution'
Bundle 'jdkanani/vim-material-theme'
Bundle 'liuchengxu/space-vim-dark'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'ryanoasis/vim-devicons'

Bundle 'zxqfl/tabnine-vim'

filetype plugin indent on

" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"

" indentLine
let g:indentLine_char_list = ['|', '|', '┆', '┊']

"quickmenu
let g:quickmenu_options = "LH"
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

call g:quickmenu#append('# CtrlP', '')
call g:quickmenu#append("ctrlp funky", 'CtrlPFunky', "ctrlp funky")

call g:quickmenu#append('# Laravel', '')
call g:quickmenu#append("artisan migrate", '!php artisan migrate', "php artisan migrate")
call g:quickmenu#append("artisan migrate rollback", '!php artisan migrate:rollback', "php artisan migrate rollback")

call g:quickmenu#append('# Git', '')
call g:quickmenu#append("git diff", 'Gvdiff', "run git diff")
call g:quickmenu#append("git status", 'Gstatus', "run git status")

call g:quickmenu#append('# Other', '')
call g:quickmenu#append("Toggle IndentLine", 'IndentLinesToggle', "toggle indent line")

" nerdtree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"ctrlp
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_show_hidden = 1
nnoremap <Leader>u :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1
nmap <F3> :CtrlPMRUFiles<CR>
nmap <F4> :CtrlPBuffer<CR>

"vim-easymotion
nmap f <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t2)

"注释掉，添加上倒不好用了。
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" super tab
let g:SuperTabDefaultCompletionType = "<c-n>"

" buffers
nmap <leader>n :bnext<cr>
nmap <leader>b :bp<cr>
nmap <leader>$ :blast<cr>
nmap <leader>0 :bfirst<cr>
nmap <C-tab> :bn<cr>
nmap <C-S-tab> :bp<cr>

"airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = "\uE0B0"
let g:airline#extensions#tabline#left_sep = ">"
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#buffer_idx_mode = 1

"let g:airline_left_sep = "\uE0B0"
"let g:airline_right_sep = "\uE0B2"

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
function! AccentDemo()
    let keys = ['G','o','e','n','i','t','z']
    for k in keys
        call airline#parts#define_text(k, k)
    endfor
    call airline#parts#define_accent('G', 'red')
    call airline#parts#define_accent('o', 'green')
    call airline#parts#define_accent('e', 'blue')
    call airline#parts#define_accent('n', 'red')
    call airline#parts#define_accent('i', 'orange')
    call airline#parts#define_accent('t', 'purple')
    call airline#parts#define_accent('z', 'bold')
    let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()


if has("gui_running")
    set encoding=utf-8
    set fileencodings=utf-8,chinese,latin-1
    if has("win32")
        set fileencoding=chinese
    else
        set fileencoding=utf-8
    endif
    let &termencoding=&encoding
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

"colorscheme evolution
set background=dark
"colorscheme material-theme
colorscheme space-vim-dark

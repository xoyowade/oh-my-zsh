set nocompatible

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" map <c-w><c-f> :FirstExplorerWindow<cr>
" map <c-w><c-b> :BottomExplorerWindow<cr>
" map <c-w><c-t> :WMToggle<cr> 

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapWindowNavVim = 1

nnoremap <silent> <F12> :A<CR>
nnoremap <silent> <F3> :Rgrep<CR>

" Preview window
" nmap <C-p> :ptj <C-R>=expand("<cword>")<CR><CR>

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Highlight search
nmap <F8> :Search <C-R>=expand("<cword>")<CR>

" indent
set autoindent   " auto indent
set smartindent  " set same amount of indent when insert new line
set cindent      " start c lang indent mode
" tab indent setting
set tabstop=2 shiftwidth=2 softtabstop=0 et
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
  augroup end
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType proto      setlocal sw=4 sts=4 ts=4 et
  " ...
endif

" my own ones
"colo torte
set incsearch
set hlsearch
set ruler
set number
set showcmd
syntax enable
syntax on
set paste

" Quick move between windows
noremap <C-j>  <C-W>j
noremap <C-k>  <C-W>k
noremap <C-h>  <C-W>h
noremap <C-l>  <C-W>l

" tab stuff
cmap <C-t> tabnew 
nmap <C-t> :tabnew<CR>

nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprev<CR>

nmap ,1 :tabnext 1<CR>
nmap ,2 :tabnext 2<CR>
nmap ,3 :tabnext 3<CR>
nmap ,4 :tabnext 4<CR>
nmap ,5 :tabnext 5<CR>
nmap ,6 :tabnext 6<CR>
nmap ,7 :tabnext 7<CR>
nmap ,8 :tabnext 8<CR>
nmap ,9 :tabnext 9<CR>
nmap ,0 :tablast<CR>

if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

"set term=xterm-256color
let moria_style = 'black' 
colors relaxedgreen 

"pathogen
call pathogen#infect()

set cursorline

" x window clipboard slows down the startup time when the x window connection is slow
" so just disable this feature when slow
set clipboard=exclude:.*

set background=dark
colorscheme solarized
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

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

" my own ones
"colo torte
set cindent
set incsearch
set hlsearch
set ruler
set number
set showcmd
set ts=4
set autoindent
syntax enable
syntax on
set paste
filetype plugin indent on

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

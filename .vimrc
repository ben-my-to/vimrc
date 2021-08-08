"<!-- Download AutoHotKey are use this script command: CapsLock::Esc -->
"<!-- INSTALL PLUGIN HERE: -->
"iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`ni $HOME/vimfiles/autoload/plug.vim -Force

syntax on
set encoding=utf-8

"Themes
let x=1
set syntax=mips
if x==0 " #1f1e24
   colorscheme papaya
elseif x==1 " #010409
   colorscheme papercolor
   highlight LineNr guifg=#ffcc59
elseif x==2 " #282828
   colorscheme gruvbox
   set background:dark
elseif x==3 " #1b1dle
   colorscheme molokai
elseif x==4 " #292a30
   colorscheme xcodedark
elseif x==5 " #282a36
   colorscheme dracula
elseif x==6 " #2d2b55
   colorscheme shades_of_purple
   set background:dark
endif

set splitbelow
 "C++ 
autocmd filetype cpp nnoremap <C-b> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <C-SPACE> :w <bar> term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp imap <C-SPACE> <esc>:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp nnoremap <S-ESC> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>
autocmd filetype cpp imap <S-ESC> <esc>:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>

"C
autocmd filetype c nnoremap <C-SPACE> :w <bar> !gcc % -o %:r <CR> :term %:r.exe <CR>
autocmd filetype c imap <C-SPACE> <esc>:w <bar> !gcc % -o %:r <CR> :term %:r.exe <CR>

"Python 
autocmd FileType python map <buffer> <S-ESC> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <S-ESC> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <C-SPACE> :w<CR>:ter python3 "%"<CR>
autocmd FileType python imap <buffer> <C-SPACE> <esc>:w<CR>:ter python3 "%"<CR>

"Disables Beep Sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

autocmd VimResized * wincmd =
set equalalways
set relativenumber
set rnu
set timeout timeoutlen=100 ttimeoutlen=100
set tabstop=3 softtabstop=3
set shiftwidth=3
set ignorecase
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set incsearch
set lines=45 columns=130
set backspace=indent,eol,start
let skip_defaults_vim=1
set viminfo="

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

"Normal Mode
"Normal Mode via AutoHotKey
map <esc> a

"New Line
map o o<esc>
map <Enter> o<Esc>

"Back Line
map O O<esc>

"end of line
map ; $a

"Delete Word
map da diw

"Select Line
vnoremap s "+y

"Select Word
map sa viw

"Next Tab
nmap <C-Tab> gt
imap <C-Tab> <esc>gti

"Prev Tab
nmap <S-Tab> gT
imap <S-Tab> <esc>gTi

"Select All
map <C-a> GVgg
imap <C-a> <esc>GVggi

"Undo
imap <C-Z> <esc>ui
nnoremap <C-Z> u

"Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

"Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

"Paste
map <C-V>       "+gP
cmap <C-V>      <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"Split (Vertical) Screen
set splitright
noremap <C-o> :vsp newfile.cpp <CR>

"Navigate Splits 
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Vim Directory
map <C-p> :NERDTree <Enter> Bj
let g:NERDTreeWinPos = "right"

"Source + Create New File
map <F2> :w newfile.cpp <Enter> 
map <F1> :source% <Enter>
imap <F1> <esc>:source% <Enter>i

"Exit Vim
map <C-W> :q! <Enter>
imap <C-W> <esc>:q! <Enter> i

"New Tab
map <C-t> :tabnew <Enter>
imap <C-t> <esc>:tabnew <Enter> i

"Save File
map <C-s> :w <Enter>
imap <C-s> <esc>:w <Enter>a

"Fuzzy Finder
map <C-F> :Files ~/<CR>

"Tab (Command Mode)   
map <Tab> i <Tab><esc>a

"Auto {}/[]
imap { {}<esc>i
imap [ []<esc>i

"Normal Mode Comment
autocmd FileType python map <S-c> 0i#<esc>
autocmd FileType cpp map <S-c> 0i//<esc>
autocmd FileType cpp map <S-x> <C-x><S-o>i/*<CR><BS><BS><BS><C-v>*/<esc>
autocmd FileType c map <S-c> 0i//<esc>
autocmd FileType c map <S-x> <C-x><S-o>i/*<CR><BS><BS><BS><C-v>*/<esc>
map <S-c> 0i"

set guioptions-=r
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction
set guioptions=i

"Fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=RobotoMono\:12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif

"Templates
autocmd filetype cpp :ab exe_template #include <iostream><CR>#include <string><CR>#include <vector><CR><CR>using namespace std;<CR><CR>int main(){<CR><Tab>return 0;<CR>i<BS><esc>kOO<Tab>
autocmd filetype cpp :ab exe_class class {<CR><CR><esc>kiprivate:<CR><Tab><CR>public:<CR><Tab><esc>ja;<esc>kkkkklllli

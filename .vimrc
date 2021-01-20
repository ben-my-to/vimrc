"<!-- Download AutoHotKey are use this script command: CapsLock::Esc -->
"<!-- INSTALL PLUGIN HERE: -->
"iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`ni $HOME/vimfiles/autoload/plug.vim -Force

syntax on

"Themes
let x=3
if x==0
    colorscheme one
    set background:dark
    let g:airline_theme='one'
elseif x==1
    set background:dark
    colorscheme papercolor
elseif x==2
    colorscheme molokai 
    let g:airline_theme='molokai'
elseif x==3 
    colorscheme gruvbox
    let g:airline_theme='gruvbox'
    set background:dark
elseif x==4
    colorscheme dracula
    let g:airline_theme='dracula'
elseif x==5
    colorscheme lucid
endif

"C++ 
set splitbelow
autocmd filetype cpp nnoremap <C-b> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <C-Enter> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp imap <C-Enter> <esc>:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp nnoremap <S-CR> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>
autocmd filetype cpp imap <S-CR> <esc>:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>

"Python 
autocmd FileType python map <buffer> <S-CR> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <S-CR> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <C-Enter> :w<CR>:ter python3 "%"<CR>
autocmd FileType python imap <buffer> <C-Enter> <esc>:w<CR>:ter python3 "%"<CR>

"Disables Beep Sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set lines=45 columns=130
set colorcolumn=0
set backspace=indent,eol,start
let skip_defaults_vim=1
set viminfo=""

let g:airline#extensions#whitespace#enabled = 0
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

"New Line
map o o<esc>
map <Enter> o<Esc>

"Back Line
map O O<esc>

"End of Line
map ; $a

"Delete Line
map da saxk<CR>
map dd ddk

"Delete Word
map dw diw

"Select Line
map sa V

"Select Word
map sw viw

set guioptions-=r
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction
set guioptions=i

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

"Find
set ignorecase
map <C-f> /
imap <C-f> <esc>/

"Normal Mode Comment
autocmd FileType python map <S-c> 0i#
autocmd FileType cpp map <S-c> 0i//
map <S-c> 0i"
   
"Tab (Command Mode)   
map <Tab> i <Tab><esc>a

"Auto {}/[]
imap { {}<esc>i
imap [ []<esc>i

"Fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=RobotoMono\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"Templates
autocmd filetype cpp :ab exe_template #include <iostream><CR>#include <string><CR>#include <vector><CR><CR>using namespace std;<CR><CR>int main(){<CR><Tab>return 0;<CR>i<BS><esc>kOO<Tab>
autocmd filetype cpp :ab exe_class class {<CR><CR><esc>kiprivate:<CR><Tab><CR>public:<CR><Tab><esc>ja;<esc>kkkkklllli



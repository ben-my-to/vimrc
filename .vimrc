syntax on

"Themes
let x=2
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

"Compiler
set splitbelow
autocmd filetype cpp nnoremap <C-b> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <C-Enter> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp imap <C-Enter> ii:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp nnoremap <S-CR> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>
autocmd filetype cpp imap <S-CR> ii:w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>

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

"<!-- INSTALL PLUGIN HERE: -->
"iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`ni $HOME/vimfiles/autoload/plug.vim -Force
let g:airline#extensions#whitespace#enabled = 0
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

"Remap Normal Mode
inoremap ii <Esc>

"New Line
map o oii
map <Enter> o<Esc>

"Back Line
map O Oii

"End of Line
map ; $a

set guioptions-=r
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction
map <F11> <Esc>:call ToggleGUICruft()<cr>
set guioptions=i

"key": "escape",      
"command": "removeSecondaryCursors",
"when": "editorHasMultipleSelections && textInputFocus"

"Next Tab
nmap <C-Tab> gt
imap <C-Tab> iigti

"Prev Tab
nmap <S-Tab> gT
imap <S-Tab> iigTi

"Select All
map <C-a> GVgg
imap <C-a> iiGVggi

"Undo
imap <C-Z> iiui
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
map <C-p> :NERDTree <Enter>
let g:NERDTreeWinPos = "right"

"Source + Create New File
map <F2> :w newfile.cpp <Enter> 
map <F1> :source% <Enter>
imap <F1> ii:source% <Enter>i

"Exit Vim
map <C-W> :q! <Enter>
imap <C-W> ii:q! <Enter> i

"New Tab
map <C-t> :tabnew <Enter>
imap <C-t> ii:tabnew <Enter> i

"Save File
map <C-s> :w <Enter>
imap <C-s> ii:w <Enter>a

"Find
set ignorecase
map <C-f> /
imap <C-f> ii/

"Normal Mode Comment
map <S-c> 0i"
   
"Tab (Command Mode)   
map <Tab> i <Tab>iia

"Auto {}/[]
imap { {}iii
imap [ []iii

"Fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"Templates
:ab exe_template #include <iostream><CR>#include <string><CR>#include <vector><CR><CR>using namespace std;<CR><CR>int main(){<CR><Tab>return 0;<CR><BS>iikOO<Tab>
:ab exe_class class {<CR><CR>iikiprivate:<CR><Tab><CR>public:<CR><Tab>iija;iikkkkklllli



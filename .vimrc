syntax on

"Themes
let x = 0

if x==0
    colorscheme one
    set background:dark
elseif x==1
    colorscheme dracula
elseif x==2
    colorscheme gruvbox
    set background:dark
elseif x==3
    set background:dark
    colorscheme papercolor
endif

"Compiler
set splitbelow
autocmd filetype cpp nnoremap <C-b> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <C-Enter> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp imap <C-Enter> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :w<bar>term ++shell g++ %:p -o %:p:r && %:p:r<CR>
autocmd filetype cpp nnoremap <S-CR> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> <bar> :!%:r<CR>

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
set undodir=~/.vim/undodir
set undofile
set incsearch
set lines=45 columns=130
set colorcolumn=0
set backspace=indent,eol,start

inoremap ii <Esc>
map <Enter> o<Esc>
map o oii
map O Oii

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
highlight ColorColumn ctermbg=0 guibg=lightgrey

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

"Paste/Insert
map <C-V>       "+gP
cmap <C-V>      <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"Vim Directory
map <C-p> :e ./vim <Enter>

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
map <C-f> /
imap <C-f> ii/

"Normal Mode Comment
map <S-c> i"

"Split (Vertical) Screen
set splitright
noremap <C-o> :vsp newfile.cpp <CR>

"Tab (Command Mode)
map <Tab> i<Tab>iia

"Auto {}/[]
imap { {<CR>}iiO
imap [ []iii 

"End of Line
map ; $

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
:ab ttt #include <iostream><CR>#include <string><CR>#include <vector><CR><CR>using namespace std;<CR><CR>int main(){<CR><CR>return 0;<CR>}

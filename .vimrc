syntax on
set encoding=utf-8
set t_Co=256
set laststatus=2

call plug#begin('~/.vim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'mg979/vim-visual-multi', { 'branch' : 'master' }
	Plug 'ycm-core/YouCompleteMe'
	Plug 'mbbill/undotree'
call plug#end()

"colorscheme gruvbox
"let g:lightline = { 'colorscheme' : 'gruvbox' }

colorscheme PaperColor 
let g:lightline = { 'colorscheme' : 'PaperColor' }

set background:dark
hi NonText ctermfg=13

autocmd VimResized * wincmd =
autocmd GUIEnter * set vb t_vb=
set nu
set nowrap
set smartindent
set incsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set ttimeoutlen=50
set noswapfile
set backspace=indent,eol,start

let mapleader = " "

nnoremap <silent> da diw
nnoremap <silent> sa viw
nnoremap <silent> ; $
nnoremap <silent> o o<esc>
nnoremap <silent> O O<esc>
nnoremap <silent> q <S-V> y
nnoremap <silent> <S-k> <C-u>
nnoremap <silent> <S-j> <C-d>
nnoremap <silent> ` :w<bar>:source%<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> n <C-n>
nnoremap <silent> ' :vert term<CR>
nnoremap <silent> <Tab> i <Tab><esc>a
nnoremap <silent> <Leader>c v<C-]>y
nnoremap <silent> <Leader><Space> :!clear; g++  %:r.cpp -o %:r; ./%:r<CR>

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

set splitright
let g:NERDTreeWinPos = "right"
let g:airline_powerline_fonts=1
nnoremap <silent> <Leader>r :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>f :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>g :Files ~/<CR>
nnoremap <silent> <Leader>p :NERDTree<CR>Bj
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>o :vsp new.cpp<CR>
nnoremap <silent> <Leader>w :q!<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>
nnoremap <silent> <Leader>t gT

if has("persistent_undo")
	let target_path = expand('~/.undodir')

   if !isdirectory(target_path)
		call mkdir(target_path, "p", 0700)
	endif

	let &undodir=target_path
	set undofile
endif

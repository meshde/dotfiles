set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'gabrielelana/vim-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'elzr/vim-json'
Plugin 'valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'w0rp/ale'
Plugin 'jxnblk/vim-mdx-js'
Plugin 'tpope/vim-sleuth'
Plugin 'dag/vim-fish'
Plugin 'OrangeT/vim-csharp'
Plugin 'gryf/pylint-vim'


call vundle#end()
filetype plugin indent on

set splitbelow
set splitright
set cursorline

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:SimplyFold_docstring_preview=1


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.ts 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent



set encoding=utf-8

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

set nu

nmap <C-k><C-b> :NERDTreeToggle<CR>
nmap <C-o> o<Esc>
nmap <C-s> :w<CR>
nmap <C-w>* <C-w>s*

inoremap { {}<Left>
inoremap {<space> {  }<Left><Left>
inoremap {<CR> {<CR>}<Esc>ko

inoremap ( ()<Left>
inoremap (<space> (  )<Left><Left>
inoremap (<CR> (<CR>)<Esc>ko

inoremap [ []<Left>
inoremap [<space> [  ]<Left><Left>
inoremap [<CR> [<CR>]<Esc>ko

inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>

set laststatus=2 " Always display powerline
set completeopt-=preview
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" let g:prettier#config#tab_width = 4


let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --tab-width 4'

nmap <C-i> vit<Esc>

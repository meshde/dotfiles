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
Plugin 'tpope/vim-rhubarb'
Plugin 'tommcdo/vim-fubitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
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
Plugin 'tpope/vim-abolish' " Case preserving replace
Plugin 'StanAngeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'keith/swift.vim'
Plugin 'vim-vdebug/vdebug'
Plugin 'AndrewRadev/linediff.vim'


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
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent



set encoding=utf-8


set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

let NERDTreeIgnore=['\.pyc$', '\~$', '\.min.js$'] "ignore files in NERDTree

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
nmap <C-k><C-n> :NERDTreeFind<CR>
nmap <C-g><C-n> :cn<CR>
nmap <C-g><C-p> :cp<CR>
nmap <C-o> o<Esc>
nmap <C-s> :w<CR>
nmap <C-w>* <C-w>s*
nnoremap zz :update<cr>

inoremap { {}<Left>
inoremap {} {}
inoremap {<space> {  }<Left><Left>
inoremap {<CR> {<CR>}<Esc>ko

inoremap ( ()<Left>
inoremap () ()
inoremap (<space> (  )<Left><Left>
inoremap (<CR> (<CR>)<Esc>ko

inoremap [ []<Left>
inoremap [] []
inoremap [<space> [  ]<Left><Left>
inoremap [<CR> [<CR>]<Esc>ko

inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>

vnoremap <C-k>( c()<Esc>P
nnoremap <C-k>( ce()<Esc>P

vnoremap <C-k>[ c[]<Esc>P
nnoremap <C-k>[ ce[]<Esc>P

vnoremap <C-k>{ c{}<Esc>P
nnoremap <C-k>{ ce{}<Esc>P

vnoremap <C-k>" c""<Esc>P
nnoremap <C-k>" ce""<Esc>P

vnoremap <C-k>' c''<Esc>P
nnoremap <C-k>' ce''<Esc>P

vnoremap <C-k>` c``<Esc>P
nnoremap <C-k>` ce``<Esc>P

set backspace=2 " Fix backspace issues
set laststatus=2 " Always display powerline
set completeopt-=preview
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" let g:prettier#config#tab_width = 4


let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --tab-width 4'

let g:ale_linters = {}
let g:ale_linters['python'] = ['pylint']
let g:ale_lint_on_save = 1


if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options.path_maps = { "/var/www/html": "/Users/mehmood.d/Mehmood/cms" }

nmap <C-i> vit<Esc>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! -F "<C-R><C-W>"<CR>:cw<CR>

" Code Folding
set foldmethod=syntax
set foldlevelstart=99

" Horizontal Scrolling
" set nowrap
" nmap <C-M> zl
" nmap <C-n> zh

" Enable mouse support
set mouse=a

" Python Debugging Macros
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

set rnu

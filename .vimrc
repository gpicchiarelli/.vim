set nocompatible
" Use Vim settings, rather than Vi settings
set softtabstop=2
" Indent by 2 spaces when hitting tab
set shiftwidth=4
" Indent by 4 spaces when auto-indenting
set tabstop=4
" Helps force plugins to load correctly when it is turned back on below
filetype off
" Turn on syntax highlighting
syntax on
" For plugins to load correctly
filetype plugin indent on
" Security
set modelines=0
" Show line numbers
set number
" Show file stats
set ruler
" Blink cursor on error instead of beeping (grr)
set visualbell
" Encoding
set encoding=utf-8
" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2
" Last line
set showmode
set showcmd
" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

map <leader><space> :let @/=''<cr> " clear search
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Formatting
map <leader>q gqip
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set wildmenu
set nobackup
"Key map for buffers tabs
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Python Jedi
let g:pymode_rope = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 1

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Plugged management
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-surround'
  Plug 'sbdchd/neoformat'
  Plug 'deoplete-plugins/deoplete-jedi' 
  Plug 'albertorestifo/github.vim'
  Plug 'junegunn/vim-github-dashboard'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'junegunn/fzf'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mattn/emmet-vim'
  Plug 'w0rp/ale'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'janko-m/vim-test'
  Plug 'WolfgangMehner/c-support'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'bagrat/vim-buffet'
  Plug 'Chiel92/vim-autoformat'
  Plug 'davidhalter/jedi-vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/deoplete-clangx'
  Plug 'scrooloose/nerdtree'
  Plug 'lervag/vimtex'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'google/vim-glaive'
  Plug 'tell-k/vim-autopep8'
call plug#end()

" set leader key
let mapleader=","

" set nocompatible first
set nocompatible

" set encodings
set encoding=utf8
set termencoding=utf8
set fileencodings=utf-8,cp950,gb2312,big5,ucs-bom,sjis,default

" display setting
set showmatch
set showmode
set cursorline
set number
set hlsearch
set ruler
if v:version >= 703
    set colorcolumn=80
    highlight ColorColumn ctermbg=233
endif

" set the format of tab and expand tab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" keep the cursor in the middle of the vertical screen
map <up> <up>zz
map <down> <down>zz
map <PageUp> <PageUp>zz
map <PageDown> <PageDown>zz

" vim other setting
syntax on
set history=1000
set bs=2
set autoread
set nobackup
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<  "" use 'set list' to show any symbols

" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" set hlresearch behaviors
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>nzz
noremap N :set hlsearch<cr>Nzz
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" better copy and paste # need to be examined!
set pastetoggle=<F2>
set clipboard=unnamed

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme torte

" -- tab settings {
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt
" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>
" }

" python highlight on for 'python.vim'
let python_highlight_all=1

" set for python folding
set foldmethod=indent
nnoremap <space> za

" fast insert debug trace for python
nnoremap <leader>d Oimport pdb; pdb.set_trace()


"""""""""""""""""""""
" module management "
"""""""""""""""""""""

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Automatic set up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" use vundle to manage modules
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

" My Plugins here:
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'pyflakes.vim'
Plugin 'EnhCommentify.vim'
Plugin 'vim-autopep8'
Plugin 'motus/pig.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'

" plugin for autocomplete
Plugin 'AutoComplPop'
Plugin 'msanders/snipmate.vim'
" Plugin 'Valloric/YouCompleteMe'


if iCanHazVundle == 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" Setting up Vundle - the vim plugin bundler end

call vundle#end()
filetype plugin indent on    " required for vundle

" settings for ctrlp, use ctrl+p to start fuzzy search for file
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" settings for NERDTree
map <F3> :NERDTreeToggle<CR>

" settings for easymotion
let g:EasyMotion_leader_key = '<Leader>'

" settings for AutoComplPop + snipMate
let g:acp_behaviorSnipmateLength=1

" settings for vim-autopep8
autocmd FileType python map <buffer> <F4> :call Autopep8()<CR>

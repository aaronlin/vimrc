" set nocompatible first
set nocompatible

" set encodings
set encoding=utf8
set termencoding=utf8
set fileencodings=utf-8,cp950,gb2312,big5,ucs-bom

" display setting
set showmatch
set showmode
set cursorline
set number
set hlsearch
set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=233

" set the behaviors of tab and expand tab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

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
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
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

" python tidy setting
" use it carefully since it changes the saved file
" if you want to undo it, press 'u' and 'w' to save the unchanged version
map <F4> :!python ~/.vim/PythonTidy-1.22.python % %<CR><CR>


"""""""""""""""""""""
" module management "
"""""""""""""""""""""

" set up pathogen first to manage vim plugins
call pathogen#infect()
call pathogen#helptags()

" settings for ctrlp, use ctrl+p to start fuzzy search for file
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" settings for NERDTree
map <F3> :NERDTreeToggle<CR>

" python autocomplete
filetype plugin indent on
let g:pydiction_location = '/Users/aaronlin/.vim/bundle/pydiction/complete-dict'


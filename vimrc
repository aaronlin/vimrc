" set encodings
set encoding=utf8
set termencoding=utf8
set fileencodings=utf-8,cp950,gb2312,big5,ucs-bom

" vim setting
syntax on
set autoindent
set smartindent
set hlsearch
set nocompatible
set history=50
set ruler
set number
set bs=2
set autoread
set showmatch
set showmode
set nobackup
set cursorline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set colorcolumn=80
highlight ColorColumn ctermbg=233

" rebind Leader key
let mapleader = ","

" python highlight on
let python_highlight_all=1

" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" better copy and paste # need to be examined!
set pastetoggle=<F2>
set clipboard=unnamed

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" set the behaviors of tab and expand tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" set hlresearch behaviors
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme torte

" vgod's setting
" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>



" set up pathogen first to manage vim plugins
call pathogen#infect()

" settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" python autocomplete
filetype plugin indent on
let g:pydiction_location = '/Users/aaronlin/.vim/bundle/pydiction/complete-dict'

" settings for NERDTree
map <F3> :NERDTreeToggle<CR>

" settings for python folding
set nofoldenable

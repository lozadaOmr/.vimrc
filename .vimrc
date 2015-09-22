set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'nvie/vim-flake8'
Plugin 'cburroughs/pep8.py'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

set background=dark

syntax on                       " Switch syntax highlighting on

filetype plugin indent on       " Enable file type detection and do language-dependent indenting.

set number                      " Show line numbers

set hidden                      " Allow hidden buffers, don't limit to 1 file per window/split

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set nu                          "show line numbers

set expandtab                   "use spaces instead of tabs

set tabstop=4                   "insert 4 spaces whenever the tab key is pressed

set shiftwidth=4                "set indentation to 4 spaces

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files
                                "    anyway?
                                "    https://github.com/nvie/vimrc/blob/master/vimrc#L141


set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab>
                                " in bash 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                   " use spaces instead of tabs.
set smarttab                    " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround                  " tab / shifting moves to closest tabstop.
set autoindent                  " Match indents on new lines.
set smartindent                 " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup                    " We have vcs, we don't need backups.
set nowritebackup               " We have vcs, we don't need backups.
set noswapfile                  " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set autoread                    " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase                  " case insensitive search
set smartcase                   " If there are uppercase letters, become case-sensitive.
set incsearch                   " live incremental searching
set showmatch                   " live match highlighting
set hlsearch                    " highlight matches

" Mappings to traverse buffer list 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Easy expansion of the active file directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Shortcut to Mute Highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Root permission on a file inside VIM
cmap w!! w !sudo tee >/dev/null %

colorscheme brogrammer

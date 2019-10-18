set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvie/vim-flake8'
Plugin 'Yggdroot/indentLine'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'machakann/vim-sandwich'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Put your non-Plugin stuff after this line

syntax enable                   " Syntax highlighting
syntax on                       " Switch syntax highlighting on
filetype plugin indent on       " Enable file type detection and do language-dependent indenting.

set number                      " Show line numbers
set hidden                      " Allow hidden buffers, don't limit to 1 file per window/split
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set history=50                  " Keep 50 lines of command line history
set ruler                       " Show the cursor position all the time
set cursorline
set showcmd                     " Display incomplete commands
set incsearch                   " Do incremental searching
set nu                          " Show line numbers
set shiftwidth=4                " Set indentation to 4 spaces
set hlsearch                    " Highlight search terms
set autoindent                  " Start new line at the same indentation level
set smartindent
set cmdheight=1                 " The commandbar height
set showmatch                   " Show matching bracets when text indicator is over them
set nobackup                    " Do not keep backup files, it's 70's style cluttering
set noswapfile                  " Do not write annoying intermediate swap files,
                                "    who did ever restore from swap files
                                "    anyway?
                                "    https://github.com/nvie/vimrc/blob/master/vimrc#L141

set ttimeoutlen=50              " Solves: there is a pause when leaving insert mode
set splitbelow                  " Horizontal splits open below current file
set splitright                  " Vertical splits open to the right of the current file
set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab>
                                " in bash
set tabstop=4
set softtabstop=4
set expandtab                   " Convert tabs to spaces
set colorcolumn=80

" We have VCS -- we don't need this stuff.
set nowritebackup               " We have vcs, we don't need backups.

" don't nag me when hiding buffers
set autoread                    " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase                  " case insensitive search
set smartcase                   " If there are uppercase letters, become case-sensitive.

set laststatus=2                " vim-airline doesn't appear until I create a new split
set winminheight=1              " Never let window be less than 1px
set nowrap


" Tab Setting Reference for Python and Vim
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Setting Reference for JavaScript
autocmd Filetype html setlocal ts=2 sts=2 sw=2

" Setting Reference for HTML
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Automatic formatting on save fro JS
" autocmd bufwritepost *.js silent !standard --fix %

"Root permission on a file inside VIM
cmap w!! w !sudo tee >/dev/null %

let g:NERDTreeWinSize=18
let g:NERDTreeIgnore = ['\.pyc$','\.rpyc$', 'node_modules']

" indentLine
let g:indentLine_char='¦'

autocmd VimEnter + NERDTree
autocmd VimEnter * wincmd w

map <C-o> :NERDTreeToggle %<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <C-A> :EnableGoldenViewAutoResize<CR>
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious
nnoremap <silent> <C-L> :noh<CR><C-L>

set term=screen-256color

let g:airline_powerline_fonts = 1    " vim-airline symbols
let g:airline_them='onedark'
let g:airline#extensions#tabline#enabled = 0

" ale (linter)
let g:airline#extensions#ale#enabled = 1
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['standard'],
\   'python': ['flake8']
\}

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:better_whitespace_ctermcolor='black'
let g:better_whitespace_guicolor='black'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark

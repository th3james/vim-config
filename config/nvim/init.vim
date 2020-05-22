" Somewhat copied from https://github.com/spf13/spf13-vim/blob/master/.vimrc
set nocompatible          " We're running Vim, not Vi!
filetype off                   " required!

call plug#begin('~/.vim/plugged')

" Plug 'tpope/vim-rails'

"Plug 'ervandew/supertab'
"Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
"Plug 'thoughtbot/vim-rspec'
"Plug 'rust-lang/rust.vim'
"Plug 'keith/swift.vim'
"Plug 'yodiaditya/vim-pydjango'
Plug 'nvie/vim-flake8'
Plug 'janko-m/vim-test'
"Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'plasticboy/vim-markdown'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'dense-analysis/ale'
"Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'chr4/nginx.vim'
Plug 'ekalinin/Dockerfile.vim'

" vim-scripts repos
"Plug 'vim-scripts/L9'

call plug#end()

let g:vim_markdown_folding_disabled=1

filetype plugin indent on     " required!

" UI stuff
set t_Co=256

syntax on                 " Enable syntax highlighting
color default
set background=dark       " Assume a dark background

set backspace=indent,eol,start	" backspace for dummys
set linespace=0		        " No extra spaces between rows
set nu                                " Line numbers on
set showmatch                         " show matching brackets/parenthesis
set incsearch	                        " find as you type search
set hlsearch	                        " highlight search terms
set winminheight=0                    " windows can be 0 line high 
set ignorecase			" case insensitive search
set smartcase                         " case sensitive when uc present
set wildmenu                          " show list instead of just completing
set wildmode=list:longest,full        " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]	        " backspace and cursor keys wrap to
set scrolljump=5                      " lines to scroll when cursor leaves screen
set scrolloff=3                       " minimum lines to keep above and below cursor
set foldenable                        " auto fold code
set gdefault                          " the /g flag on :s substitutions by default

set undofile              " Persistent undo (across files)


" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

set hidden " allow hiding buffers with changes

set autoindent
set smarttab
set expandtab

set ai sw=2 sts=2 et

" Force windows to be 80 char wide
set numberwidth=4
set winwidth=84

nnoremap <C-p> :Files<CR>

let g:fzf_layout = { 'down': '~40%' }

" vim-test setup
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"let test#strategy = "vimux"

" Example docker transform
"function! DockerTransform(cmd) abort
"  return 'docker-compose run app '.a:cmd
"endfunction

"let g:test#custom_transformations = {'docker': function('DockerTransform')}
"let g:test#transformation = 'docker'

"let test#python#runner = 'pytest'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['eslint'],
\   'jsx': ['eslint'],
\   'python': ['flake8'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'jsx': ['prettier'],
\   'python': ['autopep8'],
\}

" Make shortcut
nnoremap <Leader>r :VimuxRunCommand('make')<CR>
nnoremap <Leader>u :VimuxRunCommand('make test')<CR>

" jk instead of esc
imap jk <Esc>

" [buffer number] followed by filename:
set statusline=[%n]\ %f
" show line#:column# on the right hand side
set statusline+=%=%l:%c

if exists("$EXTRA_VIM")
  for path in split($EXTRA_VIM, ':')
    exec "source ".path
  endfor
endif

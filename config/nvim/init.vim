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
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'chr4/nginx.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

" vim-scripts repos
"Plug 'vim-scripts/L9'

call plug#end()

let g:vim_markdown_folding_disabled=1

filetype plugin indent on     " required!

" UI stuff
set t_Co=256

syntax on                 " Enable syntax highlighting
color default
colorscheme gruvbox
set background=dark       " Assume a dark background

set backspace=indent,eol,start	" backspace for dummys
set linespace=0		        " No extra spaces between rows
set nu                                " Line numbers on
set showmatch                         " show matching brackets/parenthesis
set incsearch	                        " find as you type search
set hlsearch	                        " highlight search terms
set ignorecase			" case insensitive search
set smartcase                         " case sensitive when uc present
set wildmenu                          " show list instead of just completing
set wildmode=list:longest,full        " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]	        " backspace and cursor keys wrap to
set scrolljump=5                      " lines to scroll when cursor leaves screen
set scrolloff=3                       " minimum lines to keep above and below cursor
set gdefault                          " the /g flag on :s substitutions by default

set undofile              " Persistent undo (across files)


" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

set expandtab
set ai sw=2 sts=2 et

" Force windows to be 80 char wide
set numberwidth=4
set winwidth=84

nnoremap <C-p> :Files<CR>

let g:fzf_layout = { 'down': '~40%' }

" vim-test setup
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

"let test#strategy = "vimux"

" Example docker transform
"function! DockerTransform(cmd) abort
"  return 'docker-compose run app '.a:cmd
"endfunction

"let g:test#custom_transformations = {'docker': function('DockerTransform')}
"let g:test#transformation = 'docker'

"let test#python#runner = 'pytest'

" jk instead of esc
imap jk <Esc>

set statusline=%f%<\:%l\ %h%m%r%=%-14.(%l,%c%V%)\ %P

if exists("$EXTRA_VIM")
  for path in split($EXTRA_VIM, ':')
    exec "source ".path
  endfor
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc.nvim {{{
"
call coc#add_extension(
      \ "coc-json",
      \ "coc-python",
      \ "coc-tsserver",
      \ "coc-css",
      \ "coc-prettier",
      \ "coc-eslint",
      \ "coc-rls",
\)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"}}}

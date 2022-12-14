" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" My bundles
"Plugin 'ervandew/supertab'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'skwp/greplace.vim'
"Plugin 'tomtom/tcomment_vim'
""Plugin 'thoughtbot/vim-rspec'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-unimpaired'
""Plugin 'tpope/vim-vinegar'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'croaky/vim-colors-github'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-haml'
"Plugin 'bling/vim-airline'
""Plugin 'Valloric/YouCompleteMe'
"Plugin 'godlygeek/tabular.git'
""Plugin 'rust-lang/rust.vim'
"Plugin 'maksimr/vim-jsbeautify'
""Plugin 'einars/js-beautify'
"Plugin 'rizzatti/dash.vim'
"Plugin 'fatih/vim-go'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'scrooloose/nerdtree'
""Plugin 'jistr/vim-nerdtree-tabs'
""Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'airblade/vim-gitgutter'
""Plugin 'ledger/vim-ledger'
"Plugin 'elixir-lang/vim-elixir'
""Plugin 'sdiehl/haskell-vim-proto.git'
"Plugin 'metakirby5/codi.vim'
"
"" Colors
"Plugin 'morhetz/gruvbox'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
colorscheme gruvbox
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" ========================================================================
" Ruby stuff
" ========================================================================
syntax on                 " Enable syntax highlighting

set mouse=a

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  "autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  autocmd FileType javascript setlocal ai sw=4 sts=4 et

augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

let mapleader = ","

map <Leader>c :close
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
map <Leader>cc :!cucumber --drb %<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co ggVG"*y
map <Leader>cc :Rjcollection client/
map <Leader>cj :Rjspec client/
map <Leader>cm :Rjmodel client/
map <Leader>cs :call SearchForCallSitesCursor()<CR>
map <Leader>ct :Rtemplate client/
map <Leader>cv :Rjview client/
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>g :Start gitsh<cr>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>fix :cnoremap % %<CR>
map <Leader>fa :sp test/factories.rb<CR>
map <Leader>h :CommandT<CR>
map <Leader>i mmgg=G`m<CR>
map <Leader>l oconsole.log 'debugging'<esc>:w<cr>
map <Leader>m :Rmodel
map <Leader>o :w<cr>:call RunNearestSpec()<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
map <Leader>rf :CommandTFlush<CR>:CommandT<CR>
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep<space>
map <Leader>sj :call OpenJasmineSpecInBrowser()<cr>
map <Leader>sm :RSmodel
map <Leader>sp yss<p>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest
map <Leader>sv :RSview
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>y :!rspec --drb %<cr>
map <Leader>u :Runittest<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>vf :RVfunctional<cr>
map <Leader>vg :vsp<cr>:grep
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<cr>
map <Leader>vv :RVview<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <C-h> :nohl<cr>
imap <C-l> :<Space>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
"map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NerdTree autoload
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
"set nowrap
"set backupdir=~/.tmp
"set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
" Allow cursor keys in insert mode
set esckeys

" Centralize backups, swapfiles and undo history
function! InitBackupDir()
  if has('win32') || has('win32unix') "windows/cygwin
    let l:separator = '_'
  else
    let l:separator = '.'
  endif
  let l:parent = $HOME . '/' . l:separator . 'vim/'
  let l:backup = l:parent . 'backup/'
  let l:tmp = l:parent . 'tmp/'
  if exists('*mkdir')
    if !isdirectory(l:parent)
      call mkdir(l:parent)
    endif
    if !isdirectory(l:backup)
      call mkdir(l:backup)
    endif
    if !isdirectory(l:tmp)
      call mkdir(l:tmp)
    endif
  endif
  let l:missing_dir = 0
  if isdirectory(l:tmp)
    execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if isdirectory(l:backup)
    execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if l:missing_dir
    echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
    echo 'Try: mkdir -p' l:backup
    echo 'and: mkdir -p' l:tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()

" Set the tag file search order
set tags=./tags;

" Use _ as a word-separator
" set iskeyword-=_

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

"set nofoldenable " Say no to code folding...
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
"command! E e
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>


" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
"set noesckeys
set ttimeout
set ttimeoutlen=1

" Turn on spell-checking in markdown and text.
" au BufRead,BufNewFile *.md,*.txt setlocal spell

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>


" Squash all commits into the first during rebase
function! SquashAll()
  normal ggj}klllcf:w
endfunction


function! SearchForCallSitesCursor()
  let searchTerm = expand("<cword>")
  call SearchForCallSites(searchTerm)
endfunction

" Search for call sites for term (excluding its definition) and
" load into the quickfix list.
function! SearchForCallSites(term)
  cexpr system('ag ' . shellescape(a:term) . '\| grep -v def')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Now using thoughtbot/vim-rspec and tpope/dispatch.

let g:rspec_command = "Dispatch bin/rspec {spec}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Don't go past 100 chars on levelup:
autocmd BufNewFile,BufRead /Users/ben/code/levelup/*.rb set colorcolumn=100

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

" Set gutter background to black
"highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<cr>

" Display extra whitespace
set list lcs=tab:???\ ,trail:??,eol:??,nbsp:_

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" For airline/powerline
let g:airline_powerline_fonts = 1

" Go stuff
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
"autocmd BufWritePre *.go Fmt
let g:go_fmt_command = "goimports"
autocmd Filetype go setlocal ts=2 sts=2 sw=2
filetype plugin indent on
syntax on

" Other annoyances
if $VIM_CRONTAB == 'true'
    set nobackup
    set nowritebackup
endif

" virtual tabstops using spaces
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
execute "set tabstop=".my_tab
set expandtab

function! TabToggle()
    if &expandtab
        set shiftwidth=4
        set softtabstop=0
        set noexpandtab
    else
        execute "set shiftwidth=".g:my_tab
        execute "set softtabstop=".g:my_tab
        set expandtab
    endif
endfunction
nnoremap <Leader>t :call TabToggle()<CR>

" fix ^M line endings
function! ConvertLineEndings ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s//\r
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
nnoremap <leader>m :call ConvertLineEndings()<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim

function! AIM ()
    :%s/\t[^\t]*\t[^\t]*\t\d\d\d\d$//g
    :call StripWhitespace()
    :%sort
    :set ff=unix
endfunction

" ========================================================================
" End of things set by me.
" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

set background=dark

" magic searching
nnoremap / /\v


" elixir autoformat
autocmd BufWritePost *.exs,*.ex silent :!mix format --check-equivalent %

" hyper vim airline fix
set t_RV=

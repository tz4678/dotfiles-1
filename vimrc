" Deactivate vi mode
set nocompatible

filetype off

let s:vimrcfile = expand('<sfile>:p')
set viminfo='100,<50,s10,h,n~/.vim/viminfo

" Neobundle - plugin management {{{
if has('vim_starting')
  set rtp +=~/.vim/bundle/neobundle.vim
endif
let g:neobundle#types#git#default_protocol='https'
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Vimproc - allows for asyncronous execution of external programs
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \  'windows' : 'make -f make_mingw32.mak',
      \  'cygwin' : 'make -f make_cygwin.mak',
      \  'mac' : 'make -f make_mac.mak',
      \  'unix' : 'make -f make_unix.mak',
      \  },
      \ }
" }}}
"
" Used all the time
NeoBundle 'scrooloose/syntastic' " Automatic syntax checking
NeoBundle 'tpope/vim-commentary' " Toggle commenting
NeoBundle 'scrooloose/nerdtree' " File navigator
NeoBundle 'tpope/vim-fugitive' " Git bindings
NeoBundle 'mhinz/vim-signify' " Show git changes in gutter
NeoBundle 'thomasloven/vim-tstatus'
NeoBundle 'altercation/vim-colors-solarized'
"
" Used sometimes
NeoBundle 'Shougo/unite.vim' " Unified searching
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'embear/vim-localvimrc' " Source .lvimrc from project root
NeoBundle 'tpope/vim-surround' " Add and change surrounding ({[' and so on
NeoBundle 'sjl/gundo.vim'
"
" Never used
NeoBundle 'EasyMotion' " More advanced jumping
" NeoBundle 'thomasloven/vim-unimpaired' " Some of my changes to unimpaired. Reduntant Should be removed.
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'majutsushi/tagbar' " For source navigation
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'TagHighlight'
NeoBundle 'godlygeek/tabular'

NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'

NeoBundleLocal ~/.vim/bundle-dev

call neobundle#end()

" }}}

let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0

let NERDTreeIgnore=['\.pyc$','\.o$','\~$']

let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm1234567890'

" Git plugins {{{
nnoremap [git] <nop>
" [git]s: Git status
" [git]d: Git diff of current file
" [git]D: Close git diff
" [git]l: Git log of current file in qickfix
" [git]r: Return to current version of file
nnoremap <silent> [git]s :Gstat<CR>
nnoremap <silent> [git]d :Gdiff<CR>
nnoremap <silent> [git]D :diffoff!<cr><c-w>h:bd<cr>
nnoremap <silent> [git]l :Glog<CR>:copen<CR>
nnoremap <silent> [git]r :Gedit %<CR>

" Signify - show git differences in gutter
let g:signify_sign_overwrite = 0
" [git]h: Highlight changed rows
" [git]t: Toggle signify gutter symbols
nnoremap <silent> [git]h :SignifyToggleHighlight<CR>
nnoremap <silent> [git]t :SignifyToggle<CR>

" TODO: These rows don't seem to work...
let g:signify_mapping_next_hunk = '[git]j'
let g:signtify_mapping_prev_hunk = '[git]k'
nnoremap [git]j <plug>(signify-next-hunk)
nnoremap [git]k <plug>(signify-prev-hunk)

let g:signify_sign_add = '+'
let g:signify_sign_change = '*'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '-'
" }}}


" let g:unimpaired_left = '>'
" let g:unimpaired_right = '<'


" TODO: Find a good latex plugin or write one
" LaTeX-Box - latex functions
" NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
" let g:LatexBox_Folding=1

" Navigation
" Undo tree navigation.
let g:gundo_preview_bottom = 1

" Completion
" NeoBundle 'Valloric/YouCompleteMe', { 
"   \ 'build' : {
"   \ 'unix' : 
"   \ './install.sh --clang-completer --system-libclang'},}
" let g:ycm_confirm_extra_conf=0
" let g:ycm_global_ycm_extra_conf='~/bin/dotfiles/ycm_extra_conf.py'
" NeoBundle 'ervandew/supertab'
" let g:SupertabDefaultCompletionType = "context"
" :imap <C-J> <Plug>snipMateNextOrTrigger
" let g:UltiSnipsExpandTrigger="<c-j>"
" NeoBundle 'SirVer/ultisnips'

" Looks
let g:solarized_termtrans=1

filetype plugin indent on

let mapleader = ","
let maplocalleader = ","


call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_split_rule = 'rightbelow'
" ; is way off on Swedish keyboards, so I replace it with ö...
let g:unite_quick_match_table = {
      \     'a' : 0, 's' : 1, 'd' : 2, 'f' : 3, 'g' : 4, 'h' : 5, 'j' : 6, 'k' : 7, 'l' : 8, 'ö' : 9,
      \     'q' : 10, 'w' : 11, 'e' : 12, 'r' : 13, 't' : 14, 'y' : 15, 'u' : 16, 'i' : 17, 'o' : 18, 'p' : 19,
      \     '1' : 20, '2' : 21, '3' : 22, '4' : 23, '5' : 24, '6' : 25, '7' : 26, '8' : 27, '9' : 28, '0' : 29,
      \ }
augroup unite
  au!
  autocmd FileType unite call s:unite_my_settings()
augroup end
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  nmap <buffer> J <Plug>(unite_select_next_line)
  nmap <buffer> K <Plug>(unite_select_previous_line)
  imap <buffer> J <Plug>(unite_select_next_line)
  imap <buffer> K <Plug>(unite_select_previous_line)
  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^grep'
    nnoremap <silent><buffer><expr> o unite#do_action('persist_open')
  endif
endfunction
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = 
    \ '--line-numbers --nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
endif



" Unite prefix binding
nnoremap [unite] <Nop>

" [unite]a: Unite buffers (Active files)
" [unite]s: Unite tags (Source)
" [unite]d: Unite registers (Data)
" [unite]f: Unite Files
" [unite]g: Unite Grep
" [unite]h: Unite lines (Here)
nnoremap <silent> [unite]a 
      \  :<C-u>Unite -buffer-name=buffers -quick-match buffer<CR>
nnoremap <silent> [unite]s
      \  :<C-u>Unite -buffer-name=tags tag<CR>
nnoremap <silent> [unite]d
      \  :<C-u>Unite -buffer-name=register -no-split register<CR>
nnoremap <silent> [unite]f
      \  :<C-u>Unite -buffer-name=files -no-split -start-insert file_rec:!<CR>
nnoremap <silent> [unite]g
      \  :<C-u>Unite -buffer-name=grep grep:.::<CR>
nnoremap <silent> [unite]<space>g
      \  :<C-u>Unite -buffer-name=grep -resume grep<CR>
nnoremap <silent> [unite]h
      \  :<C-u>Unite -buffer-name=lines -no-split -start-insert outline line<CR>


" DISPLAY {{{

set encoding=utf-8
set noshowmode
set showcmd
set visualbell
set cursorline
augroup au_cursorline
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au Winleave * setlocal nocursorline
augroup END
set colorcolumn=+1
set ruler
set laststatus=2
set ttyfast
set lazyredraw
set title


" SYNTAX HIGHLIGHTING {{{
set t_Co=256
syntax enable
set background=dark

" SYNTAX HIGHLIGHTING }}}


" COLOR MAPPINGS {{{

" Change some colors
augroup colors
  au!
  " Colorized background in vimdiff
  au colorscheme * hi DiffAdd ctermfg=0 ctermbg=2
  au colorscheme * hi DiffDelete ctermfg=0 ctermbg=1
  au colorscheme * hi DiffText ctermfg=0 ctermbg=4
  au colorscheme * hi SignColumn ctermbg='NONE'
  " Red spelling mistakes
  au colorscheme * hi SpellBad cterm=undercurl ctermfg=1
  " au colorscheme * hi PmenuSel ctermbg=0 ctermfg=3
augroup END
colorscheme solarized
hi CursorLine ctermbg=16
let g:signify_sign_color_ctermbg='NONE'

" Colors for interesting words
hi def InterestingWord1 ctermfg=16 ctermbg=1
hi def InterestingWord2 ctermfg=16 ctermbg=2
hi def InterestingWord3 ctermfg=16 ctermbg=3
hi def InterestingWord4 ctermfg=16 ctermbg=4
hi def InterestingWord5 ctermfg=16 ctermbg=5
hi def InterestingWord6 ctermfg=16 ctermbg=6

highlight comment ctermfg=5

" COLOR MAPPINGS }}}

" LINE NUMBERS {{{
" Line numbering
set number
set relativenumber
" LINE NUMBERS }}}


" HIDDEN CHARACTERS {{{
" Display tab characters
set list
set listchars=tab:▸\ ,eol:¬,nbsp:·
set showbreak=↪
" HIDDEN CHARACTERS }}}

" FOLDING {{{
" Fold between {{{ and }}}
set foldmethod=marker
" }}}

" DISPLAY }}}


" FILE MANAGEMENT {{{
"
" Don't save backups
set nobackup
set nowritebackup
set noswapfile
set hidden


" Forgot to open a file with sudo? No problem w!! writes anyway
cmap w!! w !sudo dd of=%

set makeprg=make\ -w

"}}}


" TEXT FORMATING {{{

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent


" Line wrapping settings
set wrap
set textwidth=72
set formatoptions=qrn1
set formatprg=par

"}}}


" SEARCHING {{{
"
" I almost always want very magic search
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
noh

" }}}


" NAVIGATION {{{

set scrolloff=3


nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $

" Jump between windows

" Use tab to jump between brackets
vnoremap <tab> %
"}}}


" COMMAND KEYS {{{

set ttimeout
set ttimeoutlen=100
set timeoutlen=300

set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*~,*.d

set mouse=a
"}}} COMMAND KEYS

" Key bindings {{{
"   Normal mode {{{

" !: VimProcBang
" !!: VimProcRead
nnoremap ! :VimProcBang 
nnoremap !! :VimProcRead 
" §: toggle NERDTree
nnoremap <silent> § :NERDTreeToggle<cr>
" /: search, but in very magic mode
nnoremap / /\v
" ,1-6: highlight interesting words
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<CR>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<CR>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<CR>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<CR>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<CR>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<CR>
" tab: Jump between brackets
nnoremap <tab> %
" q: Record macro
" Q: Replay macro
" ,q: close all (don't save)
nnoremap <leader>q :qall!<CR>
nnoremap Q @
nnoremap QQ @@
" w: Move forward one word
" W: Move forward one Word
" ,w: XXX
" <C-w>: window commands
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-w>- <C-w>s
nnoremap <C-w>/ <C-w>v
" e: to end of word
" E: to end of Word
" ,e: XXX
" ,ev: Edit vimrc
execute ":nnoremap <leader>ev :vsplit ". s:vimrcfile. "<cr>"
" r: replace character
" R: replace text
" ,r: XXX
" t: move To forward
" T: move To backward
" ,t: tab handling
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
" y: yank
" Y: yank rest or line
" ,y: XXX
" u: undo
" U: TODO: redo?
" ,u: show Gundo tree
nnoremap <silent> <leader>u :GundoToggle<cr>
" Make i_^u undoable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" i: insert
" I: insert at beginning of line
" ,i: insert single character
nnoremap <leader>i i<space><esc>r
" o: open line below
" O: open line above
" ,o: toggle relative line numbers
nnoremap <leader>o :set rnu!<cr>
" p: paste
" P: paste before
" ,p: show TagBar
nnoremap <silent> <leader>p :TagbarToggle<cr>
" å: XXX
" ^: XXX
"^^: Toggle case in insert mode
inoremap <C-^> x<esc>mzgUb`za<backspace>
" a: append
" A: append at end of line
" ,a: append single character
nnoremap <leader>a a<space><esc>r
" s: substitute?
" S: TODO ?
" ,s: XXX
" ,ss: show syntax highlighting stack (useful?)
" ,sv: resource vimrc
nnoremap <leader>ss :call SynStack()<CR>
nnoremap <leader>sv :so $MYVIMRC<cr>
" d: delete
" D: delete rest of line
" ,d: XXX
" f: find forward
" F: find backwards
" ,f: XXX
" ,fc: save and close buffer
" ,fq: close buffer without saving
map ,fq <esc>:call CleanClose(0)<cr>
map ,fc <esc>:call CleanClose(1)<cr>
" g: Many uses
" G: Goto line (or last line if no count)
" ,g: XXX
" ,gs: Git status
" ,gd: Git diff
" ,gD: close Git diff
nmap <leader>g [git]
" h: move left
" H: move cursor High on the screen
" ,h: XXX
" C-h: move to left window
nnoremap <C-h> <C-w>h
" j: move down
" J: join lines
" ,j: add empty line below
" C-j: move to window below
nnoremap j gj
nnoremap gj j
 " Not for quickfix window
autocmd FileType qf nnoremap <buffer> j j
nnoremap <leader>j o<esc>k
nnoremap <C-j> <C-w>j
" k: move up
" K: lookup keyword
" ,k: add empty line above
" C-k: Move to window above
nnoremap k gk
nnoremap gk k
 " Not for quickfix window
autocmd FileType qf nnoremap <buffer> k k
nnoremap <leader>k O<esc>j
nnoremap <C-k> <C-w>k
" l: move right
" L: move cursor Low on the screen
" ,l: toggle display of unprintable characters
" C-l: Move to right window
nnoremap <C-l> <C-w>l
nnoremap <leader>l :set list!<cr>
" ö: shortcut to command mode
" Ö: Command window
nnoremap ö :
nnoremap Ö q:a
" ä: XXX
" ': XXX
" *: search for line under cursor, but don't move
nnoremap * *<c-o>
" <: decrease indent
" >: increase indent
" z: many uses
" Z: XXX
" ,z: show current position
" C-z: Background vim
nnoremap <leader>z mzzMzvzz5<c-e>`z:Pulse<CR>
" x: delete character
" X: delete character backwards?
" ,x: XXX
" c: change
" C: change rest of line
" ,c: copy file and open copy
nnoremap <leader>c :call RenameFile(1)<cr>
" v: visual mode
" V: visual line
" ,v: XXX
" C-v: visual block
" b: back a word
" b: back a Word
" ,b: Buffer list (replace with unite?)
nnoremap <leader>b :LustyJuggler<cr>
" n: next search hit
" N: previous search hit
" ,n: move open file
" ^n: Previous tab
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap <leader>n :call RenameFile(0)<cr>
nnoremap <c-n> :tabprevious<cr>
" m: set mark
" M: move cursor to the Middle of screen
" ,m: XXX
" ^m: Next tab
nnoremap <c-m> :tabnext<cr>
" ,: leader key
" ;: XXX
" ,,: easymotion trigger
" .: repeat command
" :: command mode
" ,.: alternate file
noremap <leader>. <C-^>
" -: jump to mark line
" _: jump to mark
" ,-: XXX
" C--: Jump to tag
nnoremap - '
nnoremap _ `
nnoremap <c-_> g<c-]> " Show list of tags if there are more than one
nnoremap g<c-_> <c-]>
nmap [1;5m <c-_>
nmap g[1;5m g<c-_>
" <space>: [unite] prefix
" ,<space>: Remove search highlighting
nmap <space> [unite]
nnoremap <silent> <leader><space> :call UnHiInterestingWord()<CR>:noh<CR>
"   Normal mode }}}
" }}}

" FILETYPE {{{

""" ASM
augroup au_asm
  au!
  autocmd FileType asm setlocal commentstring=;\ %s
augroup END

""" c
augroup au_c
  au!
  autocmd FileType c setlocal ts=2 sts=2 sw=2 expandtab foldmethod=syntax commentstring=/*\ %s\ */
  autocmd FileType c inoremap {{ {<CR>}<ESC>O
  autocmd FileType c inoremap {<CR> {<CR>}<c-o>O
augroup END
set cinoptions=l1

""" Makefile
autocmd FileType make setlocal ts=8 sts=8 sw=8 noet foldmethod=indent

""" MATLAB
autocmd FileType matlab setlocal commentstring=%\ %s
autocmd FileType matlab setlocal foldmethod=indent

""" Vim
autocmd FileType vim setlocal keywordprg=:help

""" markdown
autocmd BufRead *.md setlocal ft=markdown
autocmd FileType markdown setlocal ts=4 sts=4 sw=4 noet foldmethod=syntax
"autocmd FileType tex setlocal foldmarker=(fold),(end)

""" python
augroup au_python
  au!
  autocmd FileType python map ,m :w<cr>:execute '!python3 %'<cr>
  autocmd FileType python map ,n :Dispatch nosetests<cr>
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType python setlocal textwidth=79 cc=1,5,9,13,17,21,+1
augroup END

autocmd CmdWinEnter * nnoremap <buffer> <ESC> <C-c><C-c>


""" LaTeX
let texSections=['section','subsection','subsubsection','chapter']
autocmd FileType tex,plaintex setlocal foldmethod=expr foldexpr=GetLatexFold(v:lnum) foldtext=LatexFoldText()

function! GetLatexFold(lnum)
  if getline(a:lnum) =~? '\v^\s*\\section'
    return '>1'
  endif
  if getline(a:lnum) =~? '\v^\s*\\subsection'
    return '>2'
  endif
  if getline(a:lnum) =~? '\v^\s*\\subsubsection'
    return '>3'
  endif
  if getline(a:lnum) =~? '\v^\s*\\begin\{document\}'
    return '>1'
  endif
  if getline(a:lnum) =~? '\v^\s*\\begin'
    return 'a1'
  endif
  if getline(a:lnum-1) =~? '\v^\s*\\end'
    return 's1'
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  if(a:lnum) == 1
    return 1
  endif
  return '='
endfunction

function! LatexFoldText()
  let fs = v:foldstart
  let line = getline(fs)
  let foldSize = 1 + v:foldend - v:foldstart

  return '+-- ' . line . ' -- [' . foldSize . ' lines]'

endfunction

" FILETYPE }}}

" FUNCTIONS {{{

function! RenameFile(copy) "{{{
  " Asks for a new filename. Copies if copy is true, otherwise moves the file
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    if a:copy == 0
      exec ':silent !rm ' . old_name
    endif
    redraw!
  endif
endfunction "}}}

function! g:ToggleNuMode() "{{{
  " Toggle absolute and relative numbering mode
  if(&rnu==1)
    set nu
  else
    set rnu
  endif
endfunc "}}}

function! CleanClose(toSave) "{{{
  " Close files and remove buffers
  if (a:toSave == 1)
    w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
  else
    bnext
  endif
  if (bufnr("%") == todelbufNr)
    new
  endif
  exe "bw!".todelbufNr
endfunction "}}}

function! SynStack() "{{{
  " Shows the syntax highlighting stack
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc "}}}

function! s:Pulse() "{{{
  " Pulse - An awesome function by Steve Losh
  let current_window = winnr()
  windo set nocursorline
  execute current_window . 'wincmd w'
  setlocal cursorline

  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 9
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 *width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

function! HiInterestingWord(n) "{{{
  " Highlight word - Another awesome function by Steve Losh
  normal! mz
  normal! "zyiw
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
  let pat = '\V\<' . escape(@z, '\') . '\>'
  call matchadd("InterestingWord" . a:n, pat, 1, mid)
  normal! `z
endfunction "}}}

function! HiInterestingVisual(n) "{{{
  normal! gv"zy
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
  let pat = '\V' . escape(@z, '\')
  call matchadd("InterestingWord" . a:n, pat, 1, mid)
  normal! gv
endfunction "}}}

function! UnHiInterestingWord() "{{{
  " Unhighlight word functin - By me :)
  for i in range(1,6,1)
    let mid = 86750 + i
    silent! call matchdelete(mid)
  endfor
endfunction "}}}


function! Preserve(command) "{{{
  " Preserve by Jonathan Palardy
  let _s=@/
  let l=line(".")
  let c=col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction "}}}

" }}}


let s:scratch_name='--Scratch--'

function! s:ToggleScratch()

  let scr_bn = bufnr(s:scratch_name)

  " Create a scratch buffer if none exists
  if scr_bn == -1
    execute 'new'. s:scratch_name
    setlocal bufhidden=hide
    setlocal buflisted
    setlocal buftype=nofile
    setlocal foldcolumn=0
    setlocal nofoldenable
    setlocal nonumber
    setlocal norelativenumber
    setlocal noswapfile
    setlocal filetype=scratch
    autocmd BufEnter <buffer> call <SID>autoclose_scratch()
    nnoremap <buffer> ,c <esc>:call CleanClose(0)<cr><c-w>c
  else
    let scr_wn = bufwinnr(scr_bn)
    " Switch to it if it does exist
    if scr_wn == -1
      execute 'split +buffer'. scr_bn
    else
      if winnr() != scr_wn
        execute scr_wn . 'wincmd w'
      else
        " Close it if already in
        wincmd c
        wincmd p
      endif
    endif
  endif
endfunction


function! s:autoclose_scratch()
  if winbufnr(2) ==# -1
    if tabpagenr('$') ==# 1
      bdelete
      quit
    else
      close
    endif
  endif
endfunction

command! -nargs=0 Scratch call <SID>ToggleScratch()
nnoremap <silent> gs :Scratch<CR>

NeoBundleCheck

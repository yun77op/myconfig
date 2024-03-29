"""""""""""""""""""""""""""""""""""
" Yunhu Jiang(yun77op@gmail.com)
"
"""""""""""""""""""""""""""""""""""

call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compatibility
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  set nocompatible
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  lang messages zh_CN.UTF-8

  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

set fileencodings=utf-8,cp936,big5,latin1

if has("win32")
  set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

" Sets how many lines of history VIM has to remember
set history=700

syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

set foldmethod=syntax
set foldlevelstart=1

let javascript_fold=1
let ruby_fold=1
let sh_fold_enabled=1
let vimsyn_folding='af'

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>

nnoremap <leader>q :call QuickfixToggle()<cr>
inoremap <leader>fh <esc>:call FileHeading()<cr>jA

if has("unix")
    " For mac users (using the 'apple' key)
    map <D-S-]> gt
    map <D-S-[> gT
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
else 
    " for linux and windows users (using the control key)
    map <C-S-]> gt
    map <C-S-[> gT
    map <C-1> 1gt
    map <C-2> 2gt
    map <C-3> 3gt
    map <C-4> 4gt
    map <C-5> 5gt
    map <C-6> 6gt
    map <C-7> 7gt
    map <C-8> 8gt
    map <C-9> 9gt
    map <C-0> :tablast<CR>
endif

" working with windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" vmap :<','>m'>+

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"Fast editing of .vimrc
nnoremap <silent> <leader>e :e $MYVIMRC<cr> "$MYVIMRC is a special variable that points to your ~/.vimrc file
nnoremap <silent> <leader>se :vsplit $MYVIMRC<cr>

"Fast reloading of the .vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

autocmd! bufwritepost *vimrc source $MYVIMRC

nnoremap <D-x> :tabclose<CR>

inoremap jk <esc>

iabbrev ssig -- <cr>Yunhu Jiang<cr>yun77op@gmail.com

" Deleting trailing white spaces
augroup deleting_trailing_ws
    autocmd!
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.js :call DeleteTrailingWS()
augroup END

onoremap p i(

onoremap in( :<c-u>normal! f(vi(<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

nmap <leader>$ :call DeleteTrailingWS()<CR>
nmap <leader>= :call Preserve("normal gg=G")<CR>

nnoremap <leader>4 :w<cr>:make<cr><cr>:call QuickfixToggle()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

if has("win32")
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/* " Linux/MacOSX
endif

" Always show current position
set ruler

set number

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme desert
" set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
" set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2 shiftwidth=2

autocmd FileType html setlocal expandtab
autocmd FileType css setlocal expandtab
autocmd FileType javascript setlocal expandtab

set smarttab

" Linebreak on 500 characters
set linebreak
set textwidth=500
set wrap

set autoindent
set smartindent

set sessionoptions-=curdir
set sessionoptions-=sesdir


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}\ \ Line:\ %l


""""""""""""""""""""""""""""""
" => Languages
""""""""""""""""""""""""""""""

" ### xml
" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml


" ### javascript
autocmd filetype javascript setlocal makeprg=jslint\ %
autocmd filetype javascript setlocal errorformat=%+P%f,
																								\%A%>%\\s%\\?#%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
																								\%-G%f\ is\ OK.,%-Q

" ### html
augroup filetype_html
	autocmd!
	" autocmd BufWrite,BufRead *.html :normal gg=C
	autocmd filetype html setlocal makeprg=tidy\ -iemq\ %
augroup END

augroup iabbrev
    autocmd FileType javascript :iabbrev <buffer> iff if ( ) {}<left><left><left><left><left>
    autocmd FileType python     :iabbrev <buffer> iff if:<left>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction


" Delete trailing white space on save
func! DeleteTrailingWS()
  call Preserve("%s/\\s\\+$//e")
endfunc

function! FileHeading()
  let line = line(".")
  call setline(line, "/*********************")
  call append(line, " Description - ")
  call append(line + 1, " Author - Yunhu Jiang")
  call append(line + 2, " Date - " . strftime("%b %d %Y"))
  call append(line + 3, "********************/")
endfunction


function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! FormatHtml()
	normal! ggVGJ
	%s/>\s*</>\r</g
	normal! gg=G
endfunction


	

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""
" Ctrlp
"---------------

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(node_modules)$',
  \ 'file': '\v\.(dll)$',
  \ }



" Netrm
" -----
let g:netrw_winsize = 80
let g:netrw_browse_split = 2
nmap <silent> <leader>se :Sexplore!<cr>

" Tag list
" --------
if has("win32")
	let Tlist_Ctags_Cmd = 'ctags'
else
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

let Tlist_Show_One_file = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1


nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[v`]y"
	else
		return
	endif

	silent excute "grep! -R " . shellescape(@@) . " ."
	copen

	let @@ = saved_unnamed_register
endfunction

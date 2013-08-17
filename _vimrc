"AppData\" --- Default Init Stuff --- "
"set compatible
set nocompatible
set nocp
if version >= 600
filetype plugin indent on
endif

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin "to find settings and mappings see: mswin.vim
"save when exiting insert, hide errors for unnamed files
au InsertLeave * silent! wa
cno kj <c-c>
vno v <esc>
ino kj <C-[>
cno kj <c-c>
vno v <esc>
imap <esc> <nop>

"load plugins
so ~\vimfiles\after\plugins.vim

set encoding=utf-8
noremap <silent> <leader>- :set nocursorline<CR>
"set fileencodings=utf-8,latin1
"UTF8 suggestion
"http://www.maruko.ca/i18n/
noremap <leader>w :w! ++enc=utf-8<CR>
inoremap <leader>w <Esc>:w! ++enc=utf-8<CR>
nnoremap <leader>s :w! <CR>
inoremap <leader>s <Esc>:w! <CR>
"let w:nonlocalfile = "yes"
"function! EncodeUTF8()
"if exists("w:") && w:nonlocalfile == "no"
"setlocal fenc=utf-8
"w! ++enc=utf-8<CR>
"else
"setlocal fenc=utf-8
"w! <CR>
"endif
"endfunction


set loadplugins
"turn off annoying matching paren, bracket flashing
let loaded_matchparen = 0
"Turn off auto-indent in a single file
":setlocal noautoindent


noremap <silent> <leader>r :call SetEditingNetFile()<CR>

"remote edit
"-batch = disable all interactive prompts... interesting

"Vimcolour - plugin for easier colorscheme writing
"metacosm = good colorscheme
":23,30m200 - Move lines 23-30 to line 200
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
let loaded_matchparen = 0

set matchpairs=
map <leader>, :nohls<CR>
map <leader>x :bd<CR>
map <leader>q :q<CR>

" On Windows, open current file in browser
nnoremap <silent> <F5> :update<Bar>silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p"<CR>
nnoremap <C-F5> :update<Bar>silent !start "c:\Program Files\Internet Explorer\iexplore.exe" "file://%:p"<CR>
nnoremap <S-F5> :update<Bar>silent !start "F:\Firefox\firefox.exe" "file://%:p"<CR>

" ---Indenting settings---"
"tab/shift tab indent selected code
vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

"nnoremap <tab> % 		"Tab = Match brackets etc.
"vnoremap <tab> % 		"Tab = Match brackets etc.
"
"set noet
"set pi
"keeps previous lines indent
set ai
set ci
" ---Tab Stops ---"
" always round indents to multiple of shiftwidth (dos edit.com style)
set shiftround
set softtabstop=0
set shiftwidth=4
set tabstop=4

"shows matching <{([, etc
set noshowmatch
"kills button bar
"+=b "show horizontal scroll bar
set guioptions-=T
"set virtualedit=all
"show editing mode in statusline
set showmode
"This will read the file (on focus) if it has changed.
"set autoread

" ---Matchit = Jump to <html></html> with %---
:runtime macros/matchit.vim
:runtime FileType html,htm,js ~/vimfiles/bundle/matchit/plugin/matchit.vim

"window sizew settings
"start editing at 6th column
set ruler
set number
set wmw=0
set background=dark
set nuw=6
set columns=85

set guifont=Consolas:h10.5
" show cursor (x,y) in statusbar

" search ignoring case
set ignorecase
set history=200
set backspace=indent,eol,start
"wrap at punctuation
set linebreak
" 1000 undos
set undolevels=1000
"Omnicompletion types see help cpt complete completion-types
"wildchar
"completeopt
". - current bufferm
"w - other window buffers
"u - unloaded (hidden buffers)
"U = closed buffers
"k = dictionary
"kspell = spellfile
"k{dict} - (remove {})e.g. :set cpt=k/usr/dict/*,k~/spanish
"i - included files
"d - scan current and included files for defined name or macro C-X C-D
"	As you can see, CTRL-N and CTRL-P can be used to do any 'iskeyword'-
"	based expansion (e.g., dictionary |i_CTRL-X_CTRL-K|, included patterns
"	|i_CTRL-X_CTRL-I|, tags |i_CTRL-X_CTRL-]| and normal expansions).
set complete=.,w,b,u,U,t,i,d
"see :h cscope-options


"--- GUI ---
"<F7>   Font size
"<F8> 	Width
"<F9>	Height
" Shift > bigger;  Ctrl > smaller
"
set guifont=Consolas:h10.5

"this has issues (are both window and editing window changing size?)
"augroup guiappearance
augroup winappearance
  au!
  :map <F9> :set lines+=5<CR>
  :map <S-F9> :set lines-=5<CR>
  :map <C-F9> :set lines=60<CR>
  :map <M-F9> :set lines=30<CR>
  :map <F8> :set columns+=10<CR>
  :map <S-F8> :set columns-=10<CR>
  :map <C-F8> :set columns=132<CR>
  :map <M-F8> :set columns=85<CR>
augroup END
augroup localappearance2
  au!
  :map <M-+> <C-W>+
  :map <s-F9> <C-W>10+
  :map <C-F9> <C-W>-
  :map <M-F9> <C-W>10-
  :map <F8> <C-W>>
  :map <S-F8> <C-W>10>
  :map <C-F8> <C-W><

  :map <A-=> <C-W>=
  :map <kMultiply> <C-w>>
  :map <C-kMultiply> <C-W>5>
  :map <A-kMultiply> <BAR>
  :map <kDivide> <C-w><
  :map <C-kDivide> <C-W>5<
  :map <A-kDivide> <C-W><BAR>

  :map <kMinus> <C-W>-
"  :map <C-kMinus> <C-W>5-
  :map <A-kMinus> <C-W>z1<Cr>
  :map <kPlus> <C-W>+
"  :map <C-kPlus> <C-W>5+
  :map <A-kPlus> <C-W>_
augroup END


let g:WinMode = "vim"
function! WindowToggle()
  if g:WinMode == 'vim'
	let g:WinMode = "os"
    echo "OS Vim Window Resizing Mode"
  else
	let g:WinMode = "Vim"
    echo "Editing file Vim Window Resizing Mode"
  endif
endfunction

" file format specific config files
:au! BufRead,BufNewFile FileType java so ~\vimfiles\after\java.vim
:au! BufRead,BufNewFile FileType html so ~\vimfiles\after\html.vim

"Dragging mouse selects Visually
set selectmode=key

"Open current line in browser (Linux?)
function! Browser ()
  let line = getline (".")
  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "!netscape ".line
endfunction
map <Leader>w :call Browser ()<CR>
"
"vnoremap <silent> <C-F5> :<C-U>let old_reg=@"<CR>gvy:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>

"search google for word:
map ?g "zyiw
 \ :exec ':silent ! start http://www.google.com/search?q=";'.@z.'"'<CR>

"Visual mode search and replace
vnoremap <leader><S-r> "hy:%s/<C-r>h//gc<left><left><left>
"Go to the beginning or end of visual selection
vnoremap gt <esc>`>:exec 'norm '.visualmode().'`<lt>'<cr>
vnoremap gb <esc>`<lt>:exec 'norm '.visualmode().'`>'<cr>


" Fast saving
nmap <leader>w :w!<cr>
map <leader>e :e $MYVIMRC<CR>
map <leader><S-s> :so $MYVIMRC<Cr>:nohls<Cr>
map - nohls
" inner word toUpper() toLower()
nmap <leader>u viwU
nmap <leader>l viwu

"load before filetype plugin indent on

"--- Easy Motion ---"
let g:EasyMotion_leader_key = '\'

"--- Load Pathogen ---"
call pathogen#infect()
"automatically load plugins here:
":runtime! plugin/**/*.vim


"nmap <leader>w :w!<CR>
"imap <leader>w <ESC>:w!<CR>
"Stop asking to ! override buffer for unsaved changes

"--- Word Wrapping stuff ---"

"	*buffer-variable* *b:var*
function! TYShowBreak()
if &showbreak == ''
set showbreak=>
echo "show wrapped lines: >"
else
set showbreak=
echo "hide wrapped lines"
endif
endfunction

"Copy and paste to/from system clipboard
let g:wrapmodegmove = "yes"
function! TYToggleBreakMove()
if exists("g:") && g:wrapmodegmove == "yes"
let g:wrapmodegmove = "no"
echo "g-motions off"
else
let g:wrapmodegmove = "yes"
echo "g-motions on"
endif
endfunction


let g:wrapmodegmove = "yes"
function! TYToggleBreakMove()
if exists("g:") && g:wrapmodegmove == "yes"
	let g:wrapmodegmove = "no"
	echo "g-motions off"
else
	let g:wrapmodegmove = "yes"
	echo "g-motions on"
endif
endfunction

function! ScreenMovement(movement)
  if &wrap && g:wrapmodegmove == 'yes'
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
vnoremap <silent> <expr> j ScreenMovement("j")
vnoremap <silent> <expr> k ScreenMovement("k")
vnoremap <silent> <expr> 0 ScreenMovement("0")
vnoremap <silent> <expr> ^ ScreenMovement("^")
vnoremap <silent> <expr> $ ScreenMovement("$")
onoremap <silent> <expr> <End> ScreenMovement("<End>")
nnoremap <silent> <expr> <End> ScreenMovement("<End>")
vnoremap <silent> <expr> <End> ScreenMovement("<End>")
onoremap <silent> <expr> <Home> ScreenMovement("<Home>")
nnoremap <silent> <expr> <Home> ScreenMovement("<Home>")
vnoremap <silent> <expr> <Home> ScreenMovement("<Home>")
"function! insertgmove()
"inoremap <silent> <expr> <up> <c-o> screenmovement("<up>")
"inoremap <silent> <expr> <down> <c-o> screenmovement("<down>")
"inoremap <silent> <expr> <end> <c-o> screenmovement("<end>")
"inoremap <silent> <expr> <home> <c-o> screenmovement("<home>")

nmap <expr> \b TYShowBreak()
nmap <expr> \g TYToggleBreakMove()

"C-F2 = Show WordWrapping Character
nmap  <expr> <C-F2>  TYShowBreak()
"A-F2 = Toggle wrapping moves (ScreenMovement)
nmap  <expr> <A-F2>  TYToggleBreakMove()

"c-0 = open calculator
noremap <C-k0> :silent ! start calc<Cr>
noremap <C-kPlus> 1<C-A>
noremap <C-kMinus> 1<C-X>
"Scrolling - alt + j/k = down 1 line
noremap <A-j> jzz
noremap <A-k> kzz
"Space = like a web browser
noremap <Space> <PageDown>
noremap <S-Space> <PageUp>


" clear hlsearch
set nohls
" highlight as we search however
set incsearch
" nmap <silent> ,/ :nohlsearch<CR>
" Use Q for formatting the current paragraph (or selection)
" vmap Q gq
" nmap Q gqap

"http://vimrc-dissection.blogspot.com/
:let b:var = &ft
function! ChangeFT()
"broken I think
	if b:var ==? "html"
		let b:var = "php"
	else
		let b:var = "html"
	endif
	let &ft = b:var
	set ft?
endfunction
nmap <f4> :call ChangeFT()<cr>


nnoremap / /\v
vnoremap / /\v
"vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Complete whole filenames/lines easier
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Quickly close the current window
"nnoremap <leader>q :q<CR>

"hide space and tab by default
set nolist
" ...

" delete previous word
imap <c-bs> <c-w>
" mapping to select stuff
nmap <leader>0 vib
nmap <leader>9 vib
nmap <leader>" vi"
nmap <leader>' vi'

"--- wrap toggle with f2 key---"
function! ToggleWrap()
set wrap!
echo &wrap ? 'wrap' : 'nowrap'
endfunction

"F2 toggles wrap (Thanks to Alexandre Moreira)
nnoremap <silent> <F2>      :call ToggleWrap()<CR>
vnoremap <silent> <F2> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F2> <C-O>:call ToggleWrap()<CR>


colo asmanian_blood
" --- Colorschemes ---
"colo jellybeans
"colo jellyx
"colo wombat
"colo peaksea
set wildmenu

set nowrap
nmap <f2> :set wrap! wrap?<cr>
"Toggle wordwrap
"map <F9>  :set wrap!<Bar>set wrap?<CR>
"Contrl b = kill tab
map <silent> <C-b> :bd<cr>

"Format (indent) pasted text
map <F10> :set paste!<Bar>set paste?<CR>

"""" De whitespace"""
"kill whitespace at end of line:
"map \ :1,$s/[ <tab>]*$//
"Auto-Remove trailing white-space once the file is saved
au BufWritePre * silent g/\s\+$/s///
"turn off broken cursorlines for editing remote files
au BufWritePost * silent :set nocursorline


" Use CTRL-S save file all modes
no <C-S> :update!<CR>
vno <C-S> <C-C>:update!<CR>
ino <C-S> <C-O>:update!<CR>

"F,f T,t reversed
noremap ,. ,
let mapleader = ","
let g:mapleader = ","

"Insert a line (can add a repeater number to the front to do # of lines)
nmap <leader><CR> i<CR><Esc>

noremap <F12> :browse confirm e
inoremap <F12> <C-o>:browse confirm e<cr>
"vnoremap <F12> <C-c><esc>:browse confirm e<cr>
"other file opening stuff

"Open file in Chrome (needs echoing of folder when hitting alt, ctrl f7)
map <silent><leader><C-o> :update<CR>:silent ! start "E:\Users\James.Affleck\AppData\Local\Google\Chrome\Application\chrome.exe" "file://%:p:gs?/?\\?"<CR>
map <silent><F6> :update<CR>:silent ! start "E:\Users\James.Affleck\AppData\Local\Google\Chrome\Application\chrome.exe" http://localhost/%:t<CR>
map <silent><F7> :update<CR>:silent ! start "E:\Users\James.Affleck\AppData\Local\Google\Chrome\Application\chrome.exe" http://localhost/%:t<CR>
"Look up word on dictionary.com
nmap \l :silent ! start "E:\Users\James.Affleck\AppData\Local\Google\Chrome\Application\chrome.exe" http://dictionary.reference.com/search?q=<cWORD><CR>
"URL for webster's: http://www.m-w.com/cgi-bin/dictionary?book=Dictionary&va=
"Open current line in web browser:
"http://vim.wikia.com/wiki/VimTip306
"open web browser to url in current line:
"http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
"More on regex:
"http://www.8t8.us/vim/vim.html
"C & Snippets, also configure online documentation searching based on filetype
"http://www.swaroopch.com/notes/Vim_en:Programmers_Editor

"Automatically enter search and replace mode and start typing S term
"noremap ;; :%s:::g<Left><Left><Left>
"noremap ;' :%s:::cg<Left><Left><Left><Left>

"set current working directory of window (local) to file path:
:lcd %:p:h
"Autoset current working directory to the current file, could be set with HTML files too.
autocmd BufEnter * silent! lcd %:p:h
"quick directory change to file path:
nnoremap ,cd :cd %:p:h<CR>

:let fname =expand('%:p:h')
"fnameescape({string})
function! HTMLChromeRewrite()
let b:HTMLfilename=expand('%:p:h')
echo b:HTMLfilename
:unlet! b:HTMLfilename
endfunction
":h usr_41.txt

"map <f4> :call HTMLChromeRewrite()<cr>


"Copy and paste to/from system clipboard
vmap <a-c> "*y
"vmap <a-z> <c-v><up>$<cr>
"paste and reindent pasted text
vmap <a-z> "*pV`]=

"paste and reindent pasted text
inoremap <a-z> <Esc>"*pV`]=

"Copy entire file to clipboard
"nmap <leader>a gg"*yG
"vmap <leader>a gg"*yG

"mouse visual block (ala MS Word)
"nmap <A-LeftMouse> <LeftMouse><C-V>
"vmap <A-LeftDrag> <LeftDrag>
"imap <A-LeftMouse> <LeftMouse><C-O><C-V>
"vmap <A-LeftMouse> <Esc><LeftMouse><C-V>

"Alt + right mouse = copy to SysClipboard
"Mapping Mouse events:
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)#Mapping_mouse_events
"nmap <A-RightMouse> "*y
vmap <A-RightMouse> "*y
imap <A-RightMouse> <C-o>"*y

"paste over selected from sys clipboard
vmap <leader>c <C-o>"*p
"pastes the clipboard after the current line, and
":put +



"HardWrap Paragraphs
"Leader + q
nnoremap <leader>q gqip

"I've seen various replacements for the fmt command that you can use to format paragraphs almost automatically. Mine's better:
"http://hea-www.harvard.edu/~fine/Tech/vi.html
":map v 0ma}b:'a,.j<ctrl-v><return>070 ?  *<ctrl-v><escape>dwi<ctrl-v><return><ctrl-v><escape>

"Reselect Pasted text
"allows you to indent it/ or <leader>i/b to put in italics/bolding
nnoremap <leader>v `[v`]
"Search for selected text:
"Yank, then / then Ctrl+R 0
vmap <leader>n y<C-R>0
"Couldn't get this working: http://stackoverflow.com/questions/363111/search-for-selection-in-vim

"VISUAL MODE Replace Highlighted Globally text globally (y/n)
vnoremap <leader><S-R> "hy:%s/<C-r>h//gc<left><left><left>

"Marks:
" m + a-z = set  a-z (book)mark
" ` + a-z = goto a-z (book)mark
" ' + a-z = goto a-z (book)mark (skip to first non-blank line)
" '' `` = goto last jump locatio


"title case  - Doesn't seem to work using behave mswin (as far as I can tell).
"vmap <leader>t :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/gic<cr>


" launching Win IE
":nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
":nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>

" appending to registers (use CAPITAL)
" yank 5 lines into "a" then add a further 5
"  "a5yy
"  10j
"  "A5yy

"Ctrl +/- = Increment/Decrement a number
noremap <C-kplus> <C-a>
noremap <C-kminus> <C-x>

"  --- Arrow Keys - + Alt = scroll with cursor centered --- "
map <A-j> jzz
map <A-k> kzz

"  --- Window Splits = Switch to window = Control + hjkl --- "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

", W =  Strip all trailing whitespace
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>



 " Delete buffer, keep layout
if has("eval")
    command! Kwbd enew|bw #
    nmap     <C-w>!   :Kwbd<CR>
endif


"-- Mappings --"
" , , =  turn off search highlighting
" , q =  HardWrap Paragraphs
" , dt = remove <tag>but keep inner text
" , V =  reselect Pasted Text (for adjusting indentation)
" , e =  Edit my .vimrc file
" , s =  Reload _Vimrc settings into VIM on Unix change $HOME to ~/.vimrc
" , ] =  ++Char under cursor - not yet working
" , [ =  --Char under cursor - not yet working
" , u =  Make word uppercase
" , l =  Make word lowercase
" k j =  Esc out of insert mode
nnoremap <leader>, :noh<CR>
"nnoremap <leader>q gqipi
nmap <leader>dt vityvatp
nnoremap <leader>v V`]
nnoremap <leader>e :e! $MYVIMRC<CR>
nnoremap <leader><S-s> :source $MYVIMRC<CR>
"map <leader>] <Ctrl-A>
"map <leader>[ <Ctrl-X>
nnoremap <leader>u viwU
vnoremap <leader>u U
nnoremap <leader>l viwu
vnoremap <leader>l u

":set columns
":set lines

colorscheme asmanian_blood



"--- Visual mode related ---"
" Select something, */# search for highlighted forward / backward
"---------------------------"
" From http://amix.dk/vim/vimrc.html



" --- Backups and swaps --- "
set nobackup
set nowritebackup
set noswapfile
"--- Save swap file to temp
set backupdir=/var/temp
set directory=/var/temp


"set guioptions+=b "show horizontal scroll bar
set guioptions-=T  "remove toolbar
"set guioptions-=m  "remove menu bar
"set guioptions-=r  "remove right-hand scroll bar
set ttyfast 		"faster screen terminal redrawing
set ignorecase
"search: don't ignore case if upper entered
set smartcase
"set selectmode=key "This will turn off select mode when using mouse and will use visual instead
"global replace = default
"set gdefault
"See :help fo-table
set formatoptions=qrn1
"set selectmode=key "This will turn off select mode when using mouse and will use visual instead
set showmode
"no folds by default
set nofoldenable
"set autoread "This will read the file (on focus) if it has changed.

"set cindent
"set indentexpr=
"let ind = indent(prevnonblank(v:lnum - 1))
"set matchpairs=(:),{:},[:]
"set matchtime=1      " blink matching chars for .x seconds


"Not totally sure what these do (I think they might disable f1 - f3 stuff
"nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
"nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>


" --- Tab Stop Settings ---"
set shiftround                  " always round indents to multiple of shiftwidth
"set copyindent                  " use existing indents for new indents
"set preserveindent              " save as much indent structure as possible
" tab and backspace are smart Add Tabs in
set smarttab

"this disables using Vim's indening files in /indent. All i want, really is
"for the indent to follow the previous line. This also fixes PHP problems I
"was having. Indenting for Js,CSS,PHP,HTML is aweful in vim.
filetype indent off
filetype plugin on


"For buffer switching
set wmw=0

"""""""""""""""""""""""""""""""""""""
"   GUI +
"   Font size <F7>
"   <F8> 	Width
"   <F9>		Height
"   Shift > bigger;  Ctrl > smaller
"""""""""""""""""""""""""""""""""""""
"I never use these
"It might be nice to have it swap between regular, small and max
augroup guiappearance
  au!
  "set guifont=Andale_Mono:h12

  "set guifont=ProggyCleanTT:h12:cANSI
set guifont=Consolas:h10.5
"set guifont=DejaVu_Sans_Mono:h10:cANSI
  ":map <F7> :set guifont=Andale_Mono:h12<CR>
  ":map <S-F7> :set guifont=Andale_Mono:h10<CR>
  ":map <C-F7> :set guifont=Andale_Mono:h14<CR>
  :map <F9> :set lines+=5<CR>
  :map <S-F9> :set lines-=5<CR>
  :map <C-F9> :set lines=60<CR>
  :map <M-F9> :set lines=30<CR>
  :map <F8> :set columns+=10<CR>
  :map <S-F8> :set columns-=10<CR>
  :map <C-F8> :set columns=132<CR>
  :map <M-F8> :set columns=85<CR>
augroup END


"--- Enable line number displaying, typing starts at 6th character in from left, and make window width wider when starting---"
set number
set nuw=6
"set columns=85
"this makes the window start as a certain size.
"Small size-
"set lines=35 "height
"set columns=150 "width
"Big size-
set columns=210
set lines=50
" show the line number on the bar
set ruler
" don't redraw when don't have to
set lazyredraw

"keep 5 lines above/below / beside cursor
"set scrolloff=5
"set sidescrolloff=5
" command line two lines high
"set cmdheight=2
set undolevels=1000
" switch every 100 chars
set updatecount=100
" do lots of scanning on tab completion
set complete=.,w,b,u,U,t,i,d

" --- Script: Disable error bell and visual bell @ startup --- "
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" set omnicomplete
if has('autocmd')
"autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
endif

"--- Fix mistypings for saving ----"
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

iab anf and
iab adn and
iab ans and
iab teh the
iab thre there


"--- Spelling toggle with <F10> ---"
function! ToggleSpell()
	set spell!
	echo &spell ? 'spell' : 'nospell'
endfunc
nnoremap <silent> <F10>      :call ToggleSpell()<CR>
vnoremap <silent> <F10> <C-C>:call ToggleSpell()<CR>
inoremap <silent> <F10> <C-O>:call ToggleSpell()<CR>

set nospell
set spelllang=en_us

"note this didn't download Spanish correctly
"fix this later
function! SwapSpellLang()
  if &spelllang == 'en_us'
    set spelllang=es
    echo "Verificando en Espa?ol Amigo"
  else
    set spelllang=en_us
    echo "Spell-Checking in Anglo-Saxonese"
  endif
endfunction

map <S-F10> :call SwapSpellLang() <CR>

":set spell
":set spellang=en_us,es_es

"]s  - next misspelling
"[s  - prev misspelling
"]S  - Only stop at bad words not regional ones
"[S  - Only stop at bad words
"zg  - add word
"zw  - mark word as wrong

"1 enter = first suggestion
"1z= correct misspelling wtih first suggestion
"


vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '\"' . arg1 . '\"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '\"' . arg2 . '\"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '\"' . arg3 . '\"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '\"' . $VIMRUNTIME . '\diff\"'
      let eq = '\"\"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '\" ', '') . '\diff\"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

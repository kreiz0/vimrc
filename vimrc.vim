if has('win32') "{{{
    " order applying code
    "set ffs=unix,dos,mac
    "set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
else
    " Vundle init 
    set rtp+=~/.vim/bundle/Vundle.vim
    "set rtp+=/home/jaime/.vim/vimrc/plugin
    "set runtimepath=$XDG_CONFIG_HOME/vim,/$XDG_CONFIG_HOME/vim/after,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/jaime/.vim/bundle/Vundle.vim,/home/jaime/.vim/vimrc/plugin
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    "==================== potential useful 
    "Plugin 'wincent/command-t'
    "Plugin 'textmanip.vim'
    "Plugin 'fontsize'    
    "Plugin 'scrooloose/syntastic'
    "Plugin 'SirVer/ultisnips'
    "Plugin 'honza/vim-snippets'
    "Plugin 'nsf/gocode', { 'rtp': 'vim', 'do': '~/BUFF/PROJECTS/golang/src/github.com/nsf/gocode/vim/symlink.sh' }    
    " ==================== text transformation 
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'matze/vim-move'
    Plugin 'SuperTab'
    " ==================== git
    Plugin 'tpope/vim-fugitive'
    " ==================== information
    Plugin 'vim-airline/vim-airline'
    Plugin 'majutsushi/tagbar'
    " ==================== dir navigation
    Plugin 'The-NERD-Commenter'
    Plugin 'The-NERD-tree'
    Plugin 'NERD_Tree-and-ack'
    Plugin 'NERD_tree-Project'
    " ==================== you complete me, omnicomplete, etc
    Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer --tern-completer --clang-completer' }
    Plugin 'rdnetto/YCM-Generator',  { 'branch': 'stable'}
    " ==================== golang
    Plugin 'fatih/vim-go'
    Plugin 'garyburd/go-explorer'
    "==================== javascript
    Plugin 'ternjs/tern_for_vim'
    Plugin 'https://github.com/heavenshell/vim-jsdoc.git'
    Plugin 'pangloss/vim-javascript'
    Plugin 'maksimr/vim-jsbeautify'
    call vundle#end()
endif           "}}}

" ==================== global settings ===================="{{{
set nocompatible                    " disable vi
syntax enable                       " autolight syntax
syntax sync minlines=256
set synmaxcol=300
filetype plugin indent on           " load modules for file of type
au BufWinLeave * silent! mkview     " make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview   " make vim load view (state) (folds, cursor, etc)
" ==================== global settings ===================="}}}

" ==================== leader ===================="{{{
let mapleader = ","
let g:mapleader = ","
" ==================== leader ===================="}}}

" ==================== GUI ===================="{{{
set selection=inclusive
set lines=34                        " count line when open
set columns=110                     " count column when open
set scrolloff=0                     " count line below when scroll
set wrap                            " newline for long string
set textwidth=0 wrapmargin=0
set number                          " show num each line
if has("gui_running")
    "set guioptions-=m              " no menu bar
    "set guioptions-=T              " no toolbar
    "set guioptions-=r              " no scrollbar
    "set guioptions-=L              " remove left-hand scrollbar
    "set guioptions+=b
    set guioptions=
    set guioptions+=r
endif
set lazyredraw          	        " wait to redraw
" ==================== GUI ===================="}}}

" ==================== tab of GUI ===================="{{{
":tab ball        - show each buffer in a tab (up to 'tabpagemax' tabs)
":tab help        - open a new help window in its own tab page
":tab drop {file} - open {file} in a new tab, or jump to a window/tab containing the file if there is one
":tab split       - copy the current window to a new tab of its own

":tabs            - list all tabs including their displayed windows
":tabm 0          - move current tab to first
":tabm            - move current tab to last
":tabm {i}        - move current tab to position i+1

":tabn            - go to next tab
":tabp            - go to previous tab
":tabfirst        - go to first tab
":tablast         - go to last tab

"gt               - go to next tab
"gT               - go to previous tab
"{i}gt            - go to tab in position i
"Ctrl-PgDn        - go to next tab
"Ctrl-PgUp        - go to previous tab

":tabdo %s/foo/bar/g

ca tn tabnew
ca th tabp
ca tl tabn
" new tab of tab menu
nnoremap <A-n> :tabnew<CR>
" ==================== tab of GUI ===================="}}}

" ==================== split windows buffers ===================="{{{
":e filename         - edit another file
":split filename     - split window and load another file

"ctrl-w up arrow     - move cursor up a window
"ctrl-w ctrl-w       - move cursor to another window (cycle)
"Сtrl-w o            - expand window
"Ctrl-w c            - close window
"Ctrl-w s            - horisontal split
"Ctrl-w v            - vertical split
"Ctrl-w ]            - split and move
"Ctrl-w f            - split and open file-path on cursor
":sb[uffer]          - split and edit buffer. Note: when you open split again, buffer will be clear
"ctrl-w_             - maximize current window
"ctrl-w=             - make all equal size
"10 ctrl-w+          - increase window size by 10 lines
"ctrl-w ctrl-p       - move cursor prev window

"Ctrl-W K            - vertical to horisontal
"Ctrl-W H            - horisontal to vertical
"Ctrl-W r            - swap

":vsplit file        - vertical split
":sview file         - same as split, but readonly
":hide               - close current window
":only               - keep only this window open
":ls                 - show current buffers
":b 2                - open buffer #2 in this window
" ==================== split windows buffers ===================="}}}

" ==================== navigation ===================="{{{
"h                   - move one character left
"j                   - move one row down
"k                   - move one row up
"l                   - move one character right
"w                   - move to beginning of next word
"b                   - move to previous beginning of word
"e                   - move to end of word
"W                   - move to beginning of next word after a whitespace
"B                   - move to beginning of previous word before a whitespace
"E                   - move to end of word before a whitespace
"0                   - move to beginning of line
"$                   - move to end of line
"_                   - move to first non-blank character of the line
"g_                  - move to last non-blank character of the line
"gg                  - move to first line
"G                   - move to last line
"nG                  - move to n'th line of file (n is a number; 12G moves to line 12)
"H                   - move to top of screen
"M                   - move to middle of screen
"L                   - move to bottom of screen
"z.                  - scroll the line with the cursor to the center of the screen
"zt                  - scroll the line with the cursor to the top
"zb                  - scroll the line with the cursor to the bottom

"Ctrl-D              - move half-page down
"Ctrl-U              - move half-page up
"Ctrl-B              - page up
"Ctrl-F              - page down

"n                   - next matching search pattern
"N                   - previous matching search pattern
"*                   - next whole word under cursor
"#                   - previous whole word under cursor
"g*                  - next matching search (not whole word) pattern under cursor
"g#                  - previous matching search (not whole word) pattern under cursor
"%                   - jump to matching bracket { } [ ] ( )

"fX                  - to next 'X' after cursor, in the same line (X is any character)
"FX                  - to previous 'X' before cursor (f and F put the cursor on X)
"tX                  - til next 'X' (similar to above, but cursor is before X)
"TX                  - til previous 'X'

";                   - repeat above, in same direction
",                   - repeat above, in reverse direction
" ==================== navigation ===================="}}}

" ==================== multi+cursor ===================="{{{
"``                 - switch between the last and current position
"''                 - switch between the last string number and current string number
"Ctrl-O             - move back to previous position cursor
"Ctrl-I             - move next to previous position cursor
"g;                 - move back previous edit locations
"g,                 - move next previous edit locations
" disable moving cursor anywhere
set ve=
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C->'
let g:multi_cursor_quit_key='<Esc>'
" ==================== multi+cursor ===================="}}}

" ==================== colorscheme&&font ===================="{{{
"colorscheme intellij
colorscheme molokai
set background=dark
set t_Co=256
set guifont=Monospace\ 15
set showmatch                       " show start/end bracket
" ==================== colorscheme&&font ===================="}}}

" ==================== folding ===================="{{{
"zc - fold block
"zo - open block
"zM - fold all block
"zR - open all block
"za - inersion
"zf - fold selected
"zi - disable folding
set foldenable                  "включить свoрачивание
"set foldmethod=syntax          "сворачивание на основе синтаксиса
"set foldmethod=indent          "сворачивание на основе отступов
set foldmethod=manual           "выделяем участок с помощью v и говорим zf
set foldmethod=marker           "сворачивание на основе маркеров в тексте
set foldmarker={{{,}}}          "задаем маркеры начала и конца блока
" ==================== folding ===================="}}}

" ==================== abbreviations ===================="{{{
" ==================== clang define a beginning/ending box
iabbrev #b /************************************************
iabbrev #e ************************************************/
iabbrev #= ====================
" ==================== abbreviations ===================="}}}

" ==================== tab of editor ===================="{{{
set tabstop=4                   " количество пробелов, которыми символ табуляции отображается в тексте. 
set shiftwidth=4                " регулирование ширины отступов в пробелах, добавляемых командами >> и <<.
set smarttab                    " добавлению отступа, ширина которого соответствует shiftwidth
set expandtab                   " в режиме вставки заменяет символ табуляции на соответствующее количество пробелов.
set et                          " включить автозамену по умолчанию
set nostartofline 	   		 	" не менять позицию курсора при прыжках по буферу
set ai                          " включить автоотступы для новых строк
set cin                         " включить отступы в стиле Си
"set listchars=tab:··           " показываем табы в начале строки точками
"set list
" ==================== tabs of editor ===================="}}}

" ==================== backspace ===================="{{{
" backspace and cursor keys wrap to previous/next line and maakes backspace key more powerful.
set backspace=indent,eol,start
" next string on edge current string
set whichwrap+=b,s,<,>,[,],l,h
" backspace in Visual mode deletes selection
vnoremap <BS>
" ==================== backspace ===================="}}}

" ==================== undo ===================="{{{
set history=1000
set undodir=~/.vim/undodir/
set undofile
set undolevels=1000
set undoreload=10000
" ==================== undo ===================="}}}

" ==================== airline&&statusline ===================="{{{
set showcmd                      " Show me what I'm typing
set noshowmode                   " Hide native mode indication
set nocursorcolumn               " Hide counter colum for other plugin
set nocursorline                 " Hide counter colum for other plugin

highlight SignColumn guibg=#272822
" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>
"always show statusbar
set laststatus=2
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" ==================== highlight&&statusline ===================="}}}

" ==================== search ===================="{{{
set hlsearch                    " Highlight found searches
set incsearch                   " Shows the match while typing
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
" ==================== search ===================="}}}

" ==================== rus keymap ===================="{{{
" support russian keymap for command mode
"set keymap=russian-dvorak
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan
" ==================== rus keymap ===================="}}}

" ==================== NERDTree ===================="{{{
let NERDTreeShowHidden=1
map <F12> :NERDTreeToggle<cr>
vmap <F12> <esc>:NERDTreeToggle<cr>i
imap <F12> <esc>:NERDTreeToggle<cr>i
" ==================== NERDTree ===================="}}}

" ==================== tagbar ===================="{{{
map <F11> :TagbarToggle<CR>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" ==================== tagbar ===================="}}}

" ==================== hide found lihgt ===================="{{{
nnoremap <C-esc> :noh<return><esc>
map <F7> :set hlsearch!<CR>
" ==================== hide found lihgt ===================="}}}

" ==================== keymap ===================="{{{
" set the 'cpoptions' to its Vim default only do this when compiled with expression evaluation
if 1    
    let s:save_cpo = &cpoptions
endif
set cpo&vim
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>      "+gP
cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+
" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG
" Use CTRL-G u to have CTRL-Z only undo the paste.
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>       <C-V>
" Use CTRL-S for saving, also in Insert mode
noremap <C-s>		:update<CR>
vnoremap <C-s>		<C-C>:update<CR>
inoremap <C-s>		<C-O>:update<CR>
" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
    set guioptions-=a
endif
" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>
" Alt-Space is System menu
if has("gui")
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <C-O>:simalt ~<CR>
    cnoremap <M-Space> <C-C>:simalt ~<CR>
endif
" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w
" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c
" restore 'cpoptions'
set cpo&
if 1
    let &cpoptions = s:save_cpo
    unlet s:save_cpo
endif
" ==================== keymaps ===================="}}}

" ==================== NERDComment ===================="{{{
nmap <C-\> :call NERDComment(0, "toggle")<cr>
vmap <C-\> :call NERDComment(0, "toggle")<cr>
imap <C-\> :call NERDComment(0, "toggle")<cr>
" ==================== NERDComment ===================="}}}

" ==================== CommandT ===================="{{{
let g:CommandTMaxHeight = 20
let g:CommandTMaxFiles = 500000
let g:CommandTMatchWindowReverse = 1
let g:CommandTMaxCachedDirectories = 0
let g:CommandTHighlightColor = 'Typedef'
nmap <C-t> :CommandT /Users/fatih/Code/koding<cr>
imap <C-t> <esc>:CommandT /Users/fatih/Code/koding<cr>
" ==================== CommandT ===================="}}}

" ==================== fugitive git ===================="{{{
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
"vnoremap <leader>gb :Gblame<CR>
" ==================== fugitive git ===================="}}}

" ==================== wildmenu ===================="{{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
" ==================== wildmenu ===================="}}}

" ==================== Complete ===================="{{{
"set completeopt=menu,menuone,longest,preview

set completeopt=menuone,preview,longest
".: The current buffer
"w: Buffers in other windows
"b: Other loaded buffers
"u: Unloaded buffers
"t: Tags
"i: Included files
set complete=.,w,b,u,t,i
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <@> <C-x><C-o>
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \	if &omnifunc == "" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
endif

"set pumheight=15
"highlight Pmenu ctermfg=255
"set updatetime=500
" ==================== Complete ===================="}}}

" ==================== YouCompleteMe ===================="{{{
"let g:ycm_semantic_triggers =  {
"\   'c' : ['->', '.'],
"\   'objc' : ['->', '.'],
"\   'ocaml' : ['.', '#'],
"\   'cpp,objcpp' : ['->', '.', '::'],
"\   'perl' : ['->'],
"\   'php' : ['->', '::'],
"\   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
"\   'ruby' : ['.', '::'],
"\   'lua' : ['.', ':'],
"\   'erlang' : [':'],
"\ }

"map <Leader>y :YcmForceCompileAndDiagnostics<CR>

let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_auto_trigger = 1
autocmd FileType javascript,go,c,cpp set omnifunc=syntaxcomplete#Complete

map <C-]> :YcmCompleter GoToImprecise<CR>
" ==================== YouCompleteMe ===================="}}}

" ==================== Syntastic ===================="{{{
" Syntastic
"let g:syntastic_check_on_open=1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_javascript_checkers = ['jshint']
" ==================== Syntastic ===================="}}}

" ==================== snips ===================="{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-t>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
" ==================== snips ===================="}}}

" ==================== c++ ===================="{{{
"let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_global_conf.py"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'
let c_no_curly_error=1

"au BufNewFile,BufRead,BufEnter *.cpp,*.h,*.hpp set omnifunc=cpp#complete#Complete filetype=cpp
" ==================== c++ ===================="}}}

" ==================== go ===================="{{{
"let g:go_fmt_options = "-tabstop=4 -shiftwidth=4 -smarttab -expandtab -tabs=false -tabwidth=4"
"let g:go_goimports_bin = "goimports -tabs=false -tabwidth=4 -tabstop=4 -shiftwidth=4 -smarttab -expandtab"
"let g:go_fmt_autosave = 0
let g:go_autodetect_gopath = 1

"let g:go_fmt_command = "goimports"
"let g:go_fmt_options = "-smarttab"
let g:go_fmt_fail_silently = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)

au FileType go nmap <F5>  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>g  <Plug>(go-gbbuild)
au FileType go nmap <leader>t  <Plug>(go-test-compile)
au FileType go nmap <F2> <Plug>(go-doc)
au FileType go nmap <Leader>f :GoImports<CR>

au BufNewFile,BufRead *.go set omnifunc=gocomplete#Complete filetype=go noet ts=4 sw=4 sts=4
" ==================== go ===================="}}}

" ==================== javascript ===================="{{{
" ==================== vim-javascript

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

let g:javascript_enable_domhtmlcss  = 1
let g:javascript_plugin_jsdoc       = 1
let g:javascript_plugin_ngdoc       = 1
let g:javascript_plugin_flow        = 1
" ==================== tern
autocmd FileType javascript,jsx noremap <buffer> <F2> :TernDoc<cr>
autocmd FileType javascript,jsx noremap <buffer> <F3> <Plug>(jsdoc)
autocmd FileType javascript,jsx,json,html,css noremap <buffer> <F4> :TernDef<cr>
" ==================== JsBeautify
autocmd FileType javascript noremap <buffer> <F5> :call Run()<cr>
autocmd FileType javascript noremap <buffer> <leader>j :call JsBeautify()<cr>
autocmd FileType json       noremap <buffer> <leader>j :call JsonBeautify()<cr>
autocmd FileType jsx        noremap <buffer> <leader>j :call JsxBeautify()<cr>
autocmd FileType html       noremap <buffer> <leader>j :call HtmlBeautify()<cr>
autocmd FileType css        noremap <buffer> <leader>j :call CSSBeautify()<cr>
" ==================== tabs
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

function! Run()
    exec "! babel-node %"
endfunction
" ==================== javascript ===================="}}}

" ==================== backup ===================="{{{
set nobackup         " не делать бэкапы
set nowritebackup    " не делать бекапы во время набора текста
set noswapfile       " не делать свопыы
""" Сохранять умные резервные копии ежедневно
function! BackupDir()
   " определим каталог для сохранения резервной копии
   if has('win32')
        let l:backupdir = $TEMP.'\backup'
    else
        let l:backupdir = $VIMRUNTIME.'/backup/'.
        \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
    endif
   " если каталог не существует, создадим его рекурсивно
   if !isdirectory(l:backupdir)
      call mkdir(l:backupdir, 'p', 0700)
   endif
   " переопределим каталог для резервных копий
   let &backupdir=l:backupdir
   " переопределим расширение файла резервной копии
   let &backupext=strftime('~%Y-%m-%d~')
endfunction
" ==================== backup ===================="}}}

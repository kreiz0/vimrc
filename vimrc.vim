" ==================== Vundle init ===================="{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" ==================== potential useful 
"Plugin 'wincent/command-t'
"Plugin 'textmanip.vim'
"Plugin 'fontsize'    
"Plugin 'scrooloose/syntastic'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'matze/vim-move'
"Plugin 'tpope/vim-fugitive'
"Plugin 'nsf/gocode', { 'rtp': 'vim', 'do': '~/BUFF/PROJECTS/golang/src/github.com/nsf/gocode/vim/symlink.sh' }    
" ==================== text transformation 
Plugin 'terryma/vim-multiple-cursors'
Plugin 'The-NERD-Commenter'
Plugin 'tpope/vim-surround'
" ==================== information
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
" ==================== dir navigation
Plugin 'The-NERD-tree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
" ==================== you complete me, omnicomplete, etc
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer --clang-completer' }
Plugin 'rdnetto/YCM-Generator',  { 'branch': 'stable'}
Plugin 'SuperTab'
" ==================== golang
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
"==================== javascript
Plugin 'ternjs/tern_for_vim'
Plugin 'https://github.com/heavenshell/vim-jsdoc.git'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
call vundle#end()
"==================== vundle ==================== }}}

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
" nnoremap <A-n> :tabnew<CR>
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

" shift+{            - to start paragraph
" shift+}            - to end paragraph
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

" ==================== move lines ===================="{{{
" # press z+i(disable folding), if you want move a line through folding
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" ==================== newline without imode
nmap oo o<Esc>
nmap OO O<Esc>
" ==================== move lines ===================="}}}

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
set foldenable                  " enable folding for structure file
"set foldmethod=syntax          " syntax folding
"set foldmethod=indent          " indent folding
set foldmethod=manual           " enable zf for folding a selected block
set foldmethod=marker           " enable folding for mark
set foldmarker={{{,}}}          " mark folding
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
" vnoremap <BS>
" ==================== backspace ===================="}}}

" ==================== undo ===================="{{{
set history=10000
set undodir=~/.vim/undodir/
set undofile
set undolevels=10000
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
" nnoremap <C-[> :noh<return><esc>
" map <F7> :set hlsearch!<CR>
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

" ==================== NERDTree ===================="{{{
let NERDTreeShowHidden=1
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
" ==================== NERDTree ===================="}}}

" ==================== tagbar ===================="{{{
" map <F8> :TagbarToggle<CR>

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

" ==================== keymap ===================="{{{
" CTRL-A is Select all
noremap <C-A>  ggVG
" Use CTRL-S for saving, also in Insert mode
" noremap <C-s>   :update<CR>
" Use CTRL-C for copy to yank to your system's clipboard
" noremap <C-c> "+y
" copy-paste with system clipboard
set clipboard=unnamedplus

" Allow to copy/paste between VIM instances

" copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" ==================== keymaps ===================="}}}

" ==================== NERDComment ===================="{{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" ==================== NERDComment ===================="}}}

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
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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

let g:python_host_prog = '/usr/bin/python'

let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_auto_trigger = 1
autocmd FileType javascript,go,c,cpp set omnifunc=syntaxcomplete#Complete

map <C-]> :YcmCompleter GoToImprecise<CR>
" ==================== YouCompleteMe ===================="}}}

" ==================== c ===================="{{{
"let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_global_conf.py"
" === enable doxygen highlighting
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" === gf command (<C-W><C-F>), to open file in new tab
let &path.="src/include,/usr/include/AL,"

let c_no_curly_error=1
"au BufNewFile,BufRead,BufEnter *.cpp,*.h,*.hpp set omnifunc=cpp#complete#Complete filetype=cpp
" ==================== c ===================="}}}

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

" ==================== backup ====================" {{{
set nobackup
set nowritebackup
set noswapfile
" ==================== backup ====================" }}}


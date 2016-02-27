set nocompatible                                " отключить совместимость с vi
set number                                      " показывать номера строк

let &lines = 34                                 " количество линий при открытии окна
let &columns = 110                              " количество колонок при открытии окна    

" подключение плагинов, только для ubuntu
if has('win32')
    " порядок применения кодировок и формата файлов
    "set ffs=unix,dos,mac
    "set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
else
        filetype off                            " для установки плагинов
        " Vundle инициализация
        set rtp+=~/.vim/bundle/Vundle.vim
        "set rtp+=/home/jaime/.vim/vimrc/plugin
        "set runtimepath=$XDG_CONFIG_HOME/vim,/$XDG_CONFIG_HOME/vim/after,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/jaime/.vim/bundle/Vundle.vim,/home/jaime/.vim/vimrc/plugin
        call vundle#begin()
        Plugin 'gmarik/Vundle.vim'
        Plugin 'matze/vim-move'
        Plugin 'The-NERD-Commenter'
        Plugin 'YouCompleteMe'
        Plugin 'The-NERD-tree'
        Plugin 'nerdtree-ack'
        Plugin 'NERD_Tree-and-ack'
        Plugin 'FindInNERDTree'
        Plugin 'NERD_tree-Project'
        
        " инициализация плагинов
        "Plugin 'mimicpak.vim'
        "Plugin 'color_sample_pack.vim'
        call vundle#end()

        "colorscheme desert " цветовая схема
        colorscheme molokai
endif
        filetype plugin indent on               " поддержка отступов
syntax on                                       " автоподсветка синтаксиса
set lz                                          " ленивая перерисовка экрана

" бэкапы
set nobackup 	     " не делать бэкапы
set nowritebackup    " не делать бекапы во время набора текста
set noswapfile 	     " не делать свопыы

" навигация
set smarttab
set et                          " включить автозамену по умолчанию
set nostartofline 	   		 	" не менять позицию курсора при прыжках по буферу
let &scrolloff = 1	        	" сколько строк внизу и вверху экрана показывать при скроллинге


" Показываем табы в начале строки точками
"set listchars=tab:··
"set list

set wrap                        " переносить длинные строки
set ai                          " включить автоотступы для новых строк
set cin                         " включить отступы в стиле Си

" GUI настройки видимости меню и элементов
if has("gui_running")
    "set guioptions-=m  " убрать боковое меню
    set guioptions-=T  " убрать панель инструментов
    "set guioptions-=r  " убрать вертикальный скролл
    "set guioptions-=L  " убрать горизонтальный скролл
endif
" подсветка результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

" исправление клавиши удаления и дел
let &backspace=2
let &tabstop=4		    " количество символов при табах
let &shiftwidth=4		"


" поддержка командного режима при русской раскладке
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


" ремаринг основных сочетаний клавишь
"
"  1{{{
" ~~~~~~~~~~~~~~~~

" убрать подсветку
nnoremap <esc> :noh<return><esc>
map <F7> :set hlsearch!<CR>

" назначить ctrl / для комментирования
"nmap <C-/> :<CR>
" C-/ - комментировать/раскомментировать (при помощи NERD_Comment)
"let mapleader=","
"map  <C-1> ,cc
"nmap <C-_> ,ci
"imap <C-_> <ESC>,cii
 nmap <C-1> \c 
 vmap <C-1> \c 
" F12 - обозреватель файлов (:Ex для стандартного обозревателя,
" плагин NERDTree - дерево каталогов)
map <F12> :NERDTreeToggle<cr>
vmap <F12> <esc>:NERDTreeToggle<cr>i
imap <F12> <esc>:NERDTreeToggle<cr>i

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
" бэкап
" " бэкапыы>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

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

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

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
"~~~~~~~~~~~~~~~~~~~~
"}}}1
"
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
" помнить историю буфера даже после закрытия файлов
if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif 

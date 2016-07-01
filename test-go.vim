    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'    
    Plugin 'ruscmd'
    Plugin 'https://github.com/terryma/vim-multiple-cursors'
    Plugin 'tpope/vim-fugitive'
    Plugin 'wincent/command-t'
    Plugin 'vim-airline/vim-airline'
    Plugin 'matze/vim-move'

    Plugin 'The-NERD-Commenter'
    Plugin 'The-NERD-tree'
    Plugin 'nerdtree-ack'
    Plugin 'NERD_Tree-and-ack'
    Plugin 'FindInNERDTree'
    Plugin 'NERD_tree-Project'
    " syntax plugins 
    Plugin 'fatih/vim-go'
    Plugin 'garyburd/go-explorer'
    Plugin 'majutsushi/tagbar'
    Plugin 'Valloric/YouCompleteMe'
    call vundle#end()


" ==================== colorscheme&&font ===================="{{{
"colorscheme intellij
colorscheme molokai
"set background=black
set t_Co=256
set guifont=Monospace\ 15
set showmatch                   " show start/end bracket
" ==================== colorscheme&&font ===================="}}}

" ==================== go ===================="{{{
"let g:go_fmt_options = "-tabstop=4 -shiftwidth=4 -smarttab -expandtab"
"let g:go_fmt_options = "-smarttab"
"let g:go_goimports_bin = "goimports -tabs=false -tabwidth=4"
"let g:go_goimports_bin = "goimports -tabstop=4 -shiftwidth=4 -smarttab -expandtab"
"let g:go_fmt_autosave = 0
"let g:go_fmt_command = "goimports"
"let g:go_fmt_options = "-tabs=false -tabwidth=4"

"let g:go_fmt_options = "-shiftwidth=4"

set omnifunc=syntaxcomplete#Complete

let g:go_fmt_command = "goimports"


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 0

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

let g:go_autodetect_gopath = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>g  <Plug>(go-gbbuild)
au FileType go nmap <leader>t  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>f :GoImports<CR>

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" ==================== go ===================="}}}

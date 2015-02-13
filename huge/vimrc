set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" custom plugins
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'shougo/neocomplete'
Plugin 'scrooloose/nerdtree'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:neocomplete#enable_at_startup = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
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


" customizations
syntax on
set ts=4
set sw=4
set number
set cursorline
set scrolloff=999

" plugins customizations
" open nerdtree
nmap <F7> :NERDTreeToggle<CR>
" open the tagbar
nmap <F8> :TagbarToggle<CR>
" get rid of nerd tree strange characters
let g:NERDTreeDirArrows=0
" show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" jun Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
" open the definition/declaration in a new vertical, horizontal or tab for the
" word under your cursor
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
" disable open browser after posting snippet
let g:go_play_open_browser = 0
" enable goimports
let g:go_fmt_command = "goimports"
" enable additional highlighting 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

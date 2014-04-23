" kill popup dialogs
set go+=c

set ts=2
set sw=2

set expandtab
set lbr
"set foldmethod=marker
"set foldenable

" Security hole?!
set modeline
set noeb
set nu
set ruler
set hidden

" Remove menu bar
set guioptions-=m

" Remove toolbar
set guioptions-=T

filetype plugin on
filetype indent on

"set cursorline
"set cursorcolumn

"set autoindent
"set smartindent

" setxkbmap neo_de
"noremap n h
"noremap r j
"noremap t k
"noremap d l

" Funktioniert noch nicht überall
"set nolisp

let g:complType = "Foo"

" Disable auto-commenting, but FIXME: not complete, see comments
set comments=

" Set TeX flavor to LaTeX
let g:tex_flavor = "latex"

let g:ada_default_compiler = "gnat"

" Enable GNU C/C++ code
let c_gnu = 1

let g:is_gst = 1

"let loaded_gnupg = 1

runtime ftplugin/man.vim

"if exists("b:current_syntax")
"	unlet b:current_syntax
"endif
"runtime syntax/scheme.vim

"set completeopt
"hi Pmenu       guifg=bisque2 guibg=grey20

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Syntax tex syn match texString "\(\"'\|\"`\)"
  au Syntax asm set ts=8
  au Syntax fortran set ts=8
  au Syntax haskell set expandtab
  au Syntax haskell set foldmethod=indent
  au Syntax scheme set expandtab
  au Syntax lisp set expandtab
  "au Syntax lisp set nolisp
endif

"let potwiki_home="$HOME/doc/own/melech/wiki/"
"au BufNewFile,BufRead $HOME/doc/own/Melech/wiki/* set ft=potwiki

":map <M-1> :confirm :b1 <CR>
"        2             2
"... or <C-1>
":map <F3> :confirm :ls <CR>

":nmap <M-Left> :bprev <CR>
":nmap <M-Right> :bnext <CR>

let g:haddock_browser="/usr/bin/links"
let g:haddock_browser_callformat="%s file://%s >/dev/null 2>&1 &"
let g:haddock_docdir="/usr/share/doc/ghc-6.10.1/"
let g:haddock_indexfiledir="/home/rudolf/.vim/"

set t_Co=256
colorscheme inkpot
syntax on

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

let g:skk_large_jisyo = "/usr/share/skk/SKK-JISYO"
let g:skk_show_annotation = 1
let g:skk_egg_like_newline = 1

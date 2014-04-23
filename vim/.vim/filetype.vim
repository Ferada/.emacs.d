augroup filetypedetect
  au BufNewFile,BufRead SConstruct setf python
  au BufNewFile,BufRead SConscript setf python
  au BufNewFile,BufRead *.wiki setf wikipedia
  au BufNewFile,BufRead *.red setf redcode
  "au BufNewFile,BufRead *.nw setf rnoweb
augroup END

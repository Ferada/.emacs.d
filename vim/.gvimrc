"let date=strftime ("1%H")-100
"if date >= 6 && date < 19
	" light variants
"	colorscheme automation
	"colorscheme python
	"colorscheme scite
	"colorscheme taqua
	"colorscheme tcsoft
	"colorscheme mellow
	"colorscheme greyblue
"elseif date >= 19 && date < 21
	" middle variants
	"colorscheme camo
	colorscheme orange
	"colorscheme inkpot
	"colorscheme desert
"else
	" dark variants
	"colorscheme less
	"colorscheme fnaqevan
	"colorscheme orange
	"colorscheme Dim
	colorscheme greyblue
	"colorscheme Dim2
	"colorscheme redblack
"endif
"unlet date

" enable Supertab
"unlet g:complType
"runtime! plugin/supertab.vim

set guifont=Bitstream\ Vera\ Sans\ Mono\ 7.5

runtime plugin/mark.vim

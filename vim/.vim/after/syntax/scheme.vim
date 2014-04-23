syn match schemeOther "\D\&\S\&[^\"\'\`@\(\[\)\]]\(\D\&\S\&[^\"\(\)\[\]]\)*" oneline
syn region schemeMultilineComment start="#|" end="|#"
syn match schemeComment /;.*$/
syn match schemeComment "\%^#!.*$"

syn keyword schemeSyntax λ #t #f

syn keyword schemeSyntax define-interface define-object
syn keyword schemeSyntax define-structure define-structures

syn keyword schemeFunc load-dynamic-externals

hi def link schemeMultilineComment SpecialComment

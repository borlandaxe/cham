syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction  ctermfg=93

syn match       cMathOperator     display "[-+/*/%=]"
syn match       cPointerOperator  display "->\|\."
syn match       cLogicalOperator  display "[!<>]=\="

"the following two items are practically the same.
syn match       cBinaryOperator   display "\([|&~\^]\{1\}\)=\="
"syn match       cBinaryOperator   display "\(|\|&\|\~\|\^\)=\="

syn match       cBinaryOperator   display "<<\|>>"
syn match       cLogicalOperator  display "||\|&&\|=="
syn match       cBinaryOperatorError display "\~="
syn match       cLogicalOperatorError display "\(&&\|||\)="

hi cMathOperator             	ctermfg=196
hi cPointerOperator          	ctermfg=26
hi cLogicalOperator          	ctermfg=3
hi cLogicalOperatorError        ctermfg=3 cterm=italic
hi cBinaryOperator          	ctermfg=26
hi cBinaryOperatorError         ctermfg=26 cterm=italic
hi cComment 		            ctermfg=4
hi cCommentError 		        ctermfg=4 cterm=italic


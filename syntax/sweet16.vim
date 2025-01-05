runtime! syntax/ca65.vim
unlet b:current_syntax

syn case ignore
syn clear ca65Ins ca65InsBranch

syn keyword ca65Ins
\ ADD CPR DCR INR LD LDD POP POPD SET ST STD STP SUB nextgroup=ca65Address

syn keyword ca65InsBranch
\ BC BK BM BM1 BNC BNM1 BNZ BP BR BS BZ RS RTN nextgroup=ca65BranchTarget

syn case match

let b:current_syntax = "sweet16"

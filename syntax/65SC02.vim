runtime! syntax/ca65.vim
unlet b:current_syntax

syn case ignore

" absolute indexed indirect (for 65C02+ only)
syn match ca65Address "($\x\{4},[XY])" contains=ca65Registers,ca65WrongRegY

" ref: https://github.com/cc65/cc65/blob/V2.19/src/ca65/instr.c
syn keyword ca65Ins DEA INA PHX PHY PLX PLY STZ TRB TSB nextgroup=ca65Address
syn keyword ca65InsBranch BRA nextgroup=ca65BranchTarget

syn case match

let b:current_syntax = "65SC02"

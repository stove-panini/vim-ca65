runtime! syntax/ca65.vim
unlet b:current_syntax

syn case ignore

" ref: https://github.com/cc65/cc65/blob/V2.19/src/ca65/instr.c
syn keyword ca65Ins
\ ALR ANC ARR AXS DCP ISC LAS LAX RLA RRA SAX SLO SRE nextgroup=ca65Address

syn case match

let b:current_syntax = "6502X"

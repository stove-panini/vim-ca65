runtime! syntax/ca65.vim
unlet b:current_syntax

syn case ignore

" absolute indexed indirect (for 65C02+ only)
syn match ca65Address "($\x\{4},[XY])" contains=ca65Registers,ca65WrongRegY

" ref: https://github.com/cc65/cc65/blob/V2.19/src/ca65/instr.c
syn keyword ca65Ins
\ DEA INA PHX PHY PLX PLY STZ TRB TSB
\ BBR BBR0 BBR1 BBR2 BBR3 BBR4 BBR5 BBR6 BBR7
\ BBS BBS0 BBS1 BBS2 BBS3 BBS4 BBS5 BBS6 BBS7
\ RMB RMB0 RMB1 RMB2 RMB3 RMB4 RMB5 RMB6 RMB7
\ SMB SMB0 SMB1 SMB2 SMB3 SMB4 SMB5 SMB6 SMB7
\ BRL COP CPA MVN MVP PEA PEI PER PHB PHD PHK PLB PLD REP SEP STP SWA TAD TAS
\ TCD TCS TDA TDC TSA TSC TXY TYX WAI WDM XBA XCE nextgroup=ca65Address

syn keyword ca65InsBranch BRA JML JSL RTL nextgroup=ca65BranchTarget

syn case match

let b:current_syntax = "65816"

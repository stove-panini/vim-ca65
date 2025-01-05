runtime! syntax/ca65.vim
unlet b:current_syntax

syn case ignore

" absolute indexed indirect (for 65C02+ only)
syn match ca65Address "($\x\{4},[XY])" contains=ca65Registers,ca65WrongRegY

syn keyword ca65Ins
\ DEA INA PHX PHY PLX PLY STZ TRB TSB
\ BBR BBR0 BBR1 BBR2 BBR3 BBR4 BBR5 BBR6 BBR7
\ BBS BBS0 BBS1 BBS2 BBS3 BBS4 BBS5 BBS6 BBS7
\ RMB RMB0 RMB1 RMB2 RMB3 RMB4 RMB5 RMB6 RMB7
\ SMB SMB0 SMB1 SMB2 SMB3 SMB4 SMB5 SMB6 SMB7
\ CLA CLX CLY CSH CSL SAX SAY SET ST0 ST1 ST2 SXY TAI TAM TAM0 TAM1 TAM2 TAM3
\ TAM4 TAM5 TAM6 TAM7 TDD TIA TII TIN TMA TMA0 TMA1 TMA2 TMA3 TMA4 TMA5 TMA6
\ TMA7 TST nextgroup=ca65Address

syn keyword ca65InsBranch BRA BSR nextgroup=ca65BranchTarget

syn case match

let b:current_syntax = "HuC6280"

" Vim syntax file
" Language:    ca65 macro assembler
" Maintainer:  Stephen Panicho <stephen@undo.land>
" Last Change: 2025 Jan 5

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn clear
syn case ignore

" Base 6502 instruction set
syn keyword ca65Ins
\ ADC AND ASL BIT BRK CLC CLD CLI CLV CMP CPX CPY DEC DEX DEY EOR INC INX
\ INY LDA LDX LDY LSR NOP ORA PHA PHP PLA PLP ROL ROR SBC SEC SED SEI STA
\ STX STY TAX TAY TSX TXA TXS TYA nextgroup=ca65Address

syn keyword ca65InsBranch
\ BCC BCS BEQ BMI BNE BPL BVC BVS JMP JSR RTI RTS nextgroup=ca65BranchTarget

syn match ca65BranchTarget "\s*[a-z@]\w*" contained

" Addressing Modes
" TODO: the 4510 has a Z register
syn keyword ca65Registers A X Y contained
syn keyword ca65WrongRegX X     contained
syn keyword ca65WrongRegY Y     contained

syn match ca65Address "\s*$\x\{2}"        contained
syn match ca65Address "\s*$\x\{4}"        contained
syn match ca65Address "\s*$\x\{2},[XY]"   contained contains=ca65Registers
syn match ca65Address "\s*$\x\{4},[XY]"   contained contains=ca65Registers
syn match ca65Address "\s*($\x\{4})"      contained
syn match ca65Address "\s*($\x\{2},[XY])" contained contains=ca65Registers,ca65WrongRegY
syn match ca65Address "\s*($\x\{2}),[XY]" contained contains=ca65Registers,ca65WrongRegX

" Numbers
syn match ca65Number "#\?\d\+\>"
syn match ca65Number "#\?$\x\+\>"
syn match ca65Number "#\?\x\+h\>"
syn match ca65Number "#\?%[01]\+\>"
syn match ca65Number "#[<>]"he=e-1

" ref: https://cc65.github.io/doc/ca65.html
" Operators
syn match ca65Operator "\(+\|-\|\~\|<\|>\|\^\|\*\|&\||\|=\|!\)"
syn match ca65Operator "\.AND\>"
syn match ca65Operator "\.BANKBYTE\>"
syn match ca65Operator "\.BITAND\>"
syn match ca65Operator "\.BITNOT\>"
syn match ca65Operator "\.BITOR\>"
syn match ca65Operator "\.BITXOR\>"
syn match ca65Operator "\.HIBYTE\>"
syn match ca65Operator "\.LOBYTE\>"
syn match ca65Operator "\.MOD\>"
syn match ca65Operator "\.NOT\>"
syn match ca65Operator "\.OR"
syn match ca65Operator "\.SHL\>"
syn match ca65Operator "\.SHR\>"
syn match ca65Operator "\.XOR\>"

" Labels & Symbols
syn match ca65Label  "[a-z@]\w*:"he=e-1
syn match ca65Symbol "[a-z]\w*\s*="he=e-1

" Address sizes
syn keyword ca65AddressSizeKeyword
\ DIRECT ZEROPAGE ZP ABSOLUTE ABS NEAR FAR LONG DWORD contained
syn match   ca65AddressSizePrefix "\s[zaf]:"he=e-1

" Pseudo Variables
syn match ca65PseudoVar "\.ASIZE\>"
syn match ca65PseudoVar "\.CPU\>"
syn match ca65PseudoVar "\.ISIZE\>"
syn match ca65PseudoVar "\.PARAMCOUNT\>"
syn match ca65PseudoVar "\.TIME\>"
syn match ca65PseudoVar "\.VERSION\>"

" Pseudo Functions
syn match ca65PseudoFunc "\.ADDRSIZE\>"
syn match ca65PseudoFunc "\.BANK\>"
syn match ca65PseudoFunc "\.BANKBYTE\>"
syn match ca65PseudoFunc "\.BLANK\>"
syn match ca65PseudoFunc "\.CONCAT\>"
syn match ca65PseudoFunc "\.CONST\>"
syn match ca65PseudoFunc "\.DEF\(INED\)\?\>"
syn match ca65PseudoFunc "\.DEFINEDMACRO\>"
syn match ca65PseudoFunc "\.HIBYTE\>"
syn match ca65PseudoFunc "\.HIWORD\>"
syn match ca65PseudoFunc "\.IDENT\>"
syn match ca65PseudoFunc "\.ISMNEM\(ONIC\)\?\>"
syn match ca65PseudoFunc "\.LEFT\>"
syn match ca65PseudoFunc "\.LOBYTE\>"
syn match ca65PseudoFunc "\.LOWORD\>"
syn match ca65PseudoFunc "\.MATCH\>"
syn match ca65PseudoFunc "\.MAX\>"
syn match ca65PseudoFunc "\.MID\>"
syn match ca65PseudoFunc "\.MIN\>"
syn match ca65PseudoFunc "\.REF\(ERENCED\)\?\>"
syn match ca65PseudoFunc "\.RIGHT\>"
syn match ca65PseudoFunc "\.SIZEOF\>"
syn match ca65PseudoFunc "\.SPRINTF\>"
syn match ca65PseudoFunc "\.STRAT\>"
syn match ca65PseudoFunc "\.STRING\>"
syn match ca65PseudoFunc "\.STRLEN\>"
syn match ca65PseudoFunc "\.TCOUNT\>"
syn match ca65PseudoFunc "\.XMATCH\>"
syn match ca65PseudoFunc "\.XMATCH\>"

" Control Commands, split into categories
" Data Definitions
syn match ca65DataDef "\.ADDR\>"
syn match ca65DataDef "\.ASCIIZ\>"
syn match ca65DataDef "\.BANKBYTES\>"
syn match ca65DataDef "\.BYTE\?\>"
syn match ca65DataDef "\.DBYT\>"
syn match ca65DataDef "\.DWORD\>"
syn match ca65DataDef "\.FARADDR\>"
syn match ca65DataDef "\.HIBYTES\>"
syn match ca65DataDef "\.LITERAL\>"
syn match ca65DataDef "\.LOBYTES\>"
syn match ca65DataDef "\.RES\>"
syn match ca65DataDef "\.WORD\>"
" Variable & Constant Definitions
syn match ca65Define "\.SET\>"
syn match ca65Define "\.DEFINE\>"
syn match ca65Define "\.UNDEF\(INE\)\?\>"
syn match ca65Define "\.LOCAL\>"
" Segments
syn match ca65Segment "\.BSS\>"
syn match ca65Segment "\.CODE\>"
syn match ca65Segment "\.DATA\>"
syn match ca65Segment "\.ORG\>"
syn match ca65Segment "\.RODATA\>"
syn match ca65Segment "\.SEGMENT\>"
syn match ca65Segment "\.ZEROPAGE\>"
" Conditionals
syn match ca65Cond "\.ELSE\>"
syn match ca65Cond "\.ELSEIF\>"
syn match ca65Cond "\.ENDIF\>"
syn match ca65Cond "\.ENDREP\(EAT\)\?\>"
syn match ca65Cond "\.IF\>"
syn match ca65Cond "\.IFBLANK\>"
syn match ca65Cond "\.IFCONST\>"
syn match ca65Cond "\.IFDEF\>"
syn match ca65Cond "\.IFNBLANK\>"
syn match ca65Cond "\.IFNDEF\>"
syn match ca65Cond "\.IFNREF\>"
syn match ca65Cond "\.IFP02\>"
syn match ca65Cond "\.IFP4510\>"
syn match ca65Cond "\.IFP816\>"
syn match ca65Cond "\.IFPC02\>"
syn match ca65Cond "\.IFPDTV\>"
syn match ca65Cond "\.IFPSC02\>"
syn match ca65Cond "\.IFREF\>"
syn match ca65Cond "\.REPEAT\>"
" Exceptions & Debugging
syn match ca65Except "\.ASSERT\>"
syn match ca65Except "\.END\>"
syn match ca65Except "\.ERROR\>"
syn match ca65Except "\.FATAL\>"
syn match ca65Except "\.OUT\>"
syn match ca65Except "\.WARNING\>"
" Structures
syn match ca65Struct "\.ENDENUM\>"
syn match ca65Struct "\.ENDPROC\>"
syn match ca65Struct "\.ENDSCOPE\>"
syn match ca65Struct "\.ENDSTRUCT\>"
syn match ca65Struct "\.ENDUNION\>"
syn match ca65Struct "\.ENUM\>"
syn match ca65Struct "\.PROC\>"
syn match ca65Struct "\.SCOPE\>"
syn match ca65Struct "\.STRUCT\>"
syn match ca65Struct "\.TAG\>"
syn match ca65Struct "\.UNION\>"
" Macro
syn match ca65Macro "\.DELMAC\(RO\)\?\>"
syn match ca65Macro "\.ENDMAC\(RO\)\?\>"
syn match ca65Macro "\.EXITMAC\(RO\)\?\>"
syn match ca65Macro "\.MACPACK\>"
syn match ca65Macro "\.MAC\(RO\)\?\>"
" Include
syn match ca65Include "\.INCBIN\>"
syn match ca65Include "\.INCLUDE\>"
" C Stuff
syn match ca65Module "\.CONDES\>"
syn match ca65Module "\.CONSTRUCTOR\>"
syn match ca65Module "\.DESTRUCTOR\>"
syn match ca65Module "\.EXPORT\>"
syn match ca65Module "\.EXPORTZP\>"
syn match ca65Module "\.F\(ILE\)\?OPT\>"
syn match ca65Module "\.FORCEIMPORT\>"
syn match ca65Module "\.GLOBAL\>"
syn match ca65Module "\.GLOBALZP\>"
syn match ca65Module "\.IMPORT\>"
syn match ca65Module "\.IMPORTZP\>"
syn match ca65Module "\.INTERRUPTOR\>"
" Assembler Commands
syn match ca65CtrlCmd "\.A16\>"
syn match ca65CtrlCmd "\.A8\>"
syn match ca65CtrlCmd "\.ALIGN\>"
syn match ca65CtrlCmd "\.AUTOIMPORT\>"
syn match ca65CtrlCmd "\.CASE\>"
syn match ca65CtrlCmd "\.CHARMAP\>"
syn match ca65CtrlCmd "\.DEBUGINFO\>"
syn match ca65CtrlCmd "\.FEATURE\>"
syn match ca65CtrlCmd "\.I16\>"
syn match ca65CtrlCmd "\.I8\>"
syn match ca65CtrlCmd "\.LIST\>"
syn match ca65CtrlCmd "\.LISTBYTES\>"
syn match ca65CtrlCmd "\.LOCALCHAR\>"
syn match ca65CtrlCmd "\.P02\>"
syn match ca65CtrlCmd "\.P4510\>"
syn match ca65CtrlCmd "\.P816\>"
syn match ca65CtrlCmd "\.PAGELEN\(GTH\)\?\>"
syn match ca65CtrlCmd "\.PC02\>"
syn match ca65CtrlCmd "\.PDTV\>"
syn match ca65CtrlCmd "\.POPCHARMAP\>"
syn match ca65CtrlCmd "\.POPCPU\>"
syn match ca65CtrlCmd "\.POPSEG\>"
syn match ca65CtrlCmd "\.PSC02\>"
syn match ca65CtrlCmd "\.PUSHCHARMAP\>"
syn match ca65CtrlCmd "\.PUSHCPU\>"
syn match ca65CtrlCmd "\.PUSHSEG\>"
syn match ca65CtrlCmd "\.REF\(ER\)\?TO\>"
syn match ca65CtrlCmd "\.RELOC\>"
syn match ca65CtrlCmd "\.SETCPU\>"
syn match ca65CtrlCmd "\.SMART\>"

" Strings
syn region ca65String start='"' end='"' contains=ca65AddressSizeKeyword

" Comments
syn keyword ca65Todo    TODO NOTE XXX FIXME BUG contained
syn match   ca65Comment ";.*" contains=ca65Todo

" Highlight groups
hi def link ca65Ins          Keyword
hi def link ca65InsBranch    Special
hi def link ca65BranchTarget Typedef

hi def link ca65Registers Identifier
hi def link ca65Address   Type
hi def link ca65WrongRegX Error
hi def link ca65WrongRegY Error

hi def link ca65Number   Number
hi def link ca65String   String
hi def link ca65Operator Operator
hi def link ca65Label    Typedef
hi def link ca65Symbol   Type
hi def link ca65Comment  Comment
hi def link ca65Todo     Todo

hi def link ca65AddressSizeKeyword Special
hi def link ca65AddressSizePrefix  Special

hi def link ca65PseudoVar  Identifier
hi def link ca65PseudoFunc Function

hi def link ca65DataDef Type
hi def link ca65Define  Define
hi def link ca65Segment StorageClass
hi def link ca65Cond    PreCondit
hi def link ca65Except  PreProc
hi def link ca65Struct  Structure
hi def link ca65Macro   Macro
hi def link ca65Include Include
hi def link ca65Module  PreProc
hi def link ca65CtrlCmd PreProc

syn case match
let b:current_syntax = "ca65"

let &cpo = s:cpo_save
unlet s:cpo_save

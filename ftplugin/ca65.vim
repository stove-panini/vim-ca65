" Vim filetype plugin file
" Language:	ca65 macro assembler
" Maintainer:  Stephen Panicho <stephen@undo.land>
" Last Change: 2025 Jan 4

if exists('loaded_matchit') && !exists('b:match_words')
  let b:match_ignorecase = 1
  let b:match_words = '\<PH[ABDKPXY]\>:\<PL[ABDKPXY]\>,'
  \ . '\.ENUM\>:\.ENDENUM\>,'
  \ . '\.IF\>:\.ELSEIF\>:\.ELSE\>:\.ENDIF\>,'
  \ . '\.MAC(RO)?\>:\.ENDMAC(RO)?\>,'
  \ . '\.PROC\>:\.ENDPROC\>,'
  \ . '\.REP(EAT)?\>:\.ENDREP(EAT)?\>,'
  \ . '\.SCOPE\>:\.ENDSCOPE\>,'
  \ . '\.STRUCT\>:\.ENDSTRUCT\>,'
  \ . '\.UNION\>:\.ENDUNION\>'
endif

setlocal commentstring=;%s

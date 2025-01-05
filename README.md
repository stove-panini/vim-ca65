vim-ca65
========
Syntax highlighting for the [ca65](https://cc65.github.io/doc/ca65.html) macro assembler with MatchIt support.

Installation
------------
Install via your plugin manager of choice. For example, with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
call plug#begin()
Plug 'stove-panini/vim-ca65'
call plug#end()
```

Then, call `:PlugInstall`

Instruction sets
----------------
This plugin supports instruction sets for all of ca65's supported CPUs:
- 6502
- 6502X (6502 w/ illegal instructions)
- 65C02
- 65CS02
- 65816
- HuC6280
- 4510
- sweet16

Filetypes
---------
The base "ca65" filetype highlights the original 6502 instructions. For the variants, append its name after a dot when setting the filetype. For example, `set ft=ca65.65C02`, `set ft=ca65.HuC6280`, etc.

This plugin does not contain an ftdetect script nor does it enforce any particular indentation scheme. That's all a bit too personal! It's easy to set your own, however.

### Setting your own filetype detection & options
In your vim config as an autocommand:

```vim
augroup ca65
  au!
  au BufNewFile,BufRead ~/Projects/nes/*/*.asm setlocal ft=ca65
  au BufNewFile,BufRead ~/Projects/pce/*/*.asm setlocal ft=ca65.HuC6280
  au FileType ca65* setlocal noexpandtab ts=4 sw=4
augroup END
```

Or as a [modeline](https://vim.fandom.com/wiki/Modeline_magic) at the top or bottom of each file:
`; vim: ft=ca65.sweet16 ts=8 sw=8`

Thanks
------
At the time of this writing, there are two other existing vim plugins for ca65, [maxbane/vim-asm\_ca65](https://github.com/maxbane/vim-asm_ca65) and [MatthiasQuintern/vim-ca65](https://github.com/MatthiasQuintern/vim-ca65). Big thanks to them for inspiring some of the design decisions. I also referenced Vim's syntax plugin for [xa65](https://github.com/vim/vim/blob/master/runtime/syntax/a65.vim) quite a bit as well.

Come have a look at my 6502 development blog over at [UndoLand](https://undo.land)!

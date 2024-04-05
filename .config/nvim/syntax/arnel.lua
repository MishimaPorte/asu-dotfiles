vim.cmd('syn case match')
vim.cmd('syn keyword arDeclSpec export extern return if else while')
vim.cmd('hi def link arDeclSpec Keyword')

vim.cmd('syn region arComment start="\\\\\\\\" end="$"')
vim.cmd('hi def link arComment Comment')

vim.cmd('syn region arString start=/"/ skip=/\\\\"/ end=/\"/ contains=arEscape')
vim.cmd('hi def link arString String')

vim.cmd[[syn match arEscape display contained /\v\\[bfnrtv'"]|\\x\x{2}|\\\o{1,3}/]]
vim.cmd('hi def link arEscape Special')
vim.cmd[[syn match arFloat  "\v<[ds]_-?\d+.\d*([eE][+-]?\d*)?"]]
vim.cmd[[syn match arNumber "\v<\d+"]]
vim.cmd('hi def link arFloat Number')
vim.cmd('hi def link arNumber Number')

vim.cmd('hi def link arBuiltinType Type')
vim.cmd[[syn keyword arBuiltinType int
            \ void
            \ str
            \ float
            \ double
            \ u8
            \ u16
            \ u32
            \ u64
            \ i8
            \ i16
            \ i32
            \ i64
            \ bool ]]

-- vim.cmd('hi def link qbeInstruction Function')
--
-- " Instructions.
-- " Arithmetic and Bits.
--
-- " Memory.
-- syn keyword qbeInstruction alloc16
--             \ alloc4
--             \ alloc8
--             \ loadd
--             \ loadl
--             \ loads
--             \ loadsb
--             \ loadsh
--             \ loadsw
--             \ loadub
--             \ loaduh
--             \ loaduw
--             \ loadw
--             \ storeb
--             \ stored
--             \ storeh
--             \ storel
--             \ stores
--             \ storew
--
-- " Comparison.
-- syn keyword qbeInstruction ceqd
--             \ ceql
--             \ ceqs
--             \ ceqw
--             \ cged
--             \ cges
--             \ cgtd
--             \ cgts
--             \ cled
--             \ cles
--             \ cltd
--             \ clts
--             \ cned
--             \ cnel
--             \ cnes
--             \ cnew
--             \ cod
--             \ cos
--             \ csgel
--             \ csgew
--             \ csgtl
--             \ csgtw
--             \ cslel
--             \ cslew
--             \ csltl
--             \ csltw
--             \ cugel
--             \ cugew
--             \ cugtl
--             \ cugtw
--             \ culel
--             \ culew
--             \ cultl
--             \ cultw
--             \ cuod
--             \ cuos
--
-- " Conversions.
-- syn keyword qbeInstruction dtosi
--             \ dtoui
--             \ exts
--             \ extsb
--             \ extsh
--             \ extsw
--             \ extub
--             \ extuh
--             \ extuw
--             \ sltof
--             \ ultof
--             \ stosi
--             \ stoui
--             \ swtof
--             \ uwtof
--             \ truncd
--
-- " Cast and Copy, Call, Variadic, Phi and Jumps.
-- syn keyword qbeInstruction cast
--             \ copy
--             \ call
--             \ vastart
--             \ vaarg
--             \ phi
--             \ jmp
--             \ jnz
--             \ ret
--
-- " Keywords.
-- syn keyword qbeKeyword align data env export function section type
--
-- " Misc syntax.
--
--
--
-- let b:current_syntax = "qbe"
--
-- let &cpo = s:cpo_save
-- unlet! s:cpo_save

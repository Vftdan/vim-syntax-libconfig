" Vim syntax file
" Language: libconfig configuration file
" Maintainer: David Perry <boolean263 at protonmail dot com>
" Last Change: 2024-08-14
"
" References:
" https://hyperrealm.com/libconfig/libconfig_manual.html#Configuration-Files

" Quit when a (custom) syntax file was already loaded
if exists("b:current_snintax")
  finish
endif

syn region lcfgKey start="\<[A-Za-z*]\@=" matchgroup=lcfgAssignment end="[=:]\|\%$" contains=lcfgIdentifier,lcfgComment
syn region lcfgRhs transparent contains=@lcfgValue,lcfgComment start="\([=:]\n*\)\@<=" matchgroup=lcfgSemicolon end=";\|\%$\|\ze\<[A-Za-z*]\@="
syn cluster lcfgScalar contains=lcfgInt,lcfgFloat,lcfgBool,lcfgString
syn cluster lcfgValue contains=@lcfgScalar,lcfgArray,lcfgList,lcfgGroup

syn keyword	lcfgTodo	contained TODO FIXME XXX
syn region	lcfgComment	start="\(#\|//\)" end="$" keepend contains=lcfgTodo
syn region	lcfgComment	start="/\*" end="\*/" extend contains=lcfgTodo

syn match lcfgComma "," contained

syn region lcfgList transparent matchgroup=lcfgListBrackets start="(" end=")" contains=lcfgComment,lcfgComma,@lcfgValue contained
syn region lcfgArray transparent matchgroup=lcfgArrayBrackets start="\[" end="\]" contains=lcfgComment,lcfgComma,@lcfgScalar contained
syn region lcfgGroup transparent matchgroup=lcfgGroupBrackets start="{" end="}" contains=TOP contained

syn match lcfgIdentifier "[A-Za-z*][A-Za-z0-9_*-]*" contained
syn match lcfgInt "\s*[-+]\?\d\+L\?\s*" contained
syn match lcfgInt "\s*0x[0-9a-fA-F]\+L\?\s*" contained
syn match lcfgFloat "\s*[-+]\?\d\+\.\d\+\s*" contained
syn match lcfgFloat "\s*[-+]\?\d\+\.\d\+[eE][-+]\?\d\+\s*" contained
syn region lcfgString    start=+"+ skip=+\\"+  end=+"+ contains=lcfgEsc contained
syn match lcfgEsc +\\[\\"fnrt]+ contained
syn match lcfgEsc +\\x[0-9a-fA-F][0-9a-fA-F]+ contained
syn case ignore
syn keyword lcfgBool true false

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link lcfgListBrackets	Delimiter
hi def link lcfgArrayBrackets	Delimiter
hi def link lcfgGroupBrackets	Delimiter
hi def link lcfgAssignment	Delimiter
hi def link lcfgComma	Delimiter
hi def link lcfgSemicolon	Delimiter
hi def link lcfgComment	Comment
hi def link lcfgTodo	Todo
hi def link lcfgString	String
hi def link lcfgEsc SpecialChar
hi def link lcfgIdentifier Statement
hi def link lcfgInt Number
hi def link lcfgFloat Number
hi def link lcfgBool Constant

let b:current_syntax = "libconfig"

" vim: ts=8 sw=2

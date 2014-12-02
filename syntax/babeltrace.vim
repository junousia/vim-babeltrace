" Vim syntax file
"
" Language:     Babeltrace
" Maintainer:   Jukka Nousiainen <jukka.nousiainen@gmail.com>
" Last Change:  1 December 2014
"

if exists("b:current_syntax")
  finish
endif

syn match babeltraceTracepoint "[a-zA-Z0-9\-_]\+"
syn match babeltraceProviderSeparator ":" nextgroup=babeltraceTracepoint
syn match babeltraceProvider "[a-zA-Z0-9_\-]\+" skipwhite nextgroup=babeltraceProviderSeparator
syn match babeltraceHostname "[a-zA-Z_\-]\+\s" skipwhite nextgroup=babeltraceProvider
syn match babeltraceTimeDiff "(.*)" skipwhite nextgroup=babeltraceHostname
syn match babeltraceTimestamp "\[\d\d:\d\d:\d\d.\d\d\d\d\d\d\d\d\d\]" skipwhite nextgroup=babeltraceTimeDiff
syn match babeltraceAttribute "[a-zA-Z0-9_]\+ "
syn match babeltraceInteger "\d\+"
syn match babeltraceHex "0x[a-fA-F0-9]\+"
syn region babeltraceArray start="\[" end="\]" contained transparent
syn region babeltraceString start='"' end='"' contained
syn region babeltraceDescBlock start="{" end="}" fold transparent contains=babeltraceAttribute,babeltraceString,babeltraceInteger,babeltraceHex,babeltraceArray

if !exists("did_babeltrace_syntax_inits")
  let did_babeltrace_syntax_inits = 1
  hi link babeltraceTimestamp            Comment
  hi link babeltraceHostname             Identifier
  hi link babeltraceProvider             Identifier
  hi link babeltraceTimeDiff             Constant
  hi link babeltraceString               String
  hi link babeltraceInteger              Constant
  hi link babeltraceHex                  Constant
  hi link babeltraceAttribute            Type
endif

let b:current_syntax="babeltrace"

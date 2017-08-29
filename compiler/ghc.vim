if exists("current_compiler") && current_compiler == "ghc"
  finish
endif
let current_compiler = "ghc"

let s:cpo_save = &cpo
set cpo&vim

" Support older Vim via :setlocal
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=stack\ ghc\ --\ -Wall\ -Werror\ -e\ :q\ %
CompilerSet errorformat=
                    \%-G,
                    \%-Z\ %#,
                    \%W%f:%l:%c:\ Warning:\ %m,
                    \%E%f:%l:%c:\ %m,
                    \%E%>%f:%l:%c:,
                    \%+C\ \ %#%m,
                    \%W%>%f:%l:%c:,
                    \%+C\ \ %#%tarning:\ %m,

" GHC outputs (partially) to stderr
setlocal shellpipe=2>

let &cpo = s:cpo_save
unlet s:cpo_save

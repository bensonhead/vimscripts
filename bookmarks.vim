
" Bookmark current line to ~/z
" Walk through accumulated bookmarks with :cfile ~/z
:command! Bm call writefile([expand("%:p").":".line(".").": ".getline(".")],$HOME."/z","a")

" add current line to ./tags
" if argument present, use it as a tag name, if not, use current <cword>
" if bang is present, use line number to bookmark, otherwise search pattern
:command! -bang -nargs=? Bt call writefile([join(["<args>"==""?expand("<cword>"):"<args>",expand("%"),"<bang>"=="!"?line("."):"/^".escape(getline(line(".")),"\\")."$"],"\t")],"tags","a")

" when clipboard contains "file:line", go to that location
function s:GotoClipboard()
let l:goto=split(@+,':')
if match(l:goto[0],"^[C-Zc-z]$")>=0
" windows file spec may contain drive letter, merge it in
let l:goto[1]=join(l:goto[0:1],':')
unlet l:goto[0]
endif
let l:goto[0]=substitute(l:goto[0],"\n","","g")
if len(l:goto)==1
let l:goto+=["1"]
endif
exec ":e +".l:goto[1]." ".l:goto[0]
endfunction

:command! Gocl :call <SID>GotoClipboard()

if has("gui")
  menu &Plugins.&Tag\ word :Bt!<CR>
  menu &Plugins.&Bkmrk\ line :Bm<CR>
endif


syntax off

iabbr #d <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
set clipboard+=unnamedplus,unnamed
set listchars+=trail:_,extends:»,precedes:«,
set showbreak=▌ " lB 
" ▲►▼◄
digraph <# 9668 #< 9668 #> 9658 #^ 9650 #v 9660 #_ 9660
set visualbell


"
command! -range Exec :<line1>,<line2>g/^/exec getline('.')

" Default value is same as yy, which annoys me more than it should have.
map Y y$


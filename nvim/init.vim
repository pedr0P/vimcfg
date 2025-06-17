source ~/.config/nvim/inic.lua
source ~/.config/nvim/lua/opts.lua
source ~/.config/nvim/lua/maps.lua
source ~/.config/nvim/lua/plugins.lua

source ~/.unicodes/math.vim
source ~/.unicodes/greek.vim
source ~/.unicodes/thatex.vim
source ~/.unicodes/games.vim
source ~/.unicodes/pedro.vim

source ~/.config/nvim/colemak-dh.lua

augroup AutoSaveGroup
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " BufHidden for compatibility with `set hidden`
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

abbreviate tema colorscheme
"colorscheme kanagawa-wave
"colorscheme bit
"colorscheme everforest
colorscheme cyber_real

"set fillchars+=foldopen:,foldsep:│,foldclose:┌,fold:\ 
set fillchars+=foldopen:┌,foldsep:│,foldclose:,fold:\ 
"set foldtext=\ 
"set fillchars=fold:\  

"augroup insertonenter
"    function! InsertOnTerminal()
"        if &buftype ==# "terminal"
"            normal i
"        endif
"    endfunction
"
"    autocmd! BufEnter * call InsertOnTerminal()
"    if has('nvim')
"        autocmd! TermOpen * call InsertOnTerminal()
"    endif
"augroup END


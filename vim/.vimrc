syntax on

let mapleader = " "

" VIM:
  " Save
    nnoremap <leader>w :update<CR>
  " Quit
    nnoremap <leader>q :q<CR>
  " New Windows
    nnoremap <C-c>\| :vsplit<CR>
    nnoremap <C-c>- :split<CR>
  " Resize Windows
    nnoremap <S-Left>  <C-w>>
    nnoremap <S-Right> <C-w><
    nnoremap <S-Up>    <C-w>-
    nnoremap <S-Down>  <C-w>+
  " Run Code
    "nnoremap<leader>c :RunCode<CR>")
  " Leave Terminal mode
    tnoremap <esc><esc> <C-\><C-n>
  " Buffers
    nnoremap <leader>b :buffers<CR>
    nnoremap <leader>1 :buffer 1<CR>
    nnoremap <leader>2 :buffer 2<CR>
    nnoremap <leader>3 :buffer 3<CR>
    nnoremap <leader>4 :buffer 4<CR>
    nnoremap <leader>5 :buffer 5<CR>
    nnoremap <leader>6 :buffer 6<CR>
    nnoremap <leader>7 :buffer 7<CR>
    nnoremap <leader>8 :buffer 8<CR>
    nnoremap <leader>9 :buffer 9<CR>
    nnoremap <leader>0 :buffer 10<CR>
    nnoremap <C-c>0    :bd<CR>
" Tabs
    nnoremap <C-tab>   :tabNext<CR>
    nnoremap <C-c>1    :tabfirst<CR>
" Remove Highlights
    nnoremap <C-c>no :nohl<CR>

" PLUGINS:
" Plug
    nnoremap <C-c>pi  :PlugInstall<CR>
    nnoremap <C-c>ps  :PlugStatus<CR>
    nnoremap <C-c>pc  :PlugClean<CR>
    nnoremap <C-c>pu  :PlugUpdate<CR>
    nnoremap <C-c>pup :PlugUpgrade<CR>
  " FZF-Lua
    "nnoremap <C-c>m    :FzfLua<CR>
    nnoremap <leader>/ :Blines <CR>
    nnoremap <C-c>/    :Rg<CR>
    nnoremap <C-c>b    :Buffers<CR>
    nnoremap <C-c>f    :Files<CR>
    nnoremap <C-c>d    :FzfLua lsp_document_diagnostics<CR>
    nnoremap <C-c>uc   :Colors<CR>
" [custom] COLEMAK-DH rebind 
noremap m h
noremap n j
noremap e k
noremap i l

noremap h m
noremap j n
noremap k e
noremap l i

noremap M H
noremap N J
noremap E K
noremap I L

noremap H M
noremap J N
noremap K E
noremap L I

" Editor options
set number
set relativenumber
set noerrorbells
set autoindent
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nocompatible
set splitbelow
set cursorline
set clipboard=unnamedplus
"set scriptencoding=utf-8
"set encoding="utf-8" " Sets the character encoding used inside Vim.
"set fileencoding="utf-8" " Sets the character encoding for the file of this buffer.
set showtabline=1
set ruler
set hidden
set ttimeoutlen=0
set wildmenu
set noshowcmd
set nowrap
set virtualedit=block
set ignorecase
set noshowmode
set foldcolumn=1

"function! MyFoldText()
"    let nl = v:foldend - v:foldstart + 1
"    let comment = substitute(getline(v:foldstart),"^ *","",1)
"    let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
"    let txt = '+ ' . linetext . ' : "' . comment . '" : length ' . nl
"    return txt
"endfunction
"set foldtext=MyFoldText

set foldmethod=manual
set incsearch

augroup AutoSaveGroup
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

"set fillchars+=foldopen:┌,foldsep:│,foldclose:,fold:\ 
set fillchars+=foldopen:-,foldsep:│,foldclose:>,fold:\ 

" Cool Plugins:
call plug#begin()

" Autocompletion
Plug 'ycm-core/YouCompleteMe' 
" Tab completion feature
Plug 'vim-scripts/VimCompletesMe'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Man pages in vim
Plug 'vim-utils/vim-man'
" Cool theme
Plug 'ghifarit53/tokyonight-vim'
" Status line
Plug 'itchyny/lightline.vim'
" Lsp server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
"" Autocompletion options for lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Fuzzle find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Auto close pairs
Plug 'Raimondi/delimitMate'
" Clipboard for Wayland
Plug 'jasonccox/vim-wayland-clipboard'
" For -clipboard or -xterm_clipboard
Plug 'christoomey/vim-system-copy'

call plug#end()            " required

" Theming
if has('termiguicolors')
    set termguicolors
endif

let g:tokyonight_style = 'storm' " night or storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
set background=dark

"" Light line
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.separator  = { 'left':'', 'right':'' }
let g:lightline.subseparator = { 'left':'', 'right':'' }
set laststatus=2

" Lsp configuration
"" LSP highlighting
let g:lsp_semantic_enabled = 1

"" Signs for diagnostics
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

"" Signs for errors, warnings, etc.
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': '󰠠'}
let g:lsp_diagnostics_signs_information = {'text': ''}

"" Clangd configuration
if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

"" LSP key mappings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    nnoremap <buffer> <C-c>ld :LspDefinition<CR>
    nnoremap <buffer> <C-c>lr :LspReferences<CR>
    nnoremap <buffer> <C-c>li :LspImplementation<CR>
    nnoremap <buffer> <C-c>lt :LspTypeDefinition<CR>
    nnoremap <buffer> <C-c>d :LspDocumentDiagnostics<CR>
    nnoremap <buffer> E :LspHover<CR>
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let &t_EI = "\<Esc>[1 q" " Normal mode  - Block cursor
let &t_SI = "\<Esc>[5 q" " Insert mode  - Line cursor
let &t_SR = "\<Esc>[3 q" " Replace mode - Underline cursor

let mapleader = "\<Space>"
let maplocalleader = ","

if has('win32') || has('win64')
  let directory=.,$TEMP " Swap file support for windows.
  let g:vimrcpath = $HOME . "/_vimrc"
  let g:vimhomepath = $HOME . "/_vim"
  let g:vimrceditpath = $HOME . "/_vimrc"
  let g:vimrcdeditpath = $HOME . "/_local/share/chezmoi/private_dot_config/vimrc_d/" " Not tested chezmoi on windows so likely won't work
else
  let g:vimrcpath = $HOME . "/.vimrc"
  let g:vimhomepath = $HOME . "/.vim"
  let g:vimrceditpath = $HOME . "/.local/share/chezmoi/dot_vimrc"
  let g:vimrcdeditpath = $HOME . "/.local/share/chezmoi/private_dot_config/vimrc.d/"
endif
nnoremap <silent> <LocalLeader>vh :execute ':e ' . g:vimhomepath<CR>      " View .vim directory
nnoremap <silent> <LocalLeader>ve :execute ':e ' . g:vimrceditpath<CR>    " Edit vimrc
nnoremap <silent> <LocalLeader>vd :execute ':e ' . g:vimrcdeditpath<CR>   " View vimrc.d directory to edit configs.
nnoremap <silent> <LocalLeader>vs :execute ':source ' . g:vimrcpath<CR>   " Source the vimrc
nnoremap <silent> <LocalLeader>vt :execute ':tabnew ' . g:vimhomepath<CR> " View vim directory in a new tab

" Stop highlighting searches
nnoremap <silent> <LocalLeader><Space> :noh<CR>

" Buffer maps
"" Close buffer without closing split
nmap <silent> <LocalLeader>d :bp\|bd #<CR>

" Folding shortcuts
"" Fold all the things
nmap <silent> <Leader>zc :set foldlevel=0<CR>
"" Unfold top level.
nmap <silent> <Leader>za :set foldlevel=1<CR>
"" Unfold everything.
nmap <silent> <Leader>zA :set foldlevel=999<CR>

" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

map <F1> :Gwrite<CR>
map <F2> :Git commit<CR>
map <F3> :Git push<CR>
imap <F1> <ESC>:Gwrite<CR>i
imap <F2> <ESC>:Git commit<CR>
imap <F3> <ESC>:Git push<CR>i

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Confirm completion
let g:completion_confirm_key = "\<C-y>"

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR>

" Expand region mappings for terryma/vim-expand-region plugin.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nmap <silent> <Leader>a :Startify<CR>

" Run Git commands
nnoremap <Leader>G :Git 

" Run chezmoi apply to apply dotfile changes
nnoremap <silent> <Leader>ca :Dispatch! chezmoi apply<CR>

" Find files using Telescope
nnoremap <leader>; :Telescope git_files<cr>
nnoremap <leader>' :Telescope find_files<cr>

" Grep using ripgrep via Telescope
nnoremap <leader>g :Telescope live_grep<cr>

" Open Lua Tree
nnoremap <Leader>ee :NvimTreeToggle<CR>
nnoremap <Leader>ef :NvimTreeFindFile<CR>

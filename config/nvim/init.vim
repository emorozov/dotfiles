set nocompatible
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set selection=exclusive

set termguicolors
filetype plugin on
syntax on
let python_highlight_all=1

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//


inoremap jk <ESC>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set list listchars=tab:»·,trail:·


set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

autocmd FileType text setlocal textwidth=78 formatoptions+=t infercase
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" x-Window clipboard settings for neovim
set clipboard=unnamed
nnoremap <expr> p (v:register == '"' && &clipboard =~ 'unnamed' ? '"*p' : '"' . v:register . 'p')

"set nu rnu

hi CursorLineNr   cterm=bold ctermfg=none guibg=#222222 gui=none
hi LineNr         ctermfg=DarkMagenta guifg=#2b506e guibg=#000000


call plug#begin('~/.vim/plugged')

Plug 'ledger/vim-ledger'
Plug 'cespare/vim-toml'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme gotham256


" fzf config
nnoremap <C-p> :Files<cr>
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-i': 'split',
\ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

" EasyMotion config
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


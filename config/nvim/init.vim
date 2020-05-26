set nocompatible
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

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


" x-Window clipboard settings for neovim
set clipboard=unnamed
nnoremap <expr> p (v:register == '"' && &clipboard =~ 'unnamed' ? '"*p' : '"' . v:register . 'p')

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"set nu rnu

hi CursorLineNr   cterm=bold ctermfg=none guibg=#222222 gui=none
hi LineNr         ctermfg=DarkMagenta guifg=#2b506e guibg=#000000


call plug#begin('~/.vim/plugged')

Plug 'ledger/vim-ledger'
Plug 'vimwiki/vimwiki'
Plug 'cespare/vim-toml'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dag/vim-fish'

call plug#end()

colorscheme gotham256

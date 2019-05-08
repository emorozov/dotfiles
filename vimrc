set nocompatible
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

filetype plugin on
syntax on
let python_highlight_all=1

inoremap jk <ESC>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set list listchars=tab:»·,trail:·

if has("gui_running")
  colors ir_black
  set guioptions=aiA " Disable toolbar, menu bar, scroll bars
  " set guifont=Monaco
endif

set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

autocmd FileType text setlocal textwidth=78 formatoptions+=t infercase

execute pathogen#infect()

au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

" x-Window clipboard settings for neovim
set clipboard=unnamed
nnoremap <expr> p (v:register == '"' && &clipboard =~ 'unnamed' ? '"*p' : '"' . v:register . 'p')

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

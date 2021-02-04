set background=dark
" Enable auto indentation custom per file type
filetype plugin indent on
" Set tabs to 4 space chars
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Set backspace behavior in insert mode
set backspace=indent,eol,start
" Disable beeps
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set number
set laststatus=2
let NERDTreeShowHidden=1

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'marlonfan/coc-phpls'

call plug#end()

"A
"FZF ---
"B
"find files in project
nnoremap <C-S-n> :GFiles<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 2

"NERDTree ---
"autoload nerdtree on start
autocmd vimenter * NERDTree
map <C-\> :NERDTreeToggle<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
"nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

nnoremap <C-o> :tabprevious<CR>
nnoremap <C-p> :tabnext<CR>

"vim-php-cs-fixer ----
"(autosave)
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


"""""""""""""""""""
"COC - autocompletion
"""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
                              
" arnaud-lb/vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


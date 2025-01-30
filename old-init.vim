" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

syntax on

set nowrap

set number
set relativenumber

" set textwidth=80
" set colorcolumn=+1
set colorcolumn=80

set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set noswapfile
set nobackup
set nowritebackup
set expandtab

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

set background=dark
" set noshowmode

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
set termguicolors


" PLUGINS ---------------------------------------------------------------- {{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'vim-scripts/AutoClose'
Plug 'wakatime/vim-wakatime'

" Tim Pope Certified Goodness
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive' " Git sorcery
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround' " cs<find><replace> to change surroundings of text
Plug 'tpope/vim-commentary' " gcc to comment out lines

Plug 'lukas-reineke/indent-blankline.nvim' " TODO: Customize after init.lua

" Statusline magic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'luochen1990/rainbow' " coolorise matching parentheses
" Plug 'airblade/vim-gitgutter' " git diff in the sign column
Plug 'lewis6991/gitsigns.nvim'

Plug 'ngmy/vim-rubocop' " Run rubocop on save
Plug 'vim-test/vim-test' " Run tests magically
Plug 'ecomba/vim-ruby-refactoring' " IntelliJ-style refactoring tools
" Plug 'mileszs/ack.vim'
Plug 'szw/vim-maximizer' " C-w |, C-w _, C-w =
Plug 'w0rp/ale' " Async linter
Plug 'voldikss/vim-floaterm' " Coolest floating terminal EVER

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'terryma/vim-multiple-cursors' " Multi cursor magic

Plug 'noprompt/vim-yardoc' " Highlight YARDoc comments

Plug 'github/copilot.vim' " AI Magic from Github

Plug 'joshdick/onedark.vim' " Atom's OneDark theme (a.k.a THE best theme out there)

Plug 'pechorin/any-jump.vim' " Magic Jump
Plug 'rmagatti/auto-session' " TODO: Make git branch aware after init.lua

" Non-Ruby language support
Plug 'fatih/vim-go' " Golang support
Plug 'hashivim/vim-terraform'
Plug 'kchmck/vim-coffee-script'
Plug 'skanehira/docker-compose.vim'

Plug 'ryanoasis/vim-devicons'
call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Remap arrow keys to NOTHING
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

tnoremap <Esc> <C-\><C-n>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <Leader>b <cmd>Telescope buffers<cr>

nmap <Leader>q :bufdo bd!<CR>

" Easier window navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-v> :wincmd v<CR>
nmap <silent> <C-s> :wincmd s<CR>

" Testing made easy
map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>

" Undo
noremap U <C-R>

" ESC when ESC is too far
imap jw <Esc>
imap jk <Esc>

" Space is leader
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{
" Mah damn typos!
command! W write
command! Q quit
" command Q q
" command W w

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal wrap


" NeoVim & Airline theme
colorscheme onedark
let g:onedark_terminal_italics = 1
" Allow transparent background in terminal
hi Normal guibg=NONE ctermbg=NONE

let g:rainbow_active = 1

" Ale configs
" Let Ale run only on file save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" Floaterm configs
let g:floaterm_keymap_toggle = '<Leader>e'

" Run specs via this
let g:rspec_command = "!be rspec --drb {spec} -f progress"

" indent
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" let g:ackprg = 'ag --vimgrep'

let g:vimrubocop_rubocop_cmd = 'be rubocop'

let g:coc_global_extensions = ['coc-solargraph', 'coc-go', 'coc-tsserver']

" if executable('solargraph')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'solargraph',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"         \ 'initialization_options': {"diagnostics": "true"},
"         \ 'whitelist': ['ruby'],
"         \ })
" endif
" }}}


" STATUS LINE ------------------------------------------------------------ {{{

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}

" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Relative line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set noswapfile                          " Do not create swp files
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set termguicolors                       " True colors
set laststatus=2                        " enable statusline
set showtabline=2                       " enable tab(buffer) line
set inccommand=split                    " Incremental command (live regex)
set pumblend=15                         " Transparency for popups
set signcolumn=number                   " merge signcolumn and number column into one
set list                                " Show hidden characters (like space, etc.)
set listchars=tab:←–→,trail:•,lead:∙,nbsp:␣,extends:»,precedes:«,conceal:⁝

call plug#begin(stdpath('data') . '/plugged')

" essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" utility
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'kassio/neoterm'
Plug 'vim-test/vim-test'
Plug 'airblade/vim-gitgutter'

" colorschemes
Plug 'tssm/fairyfloss.vim'
Plug 'bignimbus/pop-punk.vim'
Plug 'ronwoch/hotline-vim'
Plug 'victorze/foo'
Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'wadackel/vim-dogrun'
Plug 'yuttie/hydrangea-vim'
Plug 'beikome/cosme.vim'
Plug 'danini-the-panini/gruvbox'

" language support
Plug 'tikhomirov/vim-glsl'

" styling
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'romgrk/barbar.nvim'

" docs lookup
Plug 'romainl/vim-devdocs'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" neovim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" language server
Plug 'neovim/nvim-lspconfig'

call plug#end()

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

colorscheme fairyfloss
hi Normal guifg=#f8f8f0 guibg=NONE gui=NONE
" colorscheme pop-punk
" colorscheme defau
" gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_transparent=1
" let g:gruvbox_invert_selection='0'
" colorscheme gruvbox

" edit & source vim config files
nmap <leader><leader>e :edit ~/.config/nvim/init.vim<cr>
nmap <leader><leader>r :source ~/.config/nvim/init.vim<cr>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" quicker split navigation
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" quicker buffer navigation
nnoremap <leader>p :ls<CR>:b<Space>
nnoremap <leader>j <Esc>:bprevious<CR>
nnoremap <leader>k <Esc>:bnext<CR>
nnoremap <leader>l <Esc>:b#<CR>

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" telescope: remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>p <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("🔍> ")})<CR>
nnoremap <leader>fr :lua require('telescope.builtin').grep_string({ search = vim.fn.input(".*> "), use_regex = true })<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fc :lua require('danini').search_dotfiles()<CR>
nnoremap <C-p> <cmd>Telescope git_files<cr>

" highlight marked files in netrw the same colour as search
highlight link netrwMarkFile Search

" fugitive: remaps
" quickly open git status
nnoremap <leader>gg :Git<CR>

" auto-pairs
let g:AutoPairsCenterLine=0

" turn on spellchecking for markdown and gitcommit files
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
set complete+=kspell

" indent rainbow
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'netrw', 'neoterm', 'fugitive', 'git']
hi IndentGuidesEven  guibg=#8077A8 guifg=#C2FFDF
hi IndentGuidesOdd   guibg=#464258 guifg=#C19FD8

" glsl file association
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" neoterm
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='botright'
let g:neoterm_automap_keys='<nop>'
let g:neoterm_autoinsert=1

" neoterm: remaps
nmap <leader>t :Ttoggle<CR>
au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
au TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
au TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
au TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
au TermOpen * tnoremap <buffer> <M-l> <C-\><C-n><C-w>l

" share clipboard with windows
if (executable("win32yank") && !has("win32"))
  let g:clipboard = {
    \   'name': 'win32yank-wsl',
    \   'copy': {
    \      '+': 'win32yank -i --crlf',
    \      '*': 'win32yank -i --crlf',
    \    },
    \   'paste': {
    \      '+': 'win32yank -o --lf',
    \      '*': 'win32yank -o --lf',
    \   },
    \   'cache_enabled': 0,
    \ }
endif

" vim-test
let test#strategy = "neoterm"
nnoremap gts :TestSuite<CR>
nnoremap gtf :TestFile<CR>
nnoremap gtn :TestNearest<CR>
nnoremap gtl :TestLast<CR>

" lua
lua require('danini')

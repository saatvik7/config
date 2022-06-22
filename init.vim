" Automatically get Vim Plug if you don't already have it
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-sleuth'

" For colors
" Plug 'arcticicestudio/nord-vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'

" For airline
Plug 'vim-airline/vim-airline'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Vim as a programmer's text editor
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'

" For EasyMotion
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

" For NerdTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }

" For split screen navigation
Plug 'christoomey/vim-tmux-navigator'
" Plug 'edkolev/tmuxline.vim' " gives vim a nice tmux-like status bar
Plug 'junegunn/rainbow_parentheses.vim'

" For commenting
Plug 'preservim/nerdcommenter'

" For surrounding
" in visual mode, S + char -> surround the selected with the character
" use cs<char><char'> to change surrounding of char to char'
" use ysiw<char> to surround a word with a char
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "use dot on surround commands

" --- Working with Git ---
" shows signs next to changes
" see list of commands (:Gwrite, ...)
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'

" For more icons
" Plug 'ryanoasis/vim-devicons'
" NVIM PLUGINS
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

" Automatically get all plugins that you do not already have
autocmd VimEnter *
	    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	    \|   PlugInstall --sync | q
	    \| endif

" --- General settings ---
set number                     " Show current line number
set relativenumber             " Show relative line number
set showcmd
set hlsearch
set splitright
set splitbelow
set ignorecase " case insensitive searching (specify lower with \c)
set smartcase " if upper case in string, case sensitive
set mouse=a
set hidden " make buffers work normally
set scrolloff=2
set linebreak
set encoding=utf-8
set expandtab
set shiftwidth=4
set tabstop=4

" autocompletion
set wildignorecase
" set wildmode=list:longest,full

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile
set nowritebackup

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Enable folding
set foldmethod=indent
set foldlevel=99

" we already have airline so this is redundant
set noshowmode

" --- Tab Settings ---
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" --- REMAPS ---

" Remap leader to be easier to reach
let mapleader = ' '
" let maplocalleader = ' '

" make Y effect to end of line instead of whole line
noremap Y y$

" execute the current line of text as a shell command
noremap  Q !!zsh<CR>

" Auto Indent the entire file with =
" nnoremap = gg=G<C-o><C-o>

" Most controversial change in this whole vimrc file
" But it makes sense visually
" I'll try turning this off for a bit and see how this goes
" inoremap <silent> <Esc> <C-O>:stopinsert<CR>
" Make navigating wrapped lines the same as normal
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> gk k
noremap <silent> gj j
noremap <silent> ^ g^
noremap <silent> _ g_
noremap <silent> g^ ^
noremap <silent> g_ _

" Make pasting work like in normal editors
" Actually this was a bad idea I'm gonna turn it off for now
" noremap <silent> p gp
" noremap <silent> gp p
" noremap <silent> P gP
" noremap <silent> gP P

" Cycle through buffers
noremap <silent> gl :bn<CR>
noremap <silent> gh :bp<CR>
noremap <silent> <C-o> <C-o>zz<CR>
noremap <silent> <C-i> <C-i>zz<CR>

" Jump to buffers
noremap <silent> <Leader>b :ls<CR>:b<space>

"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <CR> :noh<CR>

" shortcut to save
nmap <leader>w :w<cr>

" Make vim open where left off
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif

" --- Plugin Specific Settings ---
"
" ----- Vim-GitGutter -----
" highlight clear SignColumn
" Make things update faster
set updatetime=100
" Highlight the SignColumn
highlight! link SignColumn LineNr

" Set the colorscheme
" set background=dark
colorscheme dracula

" Makes transparentcy work idk how but it does
highlight Normal guibg=NONE ctermbg=NONE

" Unified color scheme (default: dark)
" let g:seoul256_background = 235
" colo seoul256

" Toggle this to "light" for light colorscheme
" set background=dark
"
" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line

" Currently turned off to make vimrc more portable
" let g:airline_powerline_fonts = 1

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Show airline for Syntastic
" let g:airline#extensions#syntastic#enabled = 1

" Show airline for ALE
let g:airline#extensions#ale#enabled = 1
"
" Use theme for the Airline status bar
" let g:airline_theme='nord'

" ----- Syntastic Settings -----
" let g:syntastic_mode_map = { \ "mode": "passive",
	    " \ "active_filetypes": [],
	    " \ "passive_filetypes": [] }

" " close location list with :lclose
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
"
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

autocmd VimEnter * RainbowParentheses

" Show Status Line
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

" " press \g to automatically check for errors
" nnoremap <Leader>g :SyntasticCheck<CR>
"
" ----- ALE -----
let g:ale_linters = { 'python': ['flake8'] }
let g:ale_fixers = { 'python': ['black'] }
let g:ale_fix_on_save = 0

" Fix!
nnoremap <Leader>g :ALEFix<CR>

" ----- NerdTree -----
"  " Open/close NERDTree Tabs with \t
nmap <silent> <leader><leader>t :NERDTreeTabsToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" --- nerdcommenter ---
" Turn off default mappings
let g:NERDCreateDefaultMappings = 1
" Create space between the comment mark for prettier commenting
let g:NERDSpaceDelims = 1
" + to comment, - to uncomment
map + <plug>NERDCommenterComment
map - <plug>NERDCommenterUncomment


lua <<EOF
require("telescope").load_extension "file_browser"
local actions = require('telescope.actions')
require('telescope').setup{
  file_browser = {
     hidden = true
  },
  find_files = {
     hidden = true
  },
  defaults = {
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  }
}
EOF

" Telescope Commands
nnoremap <leader>t <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>l <cmd>LspInstall<cr>

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d
set clipboard+=unnamedplus
set timeoutlen=1000
set ttimeoutlen=5

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gca   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  require('telescope').setup{ defaults = { file_ignore_patterns = {"env"} } }
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete_common_string(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'calc' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  require("nvim-lsp-installer").setup {}
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
        }
      }
    }
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
EOF
" Set Theme
if has('termguicolors')
  set termguicolors
endif
  " set termguicolors
" endif
" set background=dark
" set t_Co=256
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest
" let g:airline_theme = 'dracula'


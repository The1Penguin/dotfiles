vim.cmd "packadd paq-nvim"
local map = vim.api.nvim_set_keymap
local options = { noremap=true }
require "paq-nvim" {
    {"catppuccin/nvim", as="catppuccin"};
    {"dracula/vim", as="dracula"};
    "numtostr/FTerm.nvim";
    "ervandew/supertab";
    "mhinz/vim-startify";
    "tpope/vim-surround";
    "vim-autoformat/vim-autoformat";
    "tpope/vim-commentary";
    "lervag/vimtex";
    "terrortylor/nvim-comment";
    {"neoclide/coc.nvim", run="coc#util#install()"};
    "nvim-treesitter/nvim-treesitter";
    "kdheepak/lazygit.nvim";
    "airblade/vim-gitgutter";
    "tpope/vim-fugitive";
    "ap/vim-css-color";
    "ryanoasis/vim-devicons";
    'kyazdani42/nvim-tree.lua',
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true};
}

local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

o.mouse= "a"
o.termguicolors = true
vim.cmd [[
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
set spelllang=sv,en
hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
set noshowmode
set statusline=
set fillchars+=vert:\
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent          "always turn on indentation
set breakindent         "Wrap lines at same indent level
set shiftwidth=4        "Spaces to use for autoindenting
set backspace=indent,eol,start " proper backspace behavior
set linebreak
hi CocHintSign          guifg=#6272a4
hi CocRustChainingHint  guifg=#6272a4
]]

g.vimtex_view_general_viewer = "zathura"
g.vimtex_complete_close_braces = 1
g.vimtex_complete_enabled = 1
g.vimtex_complete_smart_case = 1
g.vimtex_complete_ignore_case = 1
g.tex_flavor = "latex"

g.mapleader = ","

w.number     = true
o.scrolloff  = 5
o.timeoutlen = 300

o.splitbelow = true
o.splitright = true

o.incsearch  = true
o.ignorecase = true
o.hlsearch   = true

o.foldenable     = true
o.foldlevelstart = 10
o.foldnestmax    = 10
o.foldmethod     = [[indent]]
map("n", "<space>", "za", options)

map("n", "j", "gj", options)
map("n", "k", "gk", options)

map("n", "<C-J>", "<C-W><C-J>", options)
map("n", "<C-K>", "<C-W><C-K>", options)
map("n", "<C-L>", "<C-W><C-L>", options)
map("n", "<C-H>", "<C-W><C-H>", options)

map("n", "<C-s>", ":G add % <CR>", options)
map("n", "<C-f>", ":G commit -S <CR>", options)
map("n", "<C-g>", ":G push <CR>", options)
map("n", "<C-p>", ":G pull <CR>", options)
map('n', '<A-g>', ':LazyGit <CR>', opts)

g.python3_host_prog="/usr/bin/python"
map('n', '<F1>', ':Autoformat<CR>', opts)
map('v', '<C-b>', ':CommentToggle<cr>', opts)
map("n", "<F5>", ":setlocal spell! <CR>", options)
map("n", "<F3>", ":NvimTreeToggle <CR>", options)
map("i", "<S-tab>", "<C-x>s", options)
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
map("n", "<leader><space>", ":nohlsearch<cr>", options)
g.SuperTabDefaultCompletionType = "<c-x><c-o>"

require('lualine').setup{
    options = {
        theme = "dracula",
        component_separators = {'', ''},
        section_separators = {'', ''}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'location', 'progress'}
    },
    inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'location', 'progress'}
    }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "rust", "java", "lua", "haskell"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "javascript" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

require'FTerm'.setup({
    border = 'single',
    dimensions  = {
        height = 0.8,
        width = 0.8,
    },
})

require'nvim-tree'.setup()
g.nvim_tree_quit_on_open = 1

g.lazygit_floating_window_winblend = 0 -- transparency of floating window
g.lazygit_floating_window_scaling_factor = 0.8 -- scaling factor for floating window
g.lazygit_floating_window_corner_chars = {'???', '???', '???', '???'} -- customize lazygit popup window corner characters

require('nvim_comment').setup {
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "<C-b>",
    -- Hook function to call before commenting takes place
    hook = nil
}

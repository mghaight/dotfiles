vim.g.mapleader = " "                -- set <space> as leader
vim.g.maplocalleader = " "           -- set <space> as localleader

vim.cmd('filetype plugin indent on') -- language specific behavior

vim.opt.swapfile = false             -- no swapfiles
vim.opt.backup = false               -- no backups
vim.opt.undofile = true              -- save undo history across sessions

vim.opt.clipboard = "unnamedplus"    -- use system clipboard
vim.opt.mouse = "a"                  -- enable mouse in all modes

vim.opt.ignorecase = true            -- case-insensitive search
vim.opt.smartcase = true
vim.opt.incsearch = true             -- move through results

vim.opt.tabstop = 2                  -- sane defaults for tabs
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true  -- enable TRUE COLORS

vim.opt.winborder = "rounded" -- rounded borders for popup windows

vim.opt.number = true         -- line numbers on
vim.opt.relativenumber = true -- use relative line numbers
vim.opt.signcolumn = "yes"    -- keep constant space in the gutter for LSP diagnostics, etc.

vim.g.netrw_banner = 0        -- turn off the netrw banner

vim.opt.foldenable = false    -- no folding
vim.opt.breakindent = true    -- match indent level on wrap
vim.opt.linebreak = true      -- don't break words

vim.opt.splitright = true     -- window splits move right
vim.opt.splitbelow = true     -- or below

vim.opt.cursorline = true     -- highlight current line

vim.opt.scrolloff = 2         -- scroll buffer of 2 lines

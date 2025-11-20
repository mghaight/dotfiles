vim.keymap.set("i", "--", "<-", { buffer = true }) -- easier assignment operator
vim.keymap.set("i", ">>", "|><CR>", { buffer = true }) -- easier pipe

vim.opt_local.formatoptions:append("r") -- continue comments on <Enter>
vim.opt_local.formatoptions:append("o") -- continue comments on <o> or <O>

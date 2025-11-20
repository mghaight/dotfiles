vim.keymap.set("n", "<leader>lc", ":silent !typst compile % && open %:r.pdf<CR>", { buffer = true })

vim.bo.textwidth = 80
vim.bo.formatoptions = "tcqn"
vim.bo.formatexpr = ""

vim.keymap.set("n", "<leader>lc", ":silent !latexmk -xelatex % && open %:r.pdf<CR>", { buffer = true })

vim.bo.textwidth = 80

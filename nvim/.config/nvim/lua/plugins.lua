vim.pack.add {
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/mghaight/replua.nvim" },
}

require("blink.cmp").setup({
  completion = {
    menu = { border = "none" },
    -- ghost_text = { enabled = true },
    -- documentation = {
    --   auto_show = true,
    -- },
    trigger = {
      show_on_backspace = true,
      show_on_backspace_in_keyword = true,
    },
  },
  fuzzy = {
    implementation = "lua",
  },
})

require("typst-preview").setup({
  -- invert_colors = "auto",
})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "fennel", "html", "python", "r", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
}

require("telescope").setup({
  pickers = {
    find_files = { theme = "ivy" },
    buffers = { theme = "ivy" },
    live_grep = { theme = "ivy" },
  }
})

require("oil").setup()

vim.lsp.enable({
  "lua_ls",                      -- lua
  "tinymist",                    -- typst
  "texlab",                      -- latex
  "bashls",                      -- bash
  "r_language_server",           -- R
  "basedpyright",                -- python
  "vscode-html-language-server", -- html
  "html",                        -- html
  "rust_analyzer",               -- rust
})

vim.lsp.config("tinymist", {
  settings = {
    formatterMode = "typstfmt",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      hint = { enable = true },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = {
        disable = { "missing-fields" } -- disable noisy diagnostic
      },
    },
  },
})

-- from :h lsp
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Auto-format ("lint") on save.
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

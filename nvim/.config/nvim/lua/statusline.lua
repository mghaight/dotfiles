local git_cache = {}

_G.git_info = function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- early return cached data
  if git_cache[bufnr] then
    return git_cache[bufnr]
  end

  -- branch name
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if not handle then
    git_cache[bufnr] = ""
    return ""
  end

  local branch = handle:read("*l")
  handle:close()

  if not branch or branch == "" then
    git_cache[bufnr] = ""
    return ""
  end

  -- uncommited changes
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  local modified = ""

  if filepath ~= "" then
    handle = io.popen("git status --porcelain " .. vim.fn.shellescape(filepath) .. " 2>/dev/null")
    if handle then
      local status = handle:read("*l")
      handle:close()
      if status and status ~= "" then
        modified = "[+]"
      end
    end
  end

  local info = modified .. " " .. branch
  git_cache[bufnr] = info

  return info
end

-- clear cache on switching dirs or new buffer
vim.api.nvim_create_autocmd({ "DirChanged", "BufEnter", "BufWritePost" }, {
  callback = function()
    git_cache = {}
  end
})

-- statusline format
local statusline = {
  "%F",                  -- filepath
  "%m",                  -- modified marker
  "%=",
  "%{v:lua.git_info()}", -- git info
  "%{&filetype}",        -- filetype (duh)
  "%2p%%",               -- percentage of file
  "%3l:%-2c "            -- row:column number
}

vim.opt.statusline = table.concat(statusline, " ")

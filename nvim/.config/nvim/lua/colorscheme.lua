-- check system colorscheme
local function system_dark()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result:match("Dark") ~= nil
end

-- change vim colorscheme depending on system color
if system_dark() then
  vim.cmd.colorscheme("PaperColorSlim")
else
  vim.cmd.colorscheme("PaperColorSlimLight")
end

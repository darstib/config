vim.opt.termguicolors = true

----------------
-- for vscode --
----------------
-- VSCode extension
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end
-- default use insert mode
vim.api.nvim_create_augroup("OpenInInsertMode", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "OpenInInsertMode",
  pattern = "*",
  command = "startinsert",
})


-- reference: https://martinlwx.github.io/zh-cn/config-neovim-from-scratch/

require('options')        
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
require('config.nvim-cmp')
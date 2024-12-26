local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- set Colorscheme
    {
        "tanvirtin/monokai.nvim"
        -- "folke/tokyonight.nvim",
    },
	
    -- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	
	-- Auto-completion engine
    {
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	
    -- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	}, 
    
    -- LSP manager
	{
        "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
    },
    
    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30, -- width of the siderbar
                    side = "left", -- position of the siderbar
                },
                filters = {
                    dotfiles = true, -- show dotfiles, hidden files (for example, .gitignore)
                },
                on_attach = function(bufnr) -- open the tree when opening a file
                    local api = require("nvim-tree.api")
                    api.events.on_tree_open(function()
                        api.tree.change_root_to_node()
                    end)
                end,
            })
        end,
    },
    
    -- file searcher
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { {"nvim-lua/plenary.nvim"} },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = "> ",
                    selection_caret = "> ",
                    sorting_strategy = "ascending",
                    layout_strategy = "flex",
                },
            })
        end,
    },
    
    -- https://github.com/h-hg/fcitx.nvim -- 解决中文输入法问题
    {
        "h-hg/fcitx.nvim",
    },

    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
          -- Required.
          "nvim-lua/plenary.nvim",
      
          -- see below for full list of optional dependencies 👇
        },
        opts = {
          workspaces = {
          },
        },
    },
} 
)
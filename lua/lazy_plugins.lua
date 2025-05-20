local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  {"github/copilot.vim"},
  {"kdheepak/lazygit.nvim"},
  {"nvim-lua/plenary.nvim"},
  {"neovim/nvim-lspconfig"},
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     inlay_hints = {
  --       enabled = true,
  --       -- show_parameter_hints = false,
  --       parameter_hints_prefix = "",
  --       other_hints_prefix = "",
  --     },
  --   },
  --   requires = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     "williamboman/mason.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --   },
  -- },

  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
  {
    "nvim-telescope/telescope.nvim", 
    config = function()
      require('telescope').load_extension('lazygit')
      -- require('telescope').load_extension('fzf')
    end,
  },
  {"wakatime/vim-wakatime"},
  {"tpope/vim-sensible"},
  {"tpope/vim-fugitive"},
  {"tpope/vim-surround"},
  {"tpope/vim-commentary"},
  {"lukas-reineke/indent-blankline.nvim"},
  {"kyazdani42/nvim-web-devicons", opt = true},
  {"nvim-lualine/lualine.nvim"},
  {"luochen1990/rainbow"},
  -- idk
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ar"] = "@block.outer",
              ["ir"] = "@block.inner",
            },

            selection_modes = {
              ['@function.outer'] = 'V', -- linewise
              ['@block.outer'] = 'V',
            },
          }
        }
      }
    end
  },
  {"nvim-treesitter/nvim-treesitter-refactor"},
  {"nvim-treesitter/nvim-treesitter-context"},
  -- {"nvim-treesitter/nvim-treesitter-highlight"},
  -- endidk
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {"szw/vim-maximizer"},
  {"w0rp/ale"},
  { 'numToStr/FTerm.nvim' },-- Coolest floating terminal EVER
  {'projekt0n/github-nvim-theme'},
  {'pechorin/any-jump.vim'}, -- Magic Jump
  { 'danilamihailov/beacon.nvim'},
  { 'rmagatti/auto-session'},

  -- Ruby/Rails Plugins
  { 'tpope/vim-rails'},
  { 'tpope/vim-endwise'},
  { 'ngmy/vim-rubocop'}, -- Run rubocop on save
  { 'vim-test/vim-test'}, -- Run tests magically
  { 'noprompt/vim-yardoc'}, -- Highlight YARDoc comments

  -- { 'kana/vim-textobj-user'},
  -- { 'tek/vim-textobj-ruby'},

  -- Non-Ruby language support
  { 'fatih/vim-go'}, -- Golang support
  { 'sebdah/vim-delve'}, -- Delve debugger
  { 'hashivim/vim-terraform'},
  { 'skanehira/docker-compose.vim'},
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      -- { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
      -- { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      -- { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      -- {
      --   "<leader>ccT",
      --   "<cmd>CopilotChatVsplitToggle<cr>",
      --   desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      -- },
      -- {
      --   "<leader>ccv",
      --   ":CopilotChatVisual ",
      --   mode = "x",
      --   desc = "CopilotChat - Open in vertical split",
      -- },
      -- {
      --   "<leader>ccx",
      --   ":CopilotChatInPlace<cr>",
      --   mode = "x",
      --   desc = "CopilotChat - Run in-place code",
      -- },
      -- {
      --   "<leader>ccf",
      --   "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
      --   desc = "CopilotChat - Fix diagnostic",
      -- },
      -- {
      --   "<leader>ccr",
      --   "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
      --   desc = "CopilotChat - Reset chat history and clear buffer",
      -- }k,
    },
  },
})

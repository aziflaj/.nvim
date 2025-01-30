return require("packer").startup(function()
  use 'wbthomason/packer.nvim'

  use 'github/copilot.vim'
  use 'nvim-lua/plenary.nvim'
  use 'CopilotC-Nvim/CopilotChat.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'tree-sitter/tree-sitter-go', run = ':TSUpdate' }
  use 'RRethy/nvim-treesitter-endwise'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }, { 'kdheepak/lazygit.nvim' }},
    config = function()
      require('telescope').load_extension('lazygit')
      require('telescope').load_extension('fzf')
    end
  }
  -- use "folke/zen-mode.nvim"

  use 'wakatime/vim-wakatime'

  -- Tim Pope Certified Goodness
  use 'tpope/vim-sensible'
  use 'tpope/vim-fugitive' -- Git sorcery
  use 'tpope/vim-surround' -- cs<find><replace> to change surroundings of text
  use 'tpope/vim-commentary' -- gcc to comment out lines

  use 'lukas-reineke/indent-blankline.nvim'

  -- Statusline magic
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kyazdani42/nvim-web-devicons'

  use 'luochen1990/rainbow' -- colorise matching parentheses
  use 'lewis6991/gitsigns.nvim'
  use 'szw/vim-maximizer' -- C-w |, C-w _, C-w =
  use 'w0rp/ale' -- Async linter
  use 'numToStr/FTerm.nvim' -- Coolest floating terminal EVER

  use 'projekt0n/github-nvim-theme'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'sainnhe/edge'

  use 'pechorin/any-jump.vim' -- Magic Jump
  use 'danilamihailov/beacon.nvim'
  use 'rmagatti/auto-session'

  -- Ruby/Rails Plugins
  use 'tpope/vim-rails'
  use 'ngmy/vim-rubocop' -- Run rubocop on save
  use 'vim-test/vim-test' -- Run tests magically
  use 'noprompt/vim-yardoc' -- Highlight YARDoc comments

  use 'kana/vim-textobj-user'
  use 'tek/vim-textobj-ruby'

  -- Non-Ruby language support
  use 'fatih/vim-go' -- Golang support
  use 'sebdah/vim-delve' -- Delve debugger
  use 'hashivim/vim-terraform'
  use 'skanehira/docker-compose.vim'
  use { 'evanleck/vim-svelte', branch = 'main' }
end)

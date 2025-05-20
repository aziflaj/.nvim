local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

return require("pckr").add{
  'wbthomason/packer.nvim';

  'github/copilot.vim';
  'nvim-lua/plenary.nvim';
  'CopilotC-Nvim/CopilotChat.nvim';

  { 'VonHeikemen/lsp-zero.nvim',
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
  };

  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  { 'tree-sitter/tree-sitter-go', run = ':TSUpdate' };
  'RRethy/nvim-treesitter-endwise';
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };
  {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }, { 'kdheepak/lazygit.nvim' }},
    config = function()
      require('telescope').load_extension('lazygit')
      require('telescope').load_extension('fzf')
    end
  };
  -- "folke/zen-mode.nvim"

  'wakatime/vim-wakatime';

  -- Tim Pope Certified Goodness
  'tpope/vim-sensible';
  'tpope/vim-fugitive'; -- Git sorcery
  'tpope/vim-surround'; -- cs<find><replace> to change surroundings of text
  'tpope/vim-commentary'; -- gcc to comment out lines

  'lukas-reineke/indent-blankline.nvim';

  -- Statusline magic
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  };
  'kyazdani42/nvim-web-devicons';

  'luochen1990/rainbow'; -- colorise matching parentheses
  'lewis6991/gitsigns.nvim';
  'szw/vim-maximizer'; -- C-w |, C-w _, C-w =
  'w0rp/ale'; -- Async linter
  'numToStr/FTerm.nvim'; -- Coolest floating terminal EVER

  'projekt0n/github-nvim-theme';
  { "catppuccin/nvim", as = "catppuccin" };
  'sainnhe/edge';

  'pechorin/any-jump.vim'; -- Magic Jump
  'danilamihailov/beacon.nvim';
  'rmagatti/auto-session';

  -- Ruby/Rails Plugins
  'tpope/vim-rails';
  'ngmy/vim-rubocop'; -- Run rubocop on save
  'vim-test/vim-test'; -- Run tests magically
  'noprompt/vim-yardoc'; -- Highlight YARDoc comments

  'kana/vim-textobj-user';
  'tek/vim-textobj-ruby';

  -- Non-Ruby language support
  'fatih/vim-go'; -- Golang support
  'sebdah/vim-delve'; -- Delve debugger
  'hashivim/vim-terraform';
  'skanehira/docker-compose.vim';
  { 'evanleck/vim-svelte', branch = 'main' };


  -- Python/Django shit
  'tweekmonster/django-plus.vim';
}

-- Mah damn typos!
vim.cmd[[command! W write ++p]]
vim.cmd[[command! Wq wq ++p]]
vim.cmd[[command! Q quit]]
vim.cmd[[command! Qa qa]]
vim.cmd[[command! Wqa wqa]]

-- Light/Dark side for projekt0n/github-nvim-theme
-- vim.cmd[[command! LightSide :colorscheme github_light | :set background=light]]
-- vim.cmd[[command! DarkSide :colorscheme github_dark | :set background=dark | :hi Normal guibg=NONE ctermbg=NONE]]
--
-- Light/Dark side for edge theme
vim.g.edge_style = 'aura'
-- vim.g.edge_better_performance = 1
-- vim.g.edge_transparent_background = 1
-- vim.g.edge_dim_inactive_windows = 1
-- vim.g.edge_disable_terminal_colors = 1


-- vim.cmd[[colorscheme catppuccin-frappe]]
-- vim.cmd[[colorscheme github_dark]]
-- vim.cmd[[colorscheme github_light]]
vim.cmd[[colorscheme edge]]


vim.cmd[[cnoreabbrev gb Git blame]]

-- vim.cmd[[
--   autocmd BufRead,BufNewFile *.md set filetype=markdown
--   au BufRead,BufNewFile *.md setlocal textwidth=80
--   au BufRead,BufNewFile *.md setlocal wrap
-- ]]



vim.g.one_allow_italics = 1
vim.g.edge_enable_italic = true
-- Allow transparent background in terminal
-- vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]

vim.g.rainbow_active = true

-- Ale configs
-- Let Ale run only on file save
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
-- You can disable this option too
-- if you don't want linters to run on opening a file
vim.g.ale_lint_on_enter = 0

-- Run specs via this
vim.g.rspec_command = "!be rspec --drb {spec} -f progress"
vim.g.vimrubocop_rubocop_cmd = 'be rubocop'

-- indent
-- vim.g.indent_guides_start_level = 2
-- vim.g.indent_guides_enable_on_vim_startup = 1

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'ruby', 'typescript', 'vim', 'lua', 'bash' },
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
}

-- LazyGit configs
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.8 -- scaling factor for floating window

require'FTerm'.setup {
  border = 'double',
  dimensions = {
    height = 0.6,
    width = 0.6,
  }
}

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "vendor", ".git" },
  },
}

require("auto-session").setup {
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_root_dir = vim.fn.expand("$HOME").."/.config/nvim/sessions/",
}

require("CopilotChat").setup({
  auto_insert_mode = true,
  context = "buffers",
  mappings = {
    reset = {
      normal ='<C-r>',
      insert = '<C-r>'
    },
  },
})

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
})

-- LSP config for langs
local lspconfig = require('lspconfig')
lspconfig.solargraph.setup({})
lspconfig.gopls.setup({})

require('gitsigns').setup()

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

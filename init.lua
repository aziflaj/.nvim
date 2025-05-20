-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                        N E O V I M                         \/   `==
-- \   _-'                                                                `-_   /
--  `''                                                                      ``'

-- Disable mouse
vim.cmd[[set mouse=c]]

-- Enable plugins and load plugin for the detected file type.
vim.cmd[[filetype plugin on]]

-- Load an indent file for the detected file type.
vim.cmd[[filetype indent on]]

vim.opt.syntax = "on"

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = "tab:▸ ,trail:·,eol:¬,extends:❯,precedes:❮"
vim.opt.showbreak = "↪"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
-- vim.cmd[[autocmd FileType go setlocal shiftwidth=2]]
vim.opt.smarttab = true
vim.opt.termguicolors = true

-- require("lazy_plugins")
require("plugins")
require("mappings")
require("configs")
require("statusline")

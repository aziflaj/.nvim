function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- Remap arrow keys to NOTHING
nmap("<Up>", "<NOP>")
nmap("<Down>", "<NOP>")
nmap("<Left>", "<NOP>")
nmap("<Right>", "<NOP>")

tmap("<Esc>", "<C-\\><C-n>")

-- Close all opened files
nmap("<Leader>q", ":%bw<CR>")
-- nmap("<Leader>q", ":bufdo bd<CR> :intro<CR>")

-- Easier window navigation
nmap("<C-h>", ":wincmd h<CR>")
nmap("<C-j>", ":wincmd j<CR>")
nmap("<C-k>", ":wincmd k<CR>")
nmap("<C-l>", ":wincmd l<CR>")
nmap("<C-v>", ":wincmd v<CR>") -- use C-q for visual block mode
nmap("<C-s>", ":wincmd s<CR>")

-- Undo
nmap("U", "<C-R>")

-- ESC when ESC is too far
imap("jk", "<Esc>")

-- Space is leader
nmap("<Space>", "<NOP>")
vim.api.nvim_set_keymap("", "<Space>", "<Leader>", { silent = true })

nmap("<C-p>", ":Telescope find_files<CR>")
nmap("<C-f>", ":Telescope live_grep<CR>")
nmap("<Leader>b", ":Telescope buffers<CR>")

nmap("<Leader>g", ":LazyGit<CR>")
-- Testing made easy
nmap("<Leader>t", ":TestFile<CR>")
nmap("<Leader>s", ":TestNearest<CR>")
nmap("<Leader>l", ":TestLast<CR>")
nmap("<Leader>a", ":TestSuite<CR>")

-- fold and unfold
nmap("<C-]>", ":set foldmethod=syntax<CR>")
nmap("<C-[>", ":set foldmethod=marker<CR>")

nmap('<Leader>e', ':lua require("FTerm").toggle()<CR>')
tmap('<Leader>e', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>')

-- CopilotChat
-- nmap('<M-Space>', ':CopilotChatInPlace<CR>')
-- nmap('<A-Space>', ':CopilotChatInPlace<CR>')


-- local keyset = vim.keymap.set
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion.
--let g:onedark_config = { 'style': 'dark' } keyset("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

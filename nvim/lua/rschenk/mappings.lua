-- Helper function to more quickly declare keymaps
local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

no_remap = { noremap = true }

-- Switch between the last two files
map('n', '<leader><leader>', '<c-^>', no_remap)

-- Faster movement between splits
map('n', '<C-j>', '<C-w>j', no_remap)
map('n', '<C-k>', '<C-w>k', no_remap)
map('n', '<C-h>', '<C-w>h', no_remap)
map('n', '<C-l>', '<C-w>l', no_remap)
map('n', '<A-j>', '<C-w>j', no_remap)
map('n', '<A-k>', '<C-w>k', no_remap)
map('n', '<A-h>', '<C-w>h', no_remap)
map('n', '<A-l>', '<C-w>l', no_remap)

-- Terminal mode
map('t', '<Esc>', '<C-\\><C-n>', no_remap) -- Esc goes to normal mode from terminal
map('t', '<A-[>', '<Esc>', no_remap) -- Send an Esc to the terminal
-- Faster window switching in Terminal mode
map('t', '<A-h>', '<c-\\><c-n><c-w>h', no_remap)
map('t', '<A-j>', '<c-\\><c-n><c-w>j', no_remap)
map('t', '<A-k>', '<c-\\><c-n><c-w>k', no_remap)
map('t', '<A-l>', '<c-\\><c-n><c-w>l', no_remap)


-- Copy and paste to system clipboard
map('v', '<Leader>y', '"+y', no_remap) -- Works on visual selections
map('v', '<Leader>d', '"+d', no_remap)
map('n', '<Leader>P', '"+P', no_remap)
map('n', '<Leader>p', '"+p', no_remap)
map('v', '<Leader>p', '"+p', no_remap)
map('v', '<Leader>P', '"+P', no_remap)

-- Clear search highlight by pressing enter
map('n', '<CR>', ':noh<CR><CR>', no_remap)

-- Code navigation with LSP
-- map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', no_remap)
-- map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', no_remap)
-- map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', no_remap)
-- map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', no_remap)
-- map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', no_remap)
-- map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', no_remap)
-- map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', no_remap)
-- map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', no_remap)
-- map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>', no_remap)
-- map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>', no_remap)
-- map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', no_remap)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', no_remap)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', no_remap)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', no_remap)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', no_remap)

-- Testing
map('n', '<Leader>r', ':TestFile<CR>', { noremap = true, silent = true })
map('n', '<Leader>R', ':TestNearest<CR>', { noremap = true, silent = true })
map('n', '<Leader>l', ':TestLast<CR>', { noremap = true, silent = true })
map('n', '<Leader>a', ':TestSuite<CR>', { noremap = true, silent = true })
map('n', '<Leader>gt', ':TestVisit<CR>', { noremap = true, silent = true })

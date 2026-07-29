vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Keep cursor away from screen edges
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "popup" }

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Persistent undo across sessions
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits open below/right instead of above/left
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Faster CursorHold events (affects diagnostics, LSP-related UI)
vim.opt.updatetime = 250

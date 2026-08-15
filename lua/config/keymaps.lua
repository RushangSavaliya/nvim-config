local map = vim.keymap.set
local terminal = require("config.terminal")

-- Better defaults -----------------------------------------------------
map("n", "Y", "y$", { desc = "Yank to end of line" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })
map("n", "*", "*zz", { desc = "Search word under cursor" })
map("n", "#", "#zz", { desc = "Search word under cursor backwards" })

-- Insert mode: fast escape
map("i", "jj", "<Esc>", { desc = "Escape insert mode" })
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Move selections up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Window management
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wq", "<cmd>close<cr>", { desc = "Close window" })
map("n", "<leader>w=", "<cmd>wincmd =<cr>", { desc = "Equalize window sizes" })

-- Buffer navigation
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Search
map("n", "<leader>hh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Quickfix
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous quickfix entry" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix entry" })

-- Find
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Grep Word Under Cursor" })
map("v", "<leader>fW", "<cmd>FzfLua grep_visual<cr>", { desc = "Grep Visual Selection" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })

-- Terminal
map("n", "<leader>tt", terminal.toggle_split, { desc = "Toggle Terminal (split)" })
map("n", "<leader>tf", terminal.toggle_float, { desc = "Toggle Terminal (float)" })

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

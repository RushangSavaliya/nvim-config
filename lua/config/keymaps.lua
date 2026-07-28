local map = vim.keymap.set

map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Find
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })

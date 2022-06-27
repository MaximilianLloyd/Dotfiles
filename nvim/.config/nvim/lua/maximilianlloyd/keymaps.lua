local map = vim.keymap.set
local tspbuiltin = require "telescope.builtin"
local gitsigns = require "gitsigns"
local file_browser = require "telescope".extensions.file_browser.file_browser
local mark = require "harpoon.mark"
local silentOptions = { noremap = true, silent = true }

-- vim.g.mapleader = " "

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-Up>", "<cmd>resize -2<CR>", silentOptions)
map("n", "<C-Down>", "<cmd>resize +2<CR>", silentOptions)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", silentOptions)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", silentOptions)

-- TELESCOPE --
map("n", "<C-p>", tspbuiltin.git_files, silentOptions)
-- map("n", "<leader>b", tspbuiltin.buffers, silentOptions)
map("n", "<leader>fg", tspbuiltin.live_grep, silentOptions)
map("n", "<leader>fb", file_browser, silentOptions)
map("n", "<leader>ts", tspbuiltin.treesitter, silentOptions)
map("n", "<leader>ht", tspbuiltin.help_tags, silentOptions)
map("n", "<leader>m", tspbuiltin.marks, silentOptions)

-- Telescope oneshop jobs prefixed with t
map("n", "<leader>ti", "<cmd>Telescope media_files<CR>", silentOptions)
map("n", "<leader>tc", "<cmd>Telescope cheat fd<CR>", silentOptions)
map("n", "<leader>tn", "<cmd>Telescope notify<CR>", silentOptions)

map("n", "<leader>ha", mark.add_file, silentOptions)
map("n", "<leader>hm", "<cmd>Telescope harpoon marks<CR>", silentOptions)

map("n", "<C-s>", "<cmd>update<CR>", silentOptions)
map("i", "<C-s>", "<ESC> :update<CR>", silentOptions)

map("n", "<leader><CR>", "<cmd>source ~/.config/nvim/init.lua<CR>",{ noremap = true, silent = false })

map("i", "<C-a>", "copilot#Accept()", { expr = true, noremap = true, silent = true })

map("n", "<leader>ss", "<cmd>SessionSave<CR>", silentOptions)
map("n", "<leader>q", "<cmd>copen<CR>", silentOptions)


map("n", "<leader>q", "<cmd>copen<CR>", silentOptions)
map("n", "<C-h>", "<cmd>cprev<CR>", silentOptions)
map("n", "<C-l>", "<cmd>cnext<CR>", silentOptions)

map("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", silentOptions)
map("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", silentOptions)
map("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", silentOptions)
map("n", "<leader>tr", "<cmd>tabnew<CR>", silentOptions)

map({ "n", "v" }, "<leader>y", '"+y', { silent = false })

map("n", "<leader>j", "<cmd>lnext<CR>", { silent = false })
map("n", "<leader>k", "<cmd>lprev<CR>", { silent = false })
map("n", "<leader>sl", vim.diagnostic.setloclist, { silent = false })
map("n", "<leader>lq", "<cmd>lclose<CR>", { silent = false })
-- Add two numbers together

map("n", "Y", "y$", { noremap = true, silent = true })

-- Git signs
map("n", "<leader>gb", tspbuiltin.git_branches, silentOptions)
map("n", "<leader>td", gitsigns.toggle_deleted, silentOptions)
map("n", "<leader>gd", gitsigns.diffthis, silentOptions)

map("n", "gb", "<cmd>BufferPick<CR>", silentOptions)

map("n", "<leader>fr", ":%s/", { noremap = true, silent = false })
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", { noremap = true, silent = false })

map("i", ",", ",<c-g>u", { noremap = true, silent = true })
map("i", ".", ".<c-g>u", { noremap = true, silent = true })
map("i", "!", "!<c-g>u", { noremap = true, silent = true })
map("i", "?", "?<c-g>u", { noremap = true, silent = true })

-- Dap
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F6>", ":lua require'dap'.step_over()<CR>")
map("n", "<F7>", ":lua require'dap'.step_into()<CR>")
map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point condition: '))<CR>")
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
map("n", "<leader>du", ":lua require'dapui'.open()<CR>")

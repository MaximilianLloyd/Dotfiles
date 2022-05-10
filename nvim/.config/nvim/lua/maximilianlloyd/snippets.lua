if vim.g.snippets == "luasnip" then
    return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } }
            }
        }
    }
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Jump back
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- Source luasnips file
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/maximilianlloyd/luasnip.lua<CR>")


require("luasnip.loaders.from_vscode").lazy_load()

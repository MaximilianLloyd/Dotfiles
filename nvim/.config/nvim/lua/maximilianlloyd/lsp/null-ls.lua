local null_ls = require("null-ls")

-- register any number of sources simultaneously
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.prettier.with({
            extra_filetypes = { "html" },
    }),
    formatting.stylua,
    formatting.stylelint,
    diagnostics.write_good,
    diagnostics.stylelint,
    -- null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ debug = false, sources = sources })

local lspconfig = require("lspconfig")

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local function lsp_highlight_document(client) -- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
		autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local on_attach = function(client, bufnr)
	-- This is to disable default formatting, so that null-ls works.
	if client.name == "tsserver" or client.name == "jsonls" then
		client.server_capabilities.document_formatting = false
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = false }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>dh", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<space>dl", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	lsp_highlight_document(client)
end

local servers = {
	"jsonls",
	"eslint",
	"angularls",
	"vimls",
	"sumneko_lua",
	"tsserver",
	"gopls",
	"bashls",
	"clangd",
	"svelte",
	"vls",
	"cssls",
    "yamlls"
}

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
	local server = lspconfig[server_name]

	local initial_capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("cmp_nvim_lsp").update_capabilities(initial_capabilities)

	local opts = {}

	if server_name == "sumneko_lua" then
		opts = require("lua-dev").setup({
			on_attach = on_attach,
		})
	else
		opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end

	server.setup(opts)

	-- server:on_ready(function()
	-- 	local opts = {
	-- 		on_attach = on_attach,
	-- 		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	-- 	}

	-- 	if server_name == "sumneko_lua" then
	-- 		opts = require("lua-dev").setup({
	-- 			on_attach = on_attach,
	-- 		})
	-- 	end

	-- 	if server.name == "jsonls" then
	-- 		local jsonls_opts = require("maximilianlloyd.lsp.settings.jsonls")
	-- 		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- 	end

	-- 	server:setup(opts)
	-- end)
end

-- require("symbols-outline").setup(opts)
require("luasnip/loaders/from_vscode").load()

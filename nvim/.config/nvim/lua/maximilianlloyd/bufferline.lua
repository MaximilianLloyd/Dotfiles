vim.opt.termguicolors = true

require("bufferline").setup({
	options = {
		-- indicator_icon          = "▼",
		numbers = "none",
		show_close_icon = false,
		show_buffer_close_icons = false,
		show_buffer_icons = true,
		separator_style = "thin",
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostics = "nvim_lsp",
		max_name_length = 30,
		max_prefix_length = 30,
		tab_size = 21,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_tab_indicaors = true,
		enforce_regular_tabs = true,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		groups = {
			options = {
				toggle_hidden_on_enter = true,
			},
			name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
				-- remove extension from markdown files for example
				if buf.name:match("%.md") then
					return vim.fn.fnamemodify(buf.name, ":t:r")
				end
			end,
			items = {
				{
					name = "Docs",
					highlight = { gui = "undercurl", guisp = "green" },
					auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
					matcher = function(buf)
						return buf.filename:match("%.md") or buf.filename:match("%.txt")
					end,
					-- separator = { -- Optional
					--     style = require('bufferline.groups').separator.tab
					-- },
				},
			},
		},
	},
})

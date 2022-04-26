local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Error with telescope")
	return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions
local sorters = require("telescope.sorters")

telescope.setup({
	defaults = {
		color_devicons = true,
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		file_ignore_patterns = { "node_modules/", "package-lock.json", "yarn.lock" },
		prompt_prefix = " λ ",
		selection_caret = " > ",
		winblend = 0,
		layout_strategy = "horizontal",

		mappings = {
			i = {
				["<C-x>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist,
				["<C-s>"] = actions.select_horizontal,
				["<M-p>"] = action_layout.toggle_preview,
				["<C-t>"] = actions.select_tab,
				["<CR>"] = actions.select_default,
				["<C-k>"] = actions.cycle_history_next,
				["<C-j>"] = actions.cycle_history_prev,
				["<c-g>s"] = actions.select_all,
				["<c-g>a"] = actions.add_selection,
				["<M-q>"] = actions.send_selected_to_qflist,
				["<C-w>"] = function()
					vim.api.nvim_input("<c-s-w>")
				end,
			},
		},
		layout_config = {
			width = 0.95,
			height = 0.85,
			-- preview_cutoff = 120,
			prompt_position = "top",

			horizontal = {
				preview_width = function(_, cols, _)
					if cols > 200 then
						return math.floor(cols * 0.4)
					else
						return math.floor(cols * 0.6)
					end
				end,
			},

			vertical = {
				width = 0.9,
				height = 0.95,
				preview_height = 0.5,
			},

			flex = {
				horizontal = {
					preview_width = 0.9,
				},
			},
		},
	},
	pickers = {
		code_action = {
			theme = "cursor",
		},
	},
	extensions = {
		["zf-native"] = {
			file = {
				enable = true,
				highlight_results = true,
				match_filename = true,
			},
			generic = {
				enable = true,
				highlight_results = true,
				match_filename = false,
			},
		},
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
			theme = "ivy",
			mappings = {
				["i"] = {
					["<esc>"] = actions.close,
					["<C-c>"] = fb_actions.create,
					["<C-y>"] = fb_actions.copy,
					["<C-r>"] = fb_actions.rename,
					["<C-d>"] = fb_actions.remove,
				},
			},
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})

telescope.load_extension("zf-native")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")
telescope.load_extension("ui-select")
telescope.load_extension("notify")
telescope.load_extension("cheat")

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Error with telescope")
	return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		color_devicons = true,
		-- layout_strategy = "vertical",
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		file_ignore_patterns = { "node_modules/", "package-lock.json", "yarn.lock" },
		prompt_prefix = " λ ",
		selection_caret = " > ",
		winblend = 0,
		layout_strategy = "flex",

		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-t>"] = actions.select_tab,
				["<CR>"] = actions.select_default,
			},
		},
	},
	pickers = {
		code_action = {
			theme = "cursor",
		},
		git_files = {
			theme = "ivy",
		},
	},
	extensions = {
		["zf-native"] = {
			-- options for sorting file-like items
			file = {
				-- override default telescope file sorter
				enable = true,

				-- highlight matching text in results
				highlight_results = true,

				-- enable zf filename match priority
				match_filename = true,
			},

			-- options for sorting all other items
			generic = {
				-- override default telescope generic item sorter
				enable = true,

				-- highlight matching text in results
				highlight_results = true,

				-- disable zf filename match priority
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

-- telescope.load_extension("fzy_native")
telescope.load_extension("zf-native")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")
-- telescope.load_extension('harpoon')

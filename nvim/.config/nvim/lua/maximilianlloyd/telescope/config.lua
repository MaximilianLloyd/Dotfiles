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
	},
	extensions = {
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
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
	},
})

telescope.load_extension("fzy_native")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")



local search_wallpapers = function()
  telescope.extensions.media_files.media_files({
	cwd = "~/backgrounds",
	attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()

        actions.close(prompt_bufnr)
      end)
      return true
    end,
  })
end

vim.keymap.set("n", "<leader><leader>w", search_wallpapers, { silent = true });
-- telescope.load_extension('harpoon')

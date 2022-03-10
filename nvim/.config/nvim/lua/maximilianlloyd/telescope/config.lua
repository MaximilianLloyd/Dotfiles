local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("Error with telescope")
  return
end

local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup{
  defaults = {
      color_devicons = true,
      prompt_prefix = ' >',
      -- layout_strategy = "vertical",
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      file_ignore_patterns = {'node_modules/', 'package-lock.json', 'yarn.lock'},

      mappings = {
        i = {
            ["<esc>"] = actions.close,
            ["<C-q>"] = actions.send_to_qflist,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-t>"] = actions.select_tab,
            ["<CR>"] = actions.select_default
        },
    },
  },
  pickers = {
      code_action = {
        theme = "cursor"
      }
  },
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
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
  },
}


telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')
-- telescope.load_extension('harpoon')

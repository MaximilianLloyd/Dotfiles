local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local themes = require "telescope.themes"
local builtin = require "telescope.builtin"
local previewers = require 'telescope.previewers'
local action_state = require "telescope.actions.state"
local conf = require("telescope.config").values

local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Dotfiles",
    previewer = previewers.cat,
    finder = finders.new_table {
        results = {
          { "red", "#ff0000" },
          { "green", "#00ff00" },
          { "blue", "#0000ff" },
        },
        entry_maker = function(entry)
            return {
                value = entry,
                display = entry[1],
                ordinal = entry[1],
            }
        end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        vim.api.nvim_put({ selection[1] }, "", false, true)
        -- vim.api.
      end)
      return true
    end,

  }):find()
end
-- to execute the function
-- colors(require("telescope.themes").get_dropdown{})
function SearchDotfiles()
    builtin.find_files({
        prompt_title = "Dotfiles",
        theme = themes.get_dropdown{},
        cwd = "~/.config",
        search_dirs = { "bspwm", "nvim", "polybar", "sxhkd" }
    })
end

vim.keymap.set("n", "<leader><leader>d", SearchDotfiles, { silent = true });

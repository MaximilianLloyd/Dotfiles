local curl = require 'plenary.curl'
-- json = require 'plenary.json'


vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_custom_header = {
	[[                                                     ]],
	[[                                                     ]],
	[[                                                     ]],
	[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
	[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
	[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
	[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
	[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
	[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
	[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
	[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
	[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
	[[                                 ░                   ]],
	[[                                                     ]],
	[[                                                     ]],
}
vim.g.dashboard_custom_section = {
	a = { description = { "  New File                          " }, command = "DashboardNewFile" },
	b = { description = { "  Find Files                 CTRL P " }, command = "Telescope find_files" },
	c = { description = { "ﮦ  Restore previous session   SPC S L" }, command = "SessionLoad" },
	-- d = { description = { " History                    " }, command = "DashboardFindHistory" },
	d = { description = { "  Colorscheme                       " }, command = "Telescope colorscheme" },
	e = { description = { "  Dotfiles                 SPC SPC D" }, command = SearchDotfiles  },
}
-- local response = curl.request({ 
--     url = 'https://dad-jokes.p.rapidapi.com/random/joke',
--     headers = {
--        ['X-RapidAPI-Host'] = 'dad-jokes.p.rapidapi.com',
--         ['X-RapidAPI-Key'] = '04052e7fcbmshf4ed99e8b350374p189c78jsnb8ffe083d20a',
--     },
-- })
-- local parsedbody = vim.fn.json_decode(response.body)
-- local joke = parsedbody.body[1]
vim.g.dashboard_custom_footer = {
  "Crush it"
}

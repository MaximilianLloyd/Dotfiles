local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("nvim-lua/plenary.nvim")
	use("editorconfig/editorconfig-vim")
	-- using packer.nvim
	-- use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("ggandor/lightspeed.nvim")
	-- use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }
	use({ "fatih/vim-go" })
	use({ "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" })

	use("folke/lua-dev.nvim")
	use("andweeb/presence.nvim")
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
	})
	use("nvim-telescope/telescope-cheat.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-lua/popup.nvim",
			"natecraddock/telescope-zf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"tami5/sqlite.lua",
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")

	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use({ "tjdevries/express_line.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("kyazdani42/nvim-web-devicons")

	use("github/copilot.vim")
	use("rust-lang/rust.vim")
	use("ryanoasis/vim-devicons")

	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/cmp-nvim-lua")
	use("tamago324/nlsp-settings.nvim")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "tamago324/nlsp-settings.nvim" } })

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
		},
	})

	use("onsails/lspkind-nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Themes
	use("ayu-theme/ayu-vim")
	use("gruvbox-community/gruvbox")
	use("marko-cerovac/material.nvim")
	use("AlessandroYorba/Sierra")
	use("sjl/badwolf")
	use("tomasr/molokai")
	use("shaunsingh/moonlight.nvim")

	use({ "glepnir/dashboard-nvim", requires = {
		"nvim-lua/plenary.nvim",
	} })
	use("folke/which-key.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/nvim-treesitter-angular",
		},
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
	use("fladson/vim-kitty")

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("rcarriga/nvim-notify")
	use("jubnzv/virtual-types.nvim")
	use({ "kevinhwang91/nvim-bqf", ft = "qf", requires = { "junegunn/fzf" } })
	use("akinsho/toggleterm.nvim")
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		tag = "v1.*",
		config = function()
			vim.cmd([[
			colorscheme rose-pine
			set laststatus=3
			]])
		end,
	})

	-- use "/Users/maximilianlloyd/development/Plugins/mivi.nvim"
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

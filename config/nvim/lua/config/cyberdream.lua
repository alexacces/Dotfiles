require("cyberdream").setup({
			variant = "auto",
			transparent = true,
			italic_comments = true,
			hide_fillchars = true,
			terminal_colors = false,
			cache = true,
			borderless_pickers = false,
			extensions = {
				dashboard = true,
				blinkcmp = true,
				gitsigns = true,
				markdown = true,
				noice = true,
				notify = true,
				fzflua = true,
				snacks = true,
				treesitter = true,
				treesittercontext = true,
				indentblankline = true,
				mini = true,
			},
		})
vim.cmd("colorscheme cyberdream")

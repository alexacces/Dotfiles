require("blink.cmp").setup({
    signature = { enabled = true },
	completion = {
		documentation = { window = {border = "rounded"},auto_show = true, auto_show_delay_ms = 500 },
		menu = {
            border = "rounded",
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
    appearance = {
  highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
  -- Sets the fallback highlight groups to nvim-cmp's highlight groups
  -- Useful for when your theme doesn't support blink.cmp
  -- Will be removed in a future release
  use_nvim_cmp_as_default = false,
  -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  -- Adjusts spacing to ensure icons are aligned
  nerd_font_variant = 'mono',
  kind_icons = {
    Text = '󰉿',
    Method = '󰊕',
    Function = '󰊕',
    Constructor = '󰒓',

    Field = '󰜢',
    Variable = '󰆦',
    Property = '󰖷',

    Class = '󱡠',
    Interface = '󱡠',
    Struct = '󱡠',
    Module = '󰅩',

    Unit = '󰪚',
    Value = '󰦨',
    Enum = '󰦨',
    EnumMember = '󰦨',

    Keyword = '󰻾',
    Constant = '󰏿',

    Snippet = '󱄽',
    Color = '󰏘',
    File = '󰈔',
    Reference = '󰬲',
    Folder = '󰉋',
    Event = '󱐋',
    Operator = '󰪚',
    TypeParameter = '󰬛',
  },
}
})

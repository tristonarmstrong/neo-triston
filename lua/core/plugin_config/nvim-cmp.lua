return {
  "hrsh7th/nvim-cmp",
	event="InsertEnter",
	dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		vim.opt.completeopt="menu,menuone,noselect"
		cmp.setup({
			snippet = {
				expand = function()
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<tab>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({select=false})
			}),
			sources = cmp.config.sources({
				{name="nvim_lsp"},
				{name="luasnip"},
				{name="buffer"},
				{name="path"},
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "..."
				})
			}

		})
	end
 }
 

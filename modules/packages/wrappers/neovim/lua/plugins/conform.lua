require("conform").setup({
	default_format_opts = {
		lsp_format = "fallback", -- use LSP format if no formatter is configured
	},
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		nix = { "nixfmt" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		typst = { "typstyle" },
	},
})

-- Format with conform (prefer this over raw vim.lsp.buf.format)
vim.keymap.set({ "n", "v" }, "<leader>F", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

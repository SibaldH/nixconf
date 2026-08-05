-- Keymaps when a client attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
	callback = function(ev)
		local bufnr = ev.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "LSP definition")
		map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
		map("n", "gr", vim.lsp.buf.references, "LSP references")
		map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
		map("n", "K", vim.lsp.buf.hover, "LSP hover")
		map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
	end,
})

-- Optional defaults for every server
vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Per-server settings (configs still come from nvim-lspconfig's lsp/ dir)
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

-- Enable: activates for the server's filetypes
for _, name in ipairs({
	"rust_analyzer",
	"nixd",
	"lua_ls",
	"html",
	"cssls",
	"jsonls",
	"ts_ls",
}) do
	vim.lsp.enable(name)
end

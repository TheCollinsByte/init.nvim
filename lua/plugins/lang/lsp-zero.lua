local status_ok, lsp_zero = pcall(require, 'lsp-zero')
if not status_ok then
	return
end

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)


require('mason').setup({})
require('mason-lspconfig').setup({
		ensure_installed = {
				'tsserver', 'gopls', 'jdtls', 'rust_analyzer', 'dartls', 'lua_ls'
		},
		handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						local custom_options = {
								enable = true,
								defaultConfig = {
										align_continuous_assign_statement = false,
										align_continuous_rect_table_field = false,
										align_array_table = false
								}
						}
						lua_opts.settings.Lua.format = custom_options
						require('lspconfig').lua_ls.setup(lua_opts)
						require('lspconfig').gopls.setup({
								on_attach = function ()
										capabilities = capabilities
										vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0}) 			-- 0 means whenver the current buffer is
										vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
										vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
										vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
										-- vim.keymap.set("n", "gr", vim.lsp.buf.reference, {buffer = 0})			-- goto reference
										vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0})
										vim.keymap.set("n", "<leader>db", vim.diagnostic.goto_prev, {buffer = 0})
										vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
										vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0}) 		-- run :wa for Write All because it changed it in another buffer
										vim.keymap.set("n", "<leader>i", vim.lsp.buf.code_action, {buffer = 0}) 		-- run :wa for Write All because it changed it in another buffer
										-- Telescope lsp_references
								end
						})
				vim.diagnostic.config({
						update_in_insert = true,
						float = {
								focusable = false,
								style = "minimal",
								border = "rounded",
								source = "always",
								header = "",
								prefix = "",
						},
				})
		end,
		},
})


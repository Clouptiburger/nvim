local M = {
	"neovim/nvim-lspconfig",
	-- event = "BufReadPre",
	enabled = true,
	dependencies = {
		-- LSP Support
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim" },

		-- -- Autocompletion
		{ "saghen/blink.cmp" },

		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
	},
}

function M.config()
	local servers = {
		-- clangd = {},
		gopls = {},
		-- rust_analyzer = {},
		ts_ls = {},
		html = {
			css = { lint = { validProperties = {} } },
			html = { suggest = { html5 = true } },
			htmlhint = { enable = true },
			filetypes = { "html", "twig", "hbs" },
		},

		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				hint = { enable = true },
			},
		},
	}

	local on_attach = function(_, bufnr)
		-- NOTE: Remember that lua is a real programming language, and as such it is possible
		-- to define small helper and utility functions so you don't have to repeat yourself
		-- many times.
		--
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		local imap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("i", keys, func, { buffer = bufnr, desc = desc })
		end

		-- nmap('<leader>fr', vim.lsp.buf.format, '[F]o[n]mat')
		nmap("<M-C-L>", vim.lsp.buf.format, "[F]o[n]mat")
		nmap("<S-M-F>", vim.lsp.buf.format, "[F]o[n]mat")
		nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		nmap("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		nmap("<leader>ci", require("telescope.builtin").lsp_incoming_calls, "[C]alls [I]incoming")
		nmap("<leader>co", require("telescope.builtin").lsp_outgoing_calls, "[C]alls [O]utgoing")

		nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclartion")
		nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		nmap("gT", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype definitions")
		nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
		nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- See `:help K` for why this keymap
		imap("<C-h>", vim.lsp.buf.signature_help, "Signature Documentation")

		-- Lesser used LSP functionality
		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
		nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
		nmap("<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "[W]orkspace [L]ist Folders")

		-- Create a command `:Format` local to the LSP buffer
		vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
			vim.lsp.buf.format()
		end, { desc = "Format current buffer with LSP" })

		-- toggles inlay hints
		if vim.lsp.inlay_hint then
			nmap("<leader>ih", function()
				vim.lsp.inlay_hint(0, nil)
			end, "[I]nlay [H]ints")
		end
	end
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	-- Ensure the servers above are installed
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			})
		end,
	})
end

return M

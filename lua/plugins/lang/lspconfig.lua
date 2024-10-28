local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')
local icons = require('lib.icons').diagnostics

local opts = { noremap = true, silent = true }
local keymap = vim.keymap;
local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    -- set keybinds
    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)        -- Show definition, references

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", "vim.lsp.buf.declaration", opts)  -- go to declaration

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmdD>Telescope lsp_definitions<CR>", opts)      -- show lsp definitions

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)   -- Show lsp implementation

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)  -- Show lsp type definitions

    opts.desc = "See available code actions"
    keymap.set({"n", "v"}, "<leader>ca", keymap.lsp.buf.code_action, opts)  -- see available code actions, in visual mode will apply

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", keymap.lsp.buf.rename, opts)      -- smart rename

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)    -- Show diagnostics for file

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", keymap.diagnostic.open_float, opts)        -- Show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", keymap.diagnostic.goto_prev, opts)        -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", keymap.diagnostic.goto_next, opts)        -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", keymap.lsp.buf.hover, opts)        -- show ducumentation for what is under cursor

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)      -- mapping to restart lsp if necessary
end


local installed_servers = {
    'gopls',                -- GoLang Langugae Server
    'rust_analyzer',        -- Rust Langugae Server
    'jdtls',                -- Java Langugae Server
    'ts_ls',                -- Typescript Langugae Server
    'lua_ls',               -- Lua Language Server
    'pyright',              -- Python Language Server
    'clangd',               -- C/C++ Language Server
    'sqls',                 -- SQL Language Server
    'efm',                  -- Efm Language Server (Error Format Manager, Generalized LSP Server)

    -- Web Development
    'html',                 -- HTML Language Server
    'cssls',                -- CSS Language Server
    'tailwindcss',          -- Taiwind Language Server
    'graphql',              -- Graphql Language Server
    'emmet_ls',              -- Emmet Language Server
}

local lsp_capabilities = cmp_lsp.default_capabilities()
local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
        on_attach = on_attach,
    })
end

local signs = { Error = icons.Error, Warn = icons.Warning, Hint = icons.Hint, Info = icons.Information }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

require('mason-lspconfig').setup({
    ensure_installed = installed_servers,
    handlers = {
        default_setup,
        lspconfig.dartls.setup({
            cmd = { 'dart', 'language-server', '--protocol=lsp' },
            filetypes = { 'dart' },
            init_options = {
              onlyAnalyzeProjectsWithOpenFiles = true,
              suggestFromUnimportedLibraries = true,
              closingLabels = true,
              outline = true,
              flutterOutline = true,
            },
            settings = {
              dart = {
                completeFunctionCalls = true,
                showTodos = true,
              },
            },
        }),
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_continuous_assign_statement = false,
                                align_continuous_rect_table_field = false,
                                align_array_table = false,
                            },
                        },
                    },
                },
            })
        end,
    },
})

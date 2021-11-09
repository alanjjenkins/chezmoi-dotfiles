-- vim: set foldmethod=marker foldlevel=0:
local haslspconfig, lspconfig = pcall(require, "lspconfig")
if not haslspconfig then
        return
end

local haslspcontainers, lspcontainers = pcall(require, "lspcontainers")
local c = require("modules.completion.lsp.custom")

-- {{{ CSS
lspconfig.cssls.setup(c.default({
    cmd = { "css-languageserver", "--stdio" },
    root_dir = c.custom_cwd,
}))
-- }}}

-- {{{ Go
lspconfig.gopls.setup(c.default({
    cmd = { "gopls", "serve" },
    root_dir = c.custom_cwd,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            usePlaceholders = false,
        },
    },
}))
-- }}}
--
-- {{{ JSON
lspconfig.jsonls.setup(c.default({
    cmd = { "vscode-json-languageserver", "--stdio" },
    root_dir = c.custom_cwd,
}))
-- }}}

-- {{{ Lua
local lua_lsp_cmd = nil

if vim.fn.executable("lua-language-server") ~= 0 then
        lua_lsp_cmd = { 
                "lua-language-server",
                string.format("--logpath=%s/.cache/nvim/sumneko_lua",
                vim.loop.os_homedir())
        }
elseif haslspcontainers and vim.fn.executable("podman") == 1 then
        lua_lsp_cmd = lspcontainers.command(
                'sumneko_lua',
                {
                        container_runtime = "podman",
                }
        )
elseif haslspcontainers and vim.fn.executable("docker") == 1 then
        lua_lsp_cmd = lspcontainers.command('sumneko_lua')
end

if lua_lsp_cmd ~= nil then
        lspconfig.sumneko_lua.setup(c.default({
                cmd = lua_lsp_cmd,
                root_dir = c.custom_cwd,
                settings = {
                        Lua = {
                                runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
                                telemetry = {
                                        enable = false,
                                },
                                diagnostics = {
                                        enable = true,
                                        globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
                                },
                                workspace = {
                                        library = {
                                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                                ["/usr/share/awesome/lib"] = true,
                                                ["/usr/share/lua/5.1"] = true,
                                                ["/usr/share/lua/5.3"] = true,
                                                ["/usr/share/lua/5.4"] = true,
                                        },
                                },
                        },
                },
        }))
end
-- }}}

-- {{{ Python - Jedi
-- lspconfig.jedi_language_server.setup(c.default({
--     settings = {
--         jedi = {
--             enable = true,
--             startupMessage = true,
--             markupKindPreferred = "markdown",
--             jediSettings = {
--                 autoImportModules = {},
--                 completion = { disableSnippets = false },
--                 diagnostics = { enable = true, didOpen = true, didSave = true, didChange = true },
--             },
--             workspace = { extraPaths = {} },
--         },
--     },
-- }))
-- }}}

-- {{{ Python - Pyright
lspconfig.pyright.setup(c.default({
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = false,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
            },
        },
    },
}))
-- }}}

-- {{{ SQL
lspconfig.sqls.setup({
    cmd = { "sqls", "-config", vim.loop.os_homedir() .. "/.config/sqls/config.yml" },
    on_init = c.custom_on_init,
    capabilities = c.custom_capabilities(),
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true
        require("sqls").setup({ picker = "default" })
    end,
})
-- }}}

-- {{{ Typescript
lspconfig.tsserver.setup(c.default({
    root_dir = c.custom_cwd,
    settings = {
        tsserver = {
            useBatchedBufferSync = true,
        },
        javascript = {
            autoClosingTags = true,
            suggest = {
                autoImports = true,
            },
            updateImportsOnFileMove = {
                enable = true,
            },
            suggestionActions = {
                enabled = false,
            },
        },
    },
}))
-- }}}

-- {{{ YAML
lspconfig.yamlls.setup(c.default({
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
            },
            editor = {
                tabSize = 2,
            },
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
            },
        },
    },
}))
-- }}}

local servers = { "dockerls", "clangd", "texlab", "bashls", "vimls" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(c.default())
end

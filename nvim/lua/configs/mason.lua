local mason = require("mason")
local masonLsp = require("mason-lspconfig")
local masonTool = require("mason-tool-installer")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

masonLsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        -- "bashls",
    },
    automatic_installation = true,
})

masonTool.setup({
    ensure_installed = {
        -- "prettier",
        -- "stylua", -- lua formatter
        -- "eslint_d",
    },
})

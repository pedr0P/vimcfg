-- TODO: SETUP THIS CONFIG

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
capabilities = vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())


local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig.tinymist.setup {
    capabilities = capabilities,
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable"
    },
}
lspconfig.asm_lsp.setup { capabilities = capabilities }
lspconfig.clangd.setup {
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--background-index",
      "-j=12",
    }
}
lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            diagnostics = {
                enable = true
            }
        }
    }

})

-- Temp:
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<C-c>ld", ":FzfLua lsp_definitions<CR>")
map("n", "<C-c>lr", ":FzfLua lsp_references<CR>")
map("n", "<C-c>li", ":FzfLua lsp_implementations<CR>")
map("n", "<C-c>lt", ":FzfLua lsp_typedefs<CR>")
map("n", "<C-c>k", ":lua vim.lsp.buf.hover()<CR>")
-- map("n", "<leader>ca", ":FzfLua lsp_code_actions<CR>")
-- map("n", "<leader>cf", ":FzfLua quickfix<CR>")


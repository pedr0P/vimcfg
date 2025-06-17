local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  ensure_installed = {
        "cpp",
        "c",
        "lua",
        "vim",
        "bash",
        "rust",
        "markdown",
        "yaml",
        "css",
        "scss",
        "hyprlang",
        -- "latex",
    },
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    sync_install = false,
    indent = { enable = true },
    autopairs = { enable = true },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "help" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    rainbow = { enable = true, extended_mode = false, max_file_lines = nil },
    autotag = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
    textobjects = { enable = false },
})

vim.filetype.add {
    extension = { rasi = 'rasi' },
    pattern = {
        ['.*/waybar/config'] = 'jsonc',
        ['.*/mako/config'] = 'dosini',
        ['.*/foot/*.conf'] = 'bash',
        ['.*/hypr/.*%.conf'] = 'hyprlang',
    },
}

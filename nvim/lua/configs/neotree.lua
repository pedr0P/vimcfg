-- TODO: Disable the vim-notify error
require("neo-tree").setup({
    window = {
        mappings = {
            -- Layout:
            -- ["m"] = {
                -- "move",
                -- config = {
                -- },
            -- },
            ["m"] = "noop",
            ["e"] = "noop",
            ["i"] = "noop",
            ["h"] = "move",
            ["k"] = "toggle_auto_expand_width",
            ["l"] = "show_file_details",
        }
    }
})

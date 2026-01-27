return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = "0.10.0",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.config")
            config.setup({
                auto_install = true,
                ensure_installed = {
                    "bash",
                    "c",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "json",
                    "lua",
                    "python",
                    "rust",
                    "tcl",
                    "yaml",
                },
                highlight = { enable = true },
                indent = { enable = false },
            })
        end
    }
}

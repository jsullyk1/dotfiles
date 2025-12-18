return {
    -- { 'vimpostor/vim-tpipeline',
    --     config = function()
    --         -- Embedd into tmux
    --         -- vim.g.tpipeline_autoembed = 1
    --     end,
    -- },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event= "VeryLazy",
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'onedark',
                    section_separators = '',
                    component_separators = '',
                    icons_enabled = true,
                },
                sections = {
                    lualine_a = { 'mode'},
                    lualine_b = { 'branch', 'diff', 'diagnostics'},
                    lualine_c = { 'filename' },
                    lualine_x = { 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            })

            -- if os.getenv('TMUX') then
            --     vim.defer_fn(function() vim.o.laststatus=0 end, 0)
            -- end
        end,
    },
}

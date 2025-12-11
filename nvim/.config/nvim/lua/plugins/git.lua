return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>tw', gs.toggle_word_diff)
      end,
    }
  end
}


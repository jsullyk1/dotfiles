return {
  "nvimtools/none-ls.nvim",
  config = function()
    local none_ls = require("null-ls")
    none_ls.setup({
      sources = {
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.prettier,
        none_ls.builtins.formatting.shellharden,
        none_ls.builtins.diagnostics.erb_lint,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

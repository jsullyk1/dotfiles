return {
  "nvimtools/none-ls.nvim",
  config = function()
    local none_ls = require("null-ls")
    none_ls.setup({
      sources = {
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.prettier,
        none_ls.builtins.formatting.shellharden,
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = false })
    end, { desc = "Format buffer" })
  end,
}

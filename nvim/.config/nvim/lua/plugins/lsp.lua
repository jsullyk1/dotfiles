return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- TODO: This configuration style is deprecated... figure out
      -- how to do this properly.
      -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
      -- local capabilities = vim.tbl_deep_extend(
      --   "force",
      --   {},
      --   vim.lsp.protocol.make_client_capabilities(),
      --   cmp_nvim_lsp.default_capabilities()
      --   )
      -- local lspconfig = require("lspconfig")
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end,
  },
}

require("conform").setup({
  formatters_by_ft = {
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    lua = { "stylua" },
  },
  format_on_save = {
  	lsp_fallback = true,
    timeout_ms = 700
  },
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.ts"},
  callback = function()
    require("conform").format { async = true, lsp_fallback = true }
  end,
})


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

require("conform").formatters.shfmt = {
  inherit = false,
  command = "shfmt",
  args = { "-i", "2", "-filename", "$FILENAME" },
}

return {
  "lambdalisue/suda.vim",
  event = "BufRead",
  config = function()
    vim.g.suda_smart_edit = 1

    vim.api.nvim_create_autocmd("BufWriteCmd", {
      pattern = "*",
      callback = function()
        local ok = pcall(vim.cmd, "write!")

        if not ok then
          vim.cmd("SudaWrite")
        end
      end,
    })
  end,
}

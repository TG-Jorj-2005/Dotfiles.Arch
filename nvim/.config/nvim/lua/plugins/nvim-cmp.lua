return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    opts = function(_, opts)
      return opts -- folosim config-ul default, fără keymaps extra
    end,
  },
}

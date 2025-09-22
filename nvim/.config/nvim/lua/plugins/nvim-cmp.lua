return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true, -- forțăm activarea
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true }) -- confirmă sugestia cu Tab
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      return opts
    end,
  },
}

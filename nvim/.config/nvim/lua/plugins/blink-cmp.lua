return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default", -- pornește cu keymap implicit
        ["<Tab>"] = { "accept", "fallback" }, -- confirmă sugestia sau inserează tab normal
        ["<S-Tab>"] = { "select_prev", "fallback" }, -- mergi la sugestia anterioară
      },
    },
  },
}

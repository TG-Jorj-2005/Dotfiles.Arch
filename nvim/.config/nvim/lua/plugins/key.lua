return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    win = { -- înlocuiește vechiul "window"
      border = "rounded",
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      align = "center",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Grupuri de taste (folosește noul spec)
    wk.add({
      { "<leader>f", group = "find" },
      { "<leader>h", group = "git" },
      { "<leader>l", group = "lsp" },
    })

    -- Exemple de keymaps (poți adăuga ce folosești tu)
    wk.add({
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Find help" },

      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gs", "<cmd>Neogit<cr>",  desc = "Neogit status" },

      { "<leader>lr", vim.lsp.buf.rename,         desc = "Rename symbol" },
      { "<leader>la", vim.lsp.buf.code_action,    desc = "Code action" },
      { "<leader>ld", vim.diagnostic.open_float,  desc = "Line diagnostics" },
      { "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, desc = "Format" },
    })
  end,
}


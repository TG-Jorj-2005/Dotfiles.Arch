return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup{
      defaults = {
        -- opțiuni generale
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    }

    -- Keymaps example
    local map = vim.keymap.set
    map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
    map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
    map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
    map("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help Tags" })
  end
}


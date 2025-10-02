return {
  {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "main",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, pentru iconițe
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- închide panoul dacă e ultima fereastră
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,  -- afișează .gitignore etc
            hide_gitignored = true, -- ascunde fișierele ignorate de git
          },
          follow_current_file ={ 
            enabled =true,
          },
          use_libuv_file_watcher = true,
        },
        window = {
          width = 30,
          mappings = {
            ["o"] = "open",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["h"] = "close_node",
            ["H"] = "toggle_hidden",
          },
        },
      })
    end,
  },
}


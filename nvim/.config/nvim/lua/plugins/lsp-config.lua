return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- UI config
      local signs = { Error = "✘ ", Warn = " ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Keymaps on attach
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      -- Servere LSP
      local servers = {
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        
        -- Python
        pyright = {},
        pylsp = {},
        ruff_lsp = {},
        
        -- JavaScript/TypeScript
        ts_ls = {},
        denols = {},
        biome = {},
        
        -- Web Development
        html = {},
        cssls = {},
        tailwindcss = {},
        emmet_ls = {},
        svelte = {},
        vuels = {},
        astro = {},
        
        -- JSON/YAML/TOML
        jsonls = {},
        yamlls = {},
        taplo = {}, -- TOML
        
        -- Markdown
        marksman = {},
        
        -- Bash/Shell
        bashls = {},
        
        -- Docker
        dockerls = {},
        docker_compose_language_service = {},
        
        -- ESLint/Prettier
        eslint = {},
        
        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        
        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
        
        -- C/C++
        clangd = {},
        
        -- C#
        omnisharp = {},
        
        -- Java
        jdtls = {},
        
        -- PHP
        intelephense = {},
        phpactor = {},
        
        -- Ruby
        ruby_lsp = {},
        solargraph = {},
        
        -- Elixir
        elixirls = {},
        
        -- Erlang
        erlangls = {},
        
        -- Haskell
        hls = {},
        
        -- Zig
        zls = {},
        
        -- Swift
        sourcekit = {},
        
        -- Kotlin
        kotlin_language_server = {},
        
        -- Scala
        metals = {},
        
        -- Dart/Flutter
        dartls = {},
        
        -- R
        r_language_server = {},
        
        -- Julia
        julials = {},
        
        -- Terraform
        terraformls = {},
        tflint = {},
        
        -- Ansible
        ansiblels = {},
        
        -- SQL
        sqlls = {},
        sqls = {},
        
        -- GraphQL
        graphql = {},
        
        -- Prisma
        prismals = {},
        
        -- LaTeX
        texlab = {},
        
        -- XML
        lemminx = {},
        
        -- CMake
        cmake = {},
        
        -- Nix
        nil_ls = {},
        
        -- Vim
        vimls = {},
        
        -- Assembly
        asm_lsp = {},
        
        -- Protocol Buffers
        bufls = {},
        
        -- Perl
        perlnavigator = {},
        
        -- OCaml
        ocamllsp = {},
        
        -- Fortran
        fortls = {},
        
        -- COBOL
        cobol_ls = {},
        
        -- PowerShell
        powershell_es = {},
        
        -- Groovy
        groovyls = {},
        
        -- Puppet
        puppet = {},
        
        -- Salt
        salt_ls = {},
        
        -- Helm
        helm_ls = {},
      }


      for server, config in pairs(servers) do
       vim.lsp.config(server,vim.tbl_deep_extend("force",{
          capabilities = capabilities,
          on_attach = on_attach,
        }, config))
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "jsonls",
        "yamlls",
        "bashls",
        "dockerls",
        "eslint",
        "gopls",
        "rust_analyzer",
        "clangd",
        "marksman",
        },
        automatic_installation = true,
      })
    end,
  },
}

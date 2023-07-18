return {

  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
      { "<leader>xxx", "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>", desc = "Mason" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      {
        "folke/neodev.nvim",
        opts = {
          library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
        },
      },
      { "j-hui/fidget.nvim", config = true, tag = "legacy" },
      { "smjonas/inc-rename.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
        dockerls = {},
        omnisharp = {},
        html_lsp = {},
        pyright = {},
        powershell_es = {},
        terraformls = {},
      },
      setup = {
        lua_ls = function(_, _)
          local lsp_utils = require("plugins.lsp.utils")
          lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end, { buffer = buffer, desc = "OSV Launch" })
            end
          end)
        end,
      },
    },
    config = function(plugin, opts)
      require("plugins.lsp.servers").setup(plugin, opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "ruff",
        "debugpy",
        "codelldb",
      },
    },
    config = function(_, opts)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local nls = require("null-ls")
      nls.setup({
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.black,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" } }),
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>ld", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>lD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
}

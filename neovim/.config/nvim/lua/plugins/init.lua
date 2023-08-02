return {
  {
    "nvim-lua/plenary.nvim",
    dependencies = {
      "sindrets/diffview.nvim",
    },
  },
  "MunifTanjim/nui.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    config = true,
  },
  -- { "nacro90/numb.nvim", event = "BufReadPre", config = true },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufReadPre",
  --   config = true,
  -- },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },

  --- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    opts = {
      kind = "auto",
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },
    },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
      { "<leader>gP", "<cmd>Git -c push.default=current push<cr>", desc = "Push" },
      { "<leader>gp", "<cmd>Git pull<cr>", desc = "Pull" },
      { "<leader>gdf", "<cmd>Gvdiffsplit<cr>", desc = "File" },
      { "<leader>gdm", "<cmd>Gvdiff origin/master<cr>", desc = "Master" },
      { "<leader>gsf", "<cmd>Gwrite<cr>", desc = "File" },
      { "<leader>gsR", "<cmd>Gwrite<cr>", desc = "Reset File" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "<leader>gj", gs.next_hunk, "Next Hunk")
        map("n", "<leader>gk", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>gsh", ":Gitsigns stage_hunk<CR>", "Hunk")
        map({ "n", "v" }, "<leader>gsr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
    },
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>gu", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },

  -- Markdown
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

  ---- Mini -----
  --{
  --  "echasnovski/mini.animate",
  --  event = "VeryLazy",
  --  version = false,
  --  config = function(_, opts)
  --    require("mini.animate").setup(opts)
  --  end,
  --},
  {
    "echasnovski/mini.clue",
    event = "VeryLazy",
    version = false,
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.files").setup(opts)
    end,
    keys = {
      { "<leader>ff", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", desc = "Mini Files" },
      { "<leader>fF", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini Files" },
    },
  },
  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  -- surround
  {
    "echasnovski/mini.surround",
    --keys = function(_, keys)
    --  -- Populate the keys based on the user's options
    --  local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
    --  local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    --  local mappings = {
    --    { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
    --    { opts.mappings.delete, desc = "Delete surrounding" },
    --    { opts.mappings.find, desc = "Find right surrounding" },
    --    { opts.mappings.find_left, desc = "Find left surrounding" },
    --    { opts.mappings.highlight, desc = "Highlight surrounding" },
    --    { opts.mappings.replace, desc = "Replace surrounding" },
    --    { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    --  }
    --  mappings = vim.tbl_filter(function(m)
    --    return m[1] and #m[1] > 0
    --  end, mappings)
    --  return vim.list_extend(mappings, keys)
    --end,
    --opts = {
    --  mappings = {
    --    add = "gsa", -- Add surrounding in Normal and Visual modes
    --    delete = "gsd", -- Delete surrounding
    --    find = "gsf", -- Find surrounding (to the right)
    --    find_left = "gsF", -- Find surrounding (to the left)
    --    highlight = "gsh", -- Highlight surrounding
    --    replace = "gsr", -- Replace surrounding
    --    update_n_lines = "gsn", -- Update `n_lines`
    --  },
    --},
    --config = function(_, opts)
    --  -- use gz mappings instead of s to prevent conflict with leap
    --  require("mini.surround").setup(opts)
    --end,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })
    end,
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
}

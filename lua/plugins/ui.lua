return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics" },
          lualine_y = { "progress" },
          lualine_z = {
            "location",
            { function() return os.date("%H:%M") end },
          },
        },
      })
    end,
  },
}

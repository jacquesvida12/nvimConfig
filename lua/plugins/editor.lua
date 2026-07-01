return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "lua", "python", "sql", "json", "yaml",
        "markdown", "markdown_inline", "bash", "vim", "vimdoc",
      }

      require("nvim-treesitter").install(parsers)

      -- New API doesn't auto-enable highlighting/indent anymore — turn them
      -- on ourselves whenever a buffer with an installed parser is opened.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

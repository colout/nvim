return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "LSP: [F]ormat",
    },
    {
      "<leader>tf",
      function()
        -- Toggle format on save
        local f = require("plugins.lsp.lsp_configuration.config")

        for _, c in ipairs(f) do
          if c.filetype == vim.bo.filetype then
            c.format_on_save = not c.format_on_save
            vim.notify("Format on save: " .. tostring(c.format_on_save))
          end
        end
      end,
      mode = "",
      desc = "Toggle format on save",
    },
  },

  -- TODO: This works, but there should be a simpler way to structure the config to simplify this
  init = function()
    -- Set formatters ovverride from config file (fallback to lsp)
    require("conform").formatters_by_ft = {}
    local configs = require("plugins.lsp.lsp_configuration.config")

    for _, c in ipairs(configs) do
      local filetype = c.filetype
      local formatters = c.formatters

      --
      -- Add the formatters to the formatters_by_ft table and configure them
      --
      if formatters then
        local formatters_flattened = {}

        -- Adds the simple index'd pairs (non-tables)
        for c, f in ipairs(formatters) do
          table.insert(formatters_flattened, f)
        end

        -- Adds the key'd pairs (tables)
        for k, f in pairs(formatters) do
          if type(f) == "table" then
            table.insert(formatters_flattened, k)
            require("conform").formatters[k] = f
          else
            table.insert(formatters_flattened, f)
          end
        end

        require("conform").formatters_by_ft[filetype] = formatters_flattened
      end
    end
  end,

  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local f = require("plugins.lsp.lsp_configuration.config")

      for _, c in ipairs(f) do
        if c.filetype == vim.bo[bufnr].filetype then
          if c.format_on_save == false then
            return false
          end
        end
      end

      return {
        timeout_ms = 500,
        lsp_fallback = "fallback",
      }
    end,
  },
}

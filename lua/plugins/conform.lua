return {
  enabled = true,
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "prettierd","pint" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { "prettierd" },
        rust =  { "rustfmt" },
        html = {"prettierd"},
        graphql = {"prettierd"},
        vue = {"prettierd"},
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
}

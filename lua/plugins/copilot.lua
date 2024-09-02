return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
		suggestion = { 
				enabled = true,
				auto_trigger = true,
				accept = "<C-tab>",
			},
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
			php = true,
      twig = true,
      html = true,
      css = true,
      javascript = true,
      typescript = true,
      graphql = true,
      json = true,
      yaml = true,
      toml = true,
      lua = true,
      vim = true,
      sh = true,
      dockerfile = true,
      python = true,
      go = true,
      rust = true,
      vue = true,

		}
	})
  end,
}

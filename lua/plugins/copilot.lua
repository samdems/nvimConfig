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
		}
	})
  end,
}

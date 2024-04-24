return {
    'nvim-neotest/neotest',
    dependencies = {
        'V13Axel/neotest-pest',
    },
    config = function()
        require('neotest').setup({
        adapters = {
          require('neotest-pest')({
            ignore_dirs = { "vendor", "node_modules" },
            test_file_suffixes = { "Test.php", "_test.php", "PestTest.php" },
            sail_enabled = function() return true end,
            sail_executable = "vendor/bin/sail",
            sail_project_path = "/var/www/html",
            pest_cmd = "vendor/bin/pest",
            compact = false,
          }),
        }
        })
    end
}

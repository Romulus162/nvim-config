return  {
    -- Telescope plugin (fzf is very interesting to me, however its external binary dependent)    
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                "<leader><leader>",
                function() require('telescope.builtin').find_files() end,
                desc = "Find files"
            },
            {
                "<leader>,",
                function() require('telescope.builtin').buffers() end,
                desc = "Find buffers"
                },
            {
                "<leader>/",
                function() require('telescope.builtin').live_grep() end,
    --vim-sleuth
                desc = "Search project"
            },
        },
    }

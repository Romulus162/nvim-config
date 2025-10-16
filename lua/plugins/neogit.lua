return  {
        "https://github.com/NeogitOrg/neogit",
        cmd = "Neogit", -- Only load when you run the Neogit command
        config = function()
            require("neogit").setup()
        end,
    }

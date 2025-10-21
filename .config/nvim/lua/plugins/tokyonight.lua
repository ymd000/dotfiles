return {
    "folke/tokyonight.nvim",
    lazy = false,  -- 起動時にすぐ読み込む
    priority = 1000,  -- 他のプラグインより先に読み込む
    config = function()
        -- tokyonight の設定
        vim.g.tokyonight_style = "night"  -- night, storm, day
        
        -- カラースキームを適用
        vim.cmd[[colorscheme tokyonight]]
    end,
}

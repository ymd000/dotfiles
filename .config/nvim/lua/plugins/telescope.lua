return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- デフォルトの設定
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.close,
            ["<ESC>"] = actions.close,
          },
        },
      },
    })

    -- キーマッピング
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- ファイル検索
    keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
    
    -- 文字列検索（grep）
    keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
    
    -- バッファ一覧
    keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
    
    -- ヘルプタグ検索
    keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
    
    -- 最近開いたファイル
    keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>', opts)
  end,
}

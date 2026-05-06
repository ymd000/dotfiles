return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        -- === [改善] endaamanから採用: 表示設定 ===
        sorting_strategy = 'ascending',  -- 上から下へソート
        layout_config = {
          prompt_position = "top",  -- プロンプトを上部に配置
        },

        -- デフォルトの設定
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.close,
            ["<ESC>"] = actions.close,
            ["<Tab>"] = actions.move_selection_next,  -- Tab で次の項目
            ["<S-Tab>"] = actions.move_selection_previous,  -- Shift+Tab で前の項目
            ["<C-t>"] = actions.select_tab,  -- 新しいタブで開く
          },
          n = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<C-t>"] = actions.select_tab,
          },
        },
      },
    })

    -- キーマッピング
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- === 既存のキーマップ（維持）===
    keymap.set('n', '<leader>ff', builtin.find_files, opts)  -- ファイル検索
    keymap.set('n', '<leader>fg', builtin.live_grep, opts)  -- 文字列検索（grep）
    keymap.set('n', '<leader>fb', builtin.buffers, opts)  -- バッファ一覧
    keymap.set('n', '<leader>fh', builtin.help_tags, opts)  -- ヘルプタグ検索
    keymap.set('n', '<leader>fr', builtin.oldfiles, opts)  -- 最近開いたファイル

    -- === [改善] endaamanから採用: 追加のTelescopeキーマップ ===
    -- 参考: endaaman/dotfiles/nvim/lua/plugins/telescope.lua

    -- Space + Space でTelescopeを再開
    keymap.set('n', '<leader><leader>', builtin.resume, opts)

    -- Space + b でバッファ一覧（短縮版）
    keymap.set('n', '<leader>b', builtin.buffers, opts)

    -- Space + o で最近開いたファイル（短縮版）
    keymap.set('n', '<leader>o', builtin.oldfiles, opts)

    -- Space + g でlive_grep（短縮版）
    keymap.set('n', '<leader>g', builtin.live_grep, opts)

    -- Space + m でマーク一覧
    keymap.set('n', '<leader>m', builtin.marks, opts)

    -- Space + d でGitステータス
    keymap.set('n', '<leader>d', builtin.git_status, opts)

    -- Space + r でレジスタ一覧
    keymap.set('n', '<leader>r', builtin.registers, opts)

    -- Space + : でコマンド一覧
    keymap.set('n', '<leader>:', builtin.commands, opts)

    -- Space + h でヘルプ（短縮版）
    keymap.set('n', '<leader>h', builtin.help_tags, opts)

    -- Space + W でカーソル下の単語をgrep
    keymap.set('n', '<leader>W', function()
      builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
    end, opts)

    -- Visual mode: 選択テキストをlive_grep
    keymap.set('v', '<leader>g', function()
      vim.cmd('normal! "vy')
      local selection = vim.fn.getreg('v'):gsub('\n', ' '):match('^%s*(.-)%s*$')
      builtin.live_grep({ default_text = selection })
    end, opts)

    -- Space + f でGitファイル検索（Gitリポジトリ外ではfind_files）
    keymap.set('n', '<leader>f', function()
      local ok = pcall(builtin.git_files)
      if not ok then
        builtin.find_files()
      end
    end, opts)
  end,
}

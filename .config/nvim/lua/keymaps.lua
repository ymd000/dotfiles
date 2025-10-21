-- リーダーキーの設定
vim.g.mapleader = ' '

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 保存と終了
keymap.set('n', '<leader>w', ':w<CR>', opts)
keymap.set('n', '<leader>q', ':q<CR>', opts)
keymap.set('n', '<leader>wq', ':wq<CR>', opts)

-- クリップボードへコピー（WSL用）
keymap.set('n', '<leader>y', '"+y', opts)
keymap.set('n', '<leader>yy', '"+yy', opts)

-- クリップボードからペースト
keymap.set('n', '<leader>p', '"+p', opts)
keymap.set('n', '<leader>P', '"+P', opts)

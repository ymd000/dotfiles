-- === 基本キーマップ ===
-- リーダーキーは init.lua で設定済み（Space）

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- === 保存と終了 ===
keymap.set('n', '<leader>w', ':w<CR>', opts)
keymap.set('n', '<leader>q', ':q<CR>', opts)
keymap.set('n', '<leader>wq', ':wq<CR>', opts)

-- === クリップボードへコピー（WSL用）===
keymap.set('n', '<leader>y', '"+y', opts)
keymap.set('n', '<leader>yy', '"+yy', opts)

-- === クリップボードからペースト ===
keymap.set('n', '<leader>p', '"+p', opts)
keymap.set('n', '<leader>P', '"+P', opts)

-- === [改善] endaamanから採用: 便利なキーマップ ===
-- 参考: endaaman/dotfiles/nvim/lua/user/keymaps.lua

-- === カーソル移動の改善 ===
keymap.set({ 'n', 'v' }, 'j', 'gj', opts)  -- 表示行単位で移動
keymap.set({ 'n', 'v' }, 'k', 'gk', opts)  -- 表示行単位で移動
keymap.set({ 'n', 'v' }, 'H', 'g^', opts)  -- 行頭へ移動
keymap.set({ 'n', 'v' }, 'L', 'g$', opts)  -- 行末へ移動

-- === 便利な編集操作 ===
keymap.set('n', '<C-a>', 'ggVG', opts)  -- 全選択
keymap.set('n', '<C-s>', ':w<CR>', opts)  -- 保存
keymap.set('n', '<C-q>', ':qa<CR>', opts)  -- 全て閉じる

-- === 検索ハイライトのクリア ===
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- === タブ操作 ===
keymap.set('n', '<C-t>', ':tabnew<CR>', opts)  -- 新しいタブ
keymap.set('n', '<Tab>', 'gt', opts)  -- 次のタブ
keymap.set('n', '<S-Tab>', 'gT', opts)  -- 前のタブ

-- === ウィンドウ分割 ===
keymap.set('n', '<leader>i', ':vsplit<CR>', opts)  -- 垂直分割
keymap.set('n', '<leader>-', ':split<CR>', opts)  -- 水平分割

-- === ウィンドウ間移動 ===
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- === Visual モード ===
keymap.set('v', '<', '<gv', opts)  -- インデント減らす（選択維持）
keymap.set('v', '>', '>gv', opts)  -- インデント増やす（選択維持）
keymap.set('v', 'p', '"_dP', opts)  -- ペースト時にヤンクしない

-- === ターミナルモード ===
keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)  -- ターミナルモードから抜ける

-- === コメントトグル ===
keymap.set('n', '<C-/>', function()
  require('Comment.api').toggle.linewise.current()
end, opts)
keymap.set('v', '<C-/>', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

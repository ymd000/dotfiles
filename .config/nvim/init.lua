-- === [改善] endaamanから採用: 基本設定の強化 ===
-- 参考: endaaman/dotfiles/nvim/lua/user/base.lua

-- === 基本設定 ===
vim.opt.encoding = 'utf-8'
vim.opt.number = true                    -- 行番号表示
vim.opt.relativenumber = false           -- 相対行番号は無効（好みで有効化可能）
vim.opt.cursorline = true                -- カーソル行をハイライト
vim.opt.cursorcolumn = false             -- カーソル列は無効（好みで有効化可能）
vim.opt.expandtab = true                 -- タブをスペースに展開
vim.opt.tabstop = 2                      -- タブ幅
vim.opt.shiftwidth = 2                   -- インデント幅
vim.opt.softtabstop = 2                  -- ソフトタブ幅
vim.opt.autoindent = true                -- 自動インデント
vim.opt.smarttab = true                  -- スマートタブ
vim.opt.mouse = 'a'                      -- マウス有効化
vim.opt.clipboard = 'unnamedplus'        -- システムクリップボードと連携
vim.opt.ignorecase = true                -- 検索時大文字小文字を無視
vim.opt.smartcase = true                 -- 大文字が含まれる場合は区別
vim.opt.hlsearch = true                  -- 検索結果をハイライト
vim.opt.termguicolors = true             -- True Color対応
vim.opt.wrap = true                      -- 行を折り返す
vim.opt.scrolloff = 10                   -- スクロール時の余白行数
vim.opt.backup = false                   -- バックアップファイルを作らない
vim.opt.swapfile = false                 -- スワップファイルを作らない
vim.opt.undofile = true                  -- アンドゥファイルを有効化
vim.opt.laststatus = 2                   -- ステータスラインを常に表示
vim.opt.showcmd = true                   -- 入力中のコマンドを表示
vim.opt.wildmenu = true                  -- コマンドライン補完を強化
vim.opt.completeopt = 'menu,menuone,noselect'  -- 補完オプション
vim.opt.updatetime = 300                 -- 更新時間（ms）
vim.opt.timeoutlen = 500                 -- キーマップのタイムアウト

-- === スワップ/バックアップ/undoディレクトリ ===
vim.opt.directory = vim.fn.stdpath('cache') .. '/swap'
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'

-- === 不可視文字の表示 ===
vim.opt.list = true
vim.opt.listchars = 'tab:› ,trail:·,extends:»,precedes:«,nbsp:·'

-- === 検索パス設定 ===
vim.opt.path:append('**')  -- サブディレクトリも検索対象に

-- netrw を無効化（nvim-treeと競合するため）
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- === リーダーキーの設定（プラグイン読み込み前に設定） ===
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- キーマッピングを読み込む
require('keymaps')

-- プラグインマネージャーを読み込む
require('plugin_manager')

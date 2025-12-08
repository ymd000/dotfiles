# dotfiles

個人的な開発環境の設定ファイル集。tmux、zsh、neovimの設定中心。

**改善日**: 2025-12-08
**参考元**: [endaaman/dotfiles](https://github.com/endaaman/dotfiles)

## 主な機能

| 項目 | 改善内容 | 効果 |
|------|---------|------|
| **tmux** | 基本機能の強化、視覚的改善 | 履歴無制限、SSH時の色分け、コピーモード視認性向上 |
| **zsh** | 履歴設定、便利なエイリアス、FZF統合 | コマンド履歴検索の改善、生産性向上 |
| **neovim** | LSP、補完、便利プラグイン追加 | コード補完・診断の強化、編集効率の大幅向上 |

## インストール

```bash
# リポジトリのクローン
git clone https://github.com/ymd000/dotfiles.git ~/dotfiles
cd ~/dotfiles

# インストールスクリプトの実行
./install.sh
```

## 含まれる設定

- `.tmux.conf` - tmux設定
- `.zshrc` - zsh設定
- `.p10k.zsh` - Powerlevel10k設定
- `.config/nvim/` - Neovim設定

---

## tmux.conf の改善

### 追加した設定

#### 1. 履歴を大幅に増やす
- **参考元**: `endaaman/dotfiles/tmux.conf:13`
- **設定**: `set -g history-limit 999999999`
- **効果**: スクロールバックの履歴が実質無制限になり、長いログも確認可能

#### 2. クリップボード統合を有効化
- **参考元**: `endaaman/dotfiles/tmux.conf:17`
- **設定**: `set -g set-clipboard on`
- **効果**: tmuxとシステムクリップボードの自動連携

#### 3. セッションが空になっても切断しない
- **参考元**: `endaaman/dotfiles/tmux.conf:16`
- **設定**: `set -g detach-on-destroy off`
- **効果**: 最後のウィンドウを閉じても次のセッションに自動切り替え

#### 4. focus-eventsを有効化
- **参考元**: `endaaman/dotfiles/tmux.conf:41`
- **設定**: `set -g focus-events on`
- **効果**: Vim/Neovimとの統合が改善され、フォーカスの出入りを検知可能

#### 5. 256色＋RGB対応のターミナル設定
- **参考元**: `endaaman/dotfiles/tmux.conf:33-34`
- **設定**:
  ```tmux
  set -g default-terminal "tmux-256color"
  set -as terminal-features ",xterm-256color:RGB"
  ```
- **効果**: より正確な色表示とTrue Color対応

#### 6. SSH接続時はステータスバーを緑色に
- **参考元**: `endaaman/dotfiles/tmux.conf:57-61`
- **設定**: SSH接続検知による条件分岐
- **効果**: ローカル/リモート環境の視覚的な区別が容易に

#### 7. コピーモード中はステータスバーをオレンジ色に
- **参考元**: `endaaman/dotfiles/tmux.conf:49`
- **設定**: `set-hook -g pane-mode-changed`
- **効果**: コピーモード中であることが一目で分かる

#### 8. コピーモードの選択範囲を見やすく
- **参考元**: `endaaman/dotfiles/tmux.conf:172`
- **設定**: `set -g mode-style 'bg=yellow,fg=black'`
- **効果**: 選択範囲が視認しやすい

### 変更した設定

#### 1. 新しいウィンドウ/ペインでカレントディレクトリを継承
- **変更箇所**: `bind -n C-t`, `bind /`, `bind -`
- **設定**: `-c "#{pane_current_path}"` オプションを追加
- **効果**: 新しいタブや分割時に毎回cdする必要がなくなる

---

## .zshrc の改善

### 追加した設定

#### 1. 履歴設定の強化
- **参考元**: `endaaman/dotfiles/zshrc:192-194, 71-94`
- **設定**:
  ```zsh
  export HISTFILE=$HOME/.zsh_history
  export HISTSIZE=100000
  export SAVEHIST=100000
  setopt extended_history
  setopt hist_ignore_all_dups
  setopt share_history
  ```
- **効果**:
  - 10万コマンドの履歴保存
  - 重複排除、複数セッション間で共有
  - より賢い履歴管理

#### 2. 便利なzshオプション
- **参考元**: `endaaman/dotfiles/zshrc:64-92`
- **設定**:
  ```zsh
  setopt auto_cd           # ディレクトリ名だけでcd
  setopt auto_pushd        # cdしたら自動的にpushdする
  setopt auto_menu         # TAB連打で補完候補を順に表示
  setopt extended_glob     # 拡張グロブを有効化
  ```
- **効果**: ディレクトリ移動や補完が快適に

#### 3. エディタ設定
- **参考元**: `endaaman/dotfiles/zshrc:196-202`
- **設定**: neovim/vimを優先的にEDITORとして設定
- **効果**: git commit等でneovimが自動的に使用される

#### 4. FZF設定
- **参考元**: `endaaman/dotfiles/zshrc:204`
- **設定**:
  ```zsh
  export FZF_DEFAULT_OPTS='--height 50% --reverse --border ...'
  ```
- **効果**: より使いやすいFZFインターフェース

#### 5. 便利なエイリアス
- **参考元**: `endaaman/dotfiles/zshrc:681-728`
- **追加したエイリアス**:
  - `alias mv='mv -v'` - 詳細表示
  - `alias cp='cp -v'` - 詳細表示
  - `alias g='git'` - Gitショートカット
  - `alias n='nvim'` - Neovimショートカット
  - `alias s='systemctl'` - systemctlショートカット
  - `alias path="echo \$PATH | sed 's/:/\\n/g'"` - PATH表示
  - `alias rm='trash-put'` - 安全な削除（trash-cliがあれば）
  - `exa`による現代的なlsエイリアス（l, la, ll）
- **効果**: タイピング量削減、誤削除防止

#### 6. FZFでコマンド履歴・ファイル選択
- **参考元**: `endaaman/dotfiles/zshrc:535-562`
- **設定**:
  - `Ctrl+R`: コマンド履歴をFZFで検索
  - `Ctrl+O`: カレントディレクトリのファイルをFZFで選択
- **効果**: 高速なコマンド・ファイル選択が可能

#### 7. 補完設定の強化
- **参考元**: `endaaman/dotfiles/zshrc:742-757`
- **設定**: zstyleによる詳細な補完設定
- **効果**: より見やすく便利な補完

#### 8. 開発環境の自動設定
- **参考元**: `endaaman/dotfiles/zshrc:244-312`
- **追加した環境**:
  - Python: pyenv自動初期化
  - Node.js: pnpm PATH設定
  - Go: GOPATH設定
  - Rust: cargo PATH設定
- **効果**: 各言語環境が自動的にセットアップされる

---

## Neovim設定の改善

### 基本設定の強化 (init.lua)

#### 追加した設定
- **参考元**: `endaaman/dotfiles/nvim/lua/user/base.lua`
- **主な設定**:
  - 行番号表示、カーソル行ハイライト
  - スワップ/バックアップファイルを無効化
  - undofile有効化
  - クリップボード統合 (`clipboard=unnamedplus`)
  - 検索設定（大文字小文字、ハイライト）
  - スクロールオフセット設定
  - 不可視文字の表示
- **効果**: より快適な編集環境

### キーマップの拡張 (keymaps.lua)

#### 追加したキーマップ
- **参考元**: `endaaman/dotfiles/nvim/lua/user/keymaps.lua`
- **カーソル移動**:
  - `j`/`k`: 表示行単位で移動
  - `H`/`L`: 行頭/行末へ移動
- **便利な編集**:
  - `<C-a>`: 全選択
  - `<C-s>`: 保存
  - `<Esc><Esc>`: 検索ハイライトクリア
- **タブ/ウィンドウ操作**:
  - `<C-t>`: 新しいタブ
  - `<Tab>`/`<S-Tab>`: タブ切り替え
  - `<C-h/j/k/l>`: ウィンドウ間移動
- **Visual モード**:
  - `<`/`>`: インデント調整（選択維持）
  - `p`: ペースト時にヤンクしない

### 新規プラグイン設定

#### 1. LSP設定 (lua/plugins/lsp.lua)
- **参考元**: `endaaman/dotfiles/nvim/lua/plugins/completion.lua`
- **サポート言語**:
  - Python (pyright)
  - Lua (lua_ls)
  - TypeScript/JavaScript (ts_ls)
  - Go (gopls)
- **LSPキーマップ**:
  - `gd`: 定義へジャンプ
  - `gr`: 参照を表示
  - `K`: ホバー情報表示
  - `<leader>rn`: リネーム
  - `<leader>ca`: コードアクション
  - `[d`/`]d`: エラー/警告間移動
- **効果**: 強力なコード補完・診断機能

#### 2. 補完設定 (lua/plugins/completion.lua)
- **参考元**: `endaaman/dotfiles/nvim/lua/plugins/completion.lua`
- **プラグイン**: nvim-cmp + LuaSnip
- **補完ソース**: LSP、スニペット、バッファ、パス
- **キーマップ**:
  - `<Tab>`/`<S-Tab>`: 補完候補選択
  - `<CR>`: 確定
  - `<C-Space>`: 補完表示
- **効果**: モダンで快適な補完体験

#### 3. ステータスライン (lua/plugins/lualine.lua)
- **参考元**: `endaaman/dotfiles/nvim/lua/plugins/appearance.lua`
- **プラグイン**: lualine.nvim
- **表示内容**: モード、ブランチ、差分、診断、ファイル情報
- **効果**: 視覚的に美しく情報豊富なステータスライン

#### 4. ユーティリティプラグイン (lua/plugins/utilities.lua)
- **参考元**: `endaaman/dotfiles/nvim/lua/user/lazy.lua`
- **追加したプラグイン**:
  - **Comment.nvim**: `gcc`でコメントトグル
  - **nvim-surround**: 囲み文字操作 (`ys`, `ds`, `cs`)
  - **nvim-autopairs**: 括弧の自動閉じ
  - **indent-blankline.nvim**: インデントガイド
  - **gitsigns.nvim**: Git差分表示、`]c`/`[c`でhunk移動
  - **nvim-treesitter**: 高度なシンタックスハイライト
  - **nvim-web-devicons**: アイコン表示
- **効果**: 編集効率の大幅な向上

#### 5. Telescope拡張 (lua/plugins/telescope.lua)
- **参考元**: `endaaman/dotfiles/nvim/lua/plugins/telescope.lua`
- **追加したキーマップ**:
  - `<leader><leader>`: Telescope再開
  - `<leader>b`: バッファ一覧
  - `<leader>o`: 最近開いたファイル
  - `<leader>g`: live_grep
  - `<leader>m`: マーク一覧
  - `<leader>d`: Gitステータス
  - `<leader>r`: レジスタ一覧
  - `<leader>W`: カーソル下の単語をgrep
  - `<leader>f`: Gitファイル検索
- **効果**: より快適なファジーファインダー操作

---

## セットアップ手順

### 設定の反映方法

#### tmux
```bash
# tmuxを起動していない場合
tmux

# tmux内で設定を再読み込み
# Ctrl+a → r
```

#### zsh
```bash
# zshを再起動
exec zsh

# または
source ~/.zshrc
```

#### neovim
```bash
# neovimを起動
nvim

# プラグインをインストール
# :Lazy sync

# LSPの動作確認
# :checkhealth
```

### 必要なツールのインストール

#### 推奨ツール
```bash
# trash-cli（安全な削除）
sudo apt install trash-cli

# exa（modernなls）
sudo apt install exa

# colordiff（カラフルなdiff）
sudo apt install colordiff

# fzf（ファジーファインダー）
sudo apt install fzf
```

#### Neovim用LSPサーバー
```bash
# Python
pip install pyright

# Lua
# https://github.com/LuaLS/lua-language-server/releases からダウンロード

# TypeScript/JavaScript
npm install -g typescript-language-server

# Go
go install golang.org/x/tools/gopls@latest
```

---

## 備考

- **参考元の明記**: endaamanの設定ファイルの参照行数を記載しています
- **バックアップ**: 改善前の設定ファイルは `.bak` 拡張子で保存されています


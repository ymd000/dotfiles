# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# === [改善] endaamanから採用: zsh設定の強化 ===
# 参考: endaaman/dotfiles/zshrc
# ============================================================================

# === [改善] 履歴設定の強化 ===
# [改善] 履歴ファイルとサイズ設定 (L192-194)
# 効果: 大量のコマンド履歴を保存し、過去のコマンドを簡単に検索可能
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# [改善] 履歴関連オプション (L71-94)
# 効果: 重複排除、履歴共有、より賢い履歴管理
setopt extended_history          # 実行時刻も記録
setopt hist_ignore_all_dups      # 重複するコマンドは古い方を削除
setopt hist_ignore_space         # スペースで始まるコマンドは履歴に追加しない
setopt hist_reduce_blanks        # 余分な空白を削除
setopt hist_save_no_dups         # 保存時に重複を削除
setopt hist_verify               # 履歴展開時に確認
setopt inc_append_history        # コマンド実行時に即座に履歴に追加
setopt share_history             # 複数のzshセッション間で履歴を共有

# === [改善] 便利なzshオプション ===
# [改善] ディレクトリ操作の改善 (L64-92)
setopt auto_cd                   # ディレクトリ名だけでcd
setopt auto_pushd                # cdしたら自動的にpushdする
setopt pushd_ignore_dups         # pushdの重複を無視

# [改善] 補完機能の強化
setopt auto_list                 # 補完候補を自動でリスト表示
setopt auto_menu                 # TAB連打で補完候補を順に表示
setopt list_packed               # 補完候補を詰めて表示
setopt list_types                # 補完候補にファイルタイプを表示
setopt magic_equal_subst         # =以降でも補完を有効化（--prefix=/usrなど）
setopt complete_in_word          # カーソル位置で補完

# [改善] グロブ機能の強化
setopt extended_glob             # 拡張グロブを有効化
setopt numeric_glob_sort         # 数値のソートを賢く

# === [改善] エディタ設定 ===
# [改善] neovim/vimを優先的にエディタとして設定 (L196-202)
if which nvim &> /dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
elif which vim &> /dev/null; then
  export EDITOR=vim
  export VISUAL=vim
fi
export FCEDIT="$EDITOR"
export SUDO_EDITOR="$EDITOR"

# === [改善] PATH設定 ===
# [改善] 基本的なPATH追加 (L191)
export PATH=~/.local/bin:~/bin:$PATH

# === [改善] CDPATH設定 ===
# 効果: ディレクトリ名だけでgithub.com/ymd000配下のリポジトリに移動可能
# 例: `cd dotfiles` で `~/github.com/ymd000/dotfiles` に移動
export CDPATH=.:~:~/github.com/ymd000

# === [改善] FZF設定 ===
# [改善] FZFのデフォルトオプション (L204)
# 効果: より使いやすいFZFの設定（高さ、ボーダー、キーバインド）
export FZF_DEFAULT_OPTS='--height 50% --reverse --border --bind "tab:down,btab:up,ctrl-j:toggle+down,ctrl-k:toggle" --exact --cycle --no-sort --multi'

# === [改善] 便利なエイリアス ===
# [改善] 基本コマンドの強化 (L681-683)
alias mv='mv -v'
alias cp='cp -v'

# [改善] Git/開発系エイリアス (L684-696)
alias g='git'
alias v='vim'
alias n='nvim'

# [改善] システム管理系 (L691)
alias s='systemctl'

# [改善] 便利なショートカット (L698)
alias path="echo \$PATH | sed 's/:/\\n/g'"

# [改善] 安全な削除コマンド (trash-cli) (L722-725)
# 効果: rmの代わりにゴミ箱に移動（誤削除防止）
if command -v trash-put >/dev/null 2>&1; then
  alias rm='trash-put'
fi

# [改善] exa（modernなls）を使用 (L713-721)
# 効果: カラフルで見やすいファイルリスト表示
if command -v exa >/dev/null 2>&1; then
  alias l='exa -gbl --group-directories-first --time-style long-iso'
  alias la='exa -agbl --group-directories-first --time-style long-iso'
  alias ll='exa -agbl --group-directories-first --time-style long-iso'
else
  alias ll='ls -ahlF --color=auto --group-directories-first'
  alias l=ll
  alias la=ll
fi

# [改善] colordiffを優先 (L726-728)
if command -v colordiff >/dev/null 2>&1; then
  alias diff='colordiff'
fi

# === [改善] 便利な関数 ===
# [改善] tmux ショートカット関数
# 効果: `t n` でtmux new、`t d` でtmux detach、`t a` でtmux attach
function t() {
  case "$1" in
    n|new)
      shift
      tmux new "$@"
      ;;
    d|detach)
      tmux detach
      ;;
    a|attach)
      shift
      tmux attach "$@"
      ;;
    l|ls|list)
      tmux list-sessions
      ;;
    k|kill)
      shift
      tmux kill-session "$@"
      ;;
    *)
      if [ $# -eq 0 ]; then
        tmux
      else
        tmux "$@"
      fi
      ;;
  esac
}

# [改善] FZFでコマンド履歴を選択 (L535-539)
# 効果: Ctrl+R で過去のコマンドを検索・実行
function select-history() {
  BUFFER=$(history -r 1 | fzf --query "$LBUFFER" | sed 's/ *[0-9]* *//')
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N select-history

# [改善] FZFでファイル選択 (L549-562)
# 効果: Ctrl+O でカレントディレクトリのファイルを選択
function select-files() {
  local selected=$(find . -maxdepth 1 -type f 2>/dev/null | fzf)
  if [[ -n "$selected" ]]; then
    LBUFFER="${LBUFFER}${selected}"
  fi
  zle reset-prompt
}
zle -N select-files

# [改善] カレントディレクトリをクリップボードにコピー (L450-457)
function copy-path() {
  local path=$(pwd)
  echo -n $path | clip.exe 2>/dev/null || echo -n $path | xclip -selection clipboard 2>/dev/null || echo $path
  echo "Copied: $path"
}

# === [改善] キーバインド ===
# [改善] Ctrl+R で履歴検索（FZF） (L640)
bindkey '^r' select-history

# [改善] Ctrl+O でファイル選択（FZF） (L639)
bindkey '^o' select-files

# === [改善] 補完設定の強化 ===
# [改善] 補完スタイルの設定 (L742-757)
zstyle ':completion:*' menu select                    # 補完候補をメニューで選択
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # ファイル名を色分け
zstyle ':completion:*' verbose yes                     # 詳細な補完情報を表示
zstyle ':completion:*' use-cache yes                   # 補完結果をキャッシュ
zstyle ':completion:*:descriptions' format '%B%d%b'    # 補完グループの説明
zstyle ':completion:*:warnings' format 'No matches for: %d'  # マッチなしの場合

# === [改善] Python環境管理 ===
# [改善] pyenv設定 (L278-288)
if [ -d ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  if command -v pyenv &> /dev/null; then
    eval "$(command pyenv init -)"
    if [ -d "${PYENV_ROOT}/plugins/pyenv-virtualenv" ]; then
      eval "$(command pyenv virtualenv-init -)"
    fi
  fi
fi

# === [改善] Node.js環境管理 ===
# [改善] pnpm設定 (L211-212)
if [ -d "$HOME/.local/share/pnpm" ]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# === [改善] Go環境設定 ===
# [改善] GOPATH設定 (L265-267)
if command -v go &> /dev/null; then
  export GOPATH=~/.go
  export PATH=$PATH:$GOPATH/bin
fi

# === [改善] Rust環境設定 ===
# [改善] cargo設定 (L244-248)
if [ -d ~/.cargo ]; then
  export PATH=~/.cargo/bin:$PATH
  export RUST_BACKTRACE=1
fi

# === [改善] その他の便利な環境変数 ===
# [改善] Python関連 (L209)
export VIRTUAL_ENV_DISABLE_PROMPT=1  # 仮想環境名をプロンプトに表示しない（P10kが表示するため）

# [改善] その他 (L218)
export NO_AT_BRIDGE=1  # GTKアプリの警告を抑制

# === Claude Code Settings ===
# Claude Code環境変数ファイルのパス設定
export CLAUDE_ENV_FILE="$HOME/.claude_env"

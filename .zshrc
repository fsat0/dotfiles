# Emacsキーバインド
bindkey -e

## PROMPT ##
# PROMPTで変数参照
setopt prompt_subst
prompt_custom() {
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    local git_branch="$(__git_ps1 "\033[36m[%s]\033[0m")"

    case ${UID} in
        0)
            PROMPT="%{[32m%}%m%B%{[31m%}%: ~%{[m%}%b $git_branch
# "
            PROMPT2="%B%{[31m%}%_%{[m%}%b> "
            SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "

            ;;
        *)
            PROMPT="%{[32m%}%n@%m%{[m%}:%{[33m%}%~%{[m%} $git_branch
$ "
            PROMPT2="%{[32m%}%_%{[m%}> "
            # RPROMPT="[%{[33m%}%*%{[m%}]"
            SPROMPT="%{[32m%}%r is correct? [n,y,a,e]:%{[m%} "
            ;;
    esac
}

source ~/.zsh/prompt/git-prompt.sh

precmd() {
  prompt_custom
}

# プロンプトのカラー表示を有効
autoload -U colors
colors

# zsh 依存のコマンドを使う
autoload -U zmv
alias mmv='noglob zmv -W'

########

## 履歴 ##
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 履歴の共有
setopt share_history

# 履歴ファイルに時刻を記録
setopt extended_history

## 補完 ##
# デフォルトの補完機能
autoload -U compinit
compinit

# 補完候補を詰めて表示
setopt list_packed

# 補完候補表示時にbeepを鳴らさない
setopt nolistbeep

# cd でpushd
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# globを拡張する。
setopt extended_glob

# ディレクトリ名だけで移動できる。
setopt auto_cd

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# alias ls="ls --color=auto"
alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias po="popd"
alias hism='(){ history -im "$1" 1}'

# Ctrl+wでスラッシュの前まで削除する
export WORDCHARS=$(echo "${WORDCHARS}|" | sed 's/\///')

# Ctrl+jで
bindkey '^J' backward-word

# 環境依存はzshrc.localを読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load aliases
. "$HOME/.config/fish/functions/aliases.fish"

set -g EDITOR "nvim"
git config --global core.editor vim

direnv hook fish | source
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# pyenv
set -g PYENV_ROOT $HOME/.pyenv
set -g fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status --is-interactive; and source (pyenv init -|psub)

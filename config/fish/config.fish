# Load aliases
. "$HOME/.config/fish/functions/aliases.fish"

set -g EDITOR "nvim"
git config --global core.editor vim

direnv hook fish | source

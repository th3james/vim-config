# Inspired by
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function delete-git-branches -d 'Delete git branches by name'
  argparse 'm/merged' -- $argv
  or return

  set -l git_command 'git branch'
  if string length -q --  $_flag_merged
    set git_command $git_command ' --merged'
  end

  set -l branches_to_delete (
    eval $git_command |
    rg -v '^\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --"
  )
  if string length -q -- $branches_to_delete
    git branch --d $branches_to_delete
  else
    echo "no branches given - exiting"
  end
end

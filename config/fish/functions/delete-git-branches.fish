# Inspired by
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function delete-git-branches -d 'Delete git branches by name' -a arg_1 arg_b
  set -l branches_to_delete (
    git branch | 
    rg -v '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --"
  )
  if string length -q -- $branches_to_delete
    echo "git branch --d '$branches_to_delete'"
  else
    echo "no branches given - exiting"
  end
end

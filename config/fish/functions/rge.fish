function rge -d 'rg search restricted by file extension' -a term extension
  rg "$term" -g "*.$extension"
end

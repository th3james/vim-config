System config
==========

My config setup for my developer tools. Each dir contains
contains config for a tool, which you must symlink to the correct
dir using the ./symlink command

# Pre-requisites
Before running this, you should install:
  
  * Vim (not vi)
  * Oh my ZSH
  * tmux
    * reattach-to-user-namespace (for tmux copy and paste, in homebrew)

# Setup
* Clone the repo into .sys-config:

    git clone git@github.com:th3james/sys-config.git
    mv sys-config ~/.sys-config

* Symlink configs

    ./symlink

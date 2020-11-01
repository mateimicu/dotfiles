# dotfiles managed with GNU Stow``

Install `stow` then run for a specific configuration install
```
stow -v -t "$HOME" git
stow -v -t "$HOME" nvim
stow -v -t "$HOME" tmux
stow -v -t "$HOME" zsh
```

# Get Nvim Working
This was recently done for ubuntu, some changes may be needed for other systems:

* install `node`
* install all fonts from `git@github.com:ryanoasis/nerd-fonts.git` and set the terminal font to `git@github.com:ryanoasis/nerd-fonts.git`

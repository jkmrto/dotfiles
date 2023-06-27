# Dotifles

My personal dofiles

## How to install

The dofiles setup is based on this approach on the [Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles) approach 

- Clone repository with the dotfile configuration
```bash
git clone --bare https://github.com/jkmrto/dotfiles $HOME/.cfg   
```

- Define the alias (`config`) in the current shell scope:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

- Apply the configuration:

```bash
config checkout
```

If any of the config files already exist, you will get this warning:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

You may need to remove them, or move them to a different place in case of wanting to preserve them.

- Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:

```bash
config config --local status.showUntrackedFiles no
```

- Install [antigen](https://github.com/zsh-users/antigen). The plugin manager for zsh
```bash
curl -L git.io/antigen > .zsh/antigen.zsh                        
```

- Install [autojump](https://github.com/wting/autojump)

```bash
brew install autojump
```

- Install neovim throuh asdf:

```bash
asdf add plugin neovim
asdf install neovim 0.9.0
asdf global neovim 0.9.0
```

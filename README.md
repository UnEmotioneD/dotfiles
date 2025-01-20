# My dotfiles

This directory contains the dotfiles for my system

## YouTube References

[Dreams of Autonomy](https://youtu.be/y6XCebnB9gs?list=TLPQMjkxMTIwMjRilRX82JmaPw)

[typecraft](https://www.youtube.com/watch?v=NoFiYOqnC4o&t=122s&pp=ygURdHlwZWNyYWZ0IGdudXN0b3c%3D)

## Requirements

Ensure you have the following installed on your system

### Git

```zsh
brew install git
```

### Stow

```zsh
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```zsh
git clone https://github.com/UnEmotioneD/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```zsh
stow .
```

or move any conflicting files to dotfiles directory with `--adopt` flag

```zsh
stow --adopt .
```

to unlink every symlinks

```zsh
stow -D
```

# dotfiles

## GNU Stow

- [DevOps Toolbox - ~/.dotfiles 101: A Zero to Configuration Hero Blueprint](https://youtu.be/WpQ5YiM7rD4?list=TLPQMTAwMTIwMjbmWEjrqf36uQ)
- [Dreams of AUtonomy - Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs?list=TLPQMTAwMTIwMjbmWEjrqf36uQ)
- [Josean Martinez - How To Easily Manage Your Dotfiles With GNU Stow](https://youtu.be/06x3ZhwrrwA?list=TLPQMTAwMTIwMjbmWEjrqf36uQ)
- [typecraft - NEVER lose dotfiles again with GNU Stow](https://youtu.be/NoFiYOqnC4o?list=TLPQMTAwMTIwMjbmWEjrqf36uQ)

---

### Installation

`git` to clone from github and `stow` to create symlinks

- macOS

```sh
brew install git stow
```

- Arch

```sh
sudo pacman -S git stow
```

- Debian/Ubuntu

```sh
sudo apt install git stow
```

### Clone Repository

clone my dotfiles repository under your home directory

```sh
cd
git clone https://github.com/UnEmotioneD/dotfiles.git
```

### Create Symlinks

```sh
cd dotfiles
```

stow desired directory

for example

`~/dotfiles/nvim/.config/nvim/`

```sh
stow nvim  # from dotfiles/
```

then symlink of `~/.config/nvim` will be created
and you can use my neovim config just like that

---

#### Happy Hacking 🎉

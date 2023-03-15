# Einer's dotfiles

My dotfiles managed with [chezmoi](https://www.chezmoi.io/).

Use this to ensure consistent terminal appearance and sane list of pre-installed software packages on Mac OSX and Linux (still tbd).

## Main Packages

| Tools             | Description                                                                                         |
| ----------------- | --------------------------------------------------------------------------------------------------- |
| Terminal emulator | [iTerm2](https://iterm2.com/)                                                                       |
| Package manager   | [Homebrew](https://brew.sh/)                                                                        |
| Unix shell        | [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)                                   |
| Zsh theme         | [Powerlevel10k](https://github.com/romkatv/powerlevel10k)                                           |
| Dotfiles manager  | [chezmoi](https://chezmoi.io/)                                                                      |

## Getting started on a new machine
With a single command:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply einer
```

### Update

On any machine, you can pull and apply the latest changes from your repo with:

```sh
chezmoi update -v
```

or for short

```
cz update -v
```

## Chezmoi reference

[Chezmoi user guide](https://www.chezmoi.io/user-guide/command-overview/)

## Inspired by
[Jerry's dotfiles](https://github.com/ngshiheng/dotfiles)

[dNitza's dotfiles](https://github.com/dNitza/dotfiles)

[Felipe Santos' dotfiles](https://github.com/felipecrs/dotfiles)

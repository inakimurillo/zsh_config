# zsh_configs

Personal zsh configuration. Works on macOS and Linux.

## Install

Clone into `~/.zsh_configs` and run the installer:

```sh
git clone https://github.com/inakimurillo/zsh_config.git "$HOME/.zsh_configs"
cd "$HOME/.zsh_configs"
./install.sh
```

The installer copies `.zshrc` to `$HOME/.zshrc`. If a `~/.zshrc` already
exists, it is backed up to `~/.zsh_configs/backup/.zshrc.<timestamp>.bak`
before being replaced.

Open a new shell (or `source ~/.zshrc`) to pick up the changes.

## References

For any documentation on the plugins:

https://github.com/ohmyzsh/ohmyzsh

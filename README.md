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

## Set zsh as your default shell

Check that zsh is installed and listed in `/etc/shells`:

```sh
which zsh
grep -qx "$(which zsh)" /etc/shells || echo "$(which zsh)" | sudo tee -a /etc/shells
```

Then change your login shell:

```sh
chsh -s "$(which zsh)"
```

Log out and back in (or open a new terminal) for the change to take effect.
On macOS, zsh is the default since Catalina, so this step is usually only
needed on Linux or older macOS versions.

## References

For any documentation on the plugins:

https://github.com/ohmyzsh/ohmyzsh



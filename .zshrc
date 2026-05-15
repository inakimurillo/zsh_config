export VIRTUAL_ENV_DISABLE_PROMPT=1 # Remove (venv) at the beggining of the command line

### Plugins configuration:
## enable agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding yes 
## set an external helper to ask for the passwords and possibly store them in the system keychain use the helper
# zstyle :omz:plugins:ssh-agent helper ksshaskpass
## load multiple identities use the identities style (this has no effect if the lazy setting is enabled).
# zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
## NOT load any identities on start use the lazy setting
zstyle :omz:plugins:ssh-agent lazy yes
## set the maximum lifetime of the identities
zstyle :omz:plugins:ssh-agent lifetime 4h
## silence the plugin
zstyle :omz:plugins:ssh-agent quiet yes
## pass arguments to the ssh-add command
# zstyle :omz:plugins:ssh-agent ssh-add-args -K -c -a /run/user/1000/ssh-auth
## macOS supports using passphrases s
#ssh-add --apple-use-keychain ~/.ssh/id_rsa ...
## This plugin can be configured to use the keychain when loading using the following:
#zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain

source "$HOME/.zsh_configs/helper/autocompletion.zsh"
source "$HOME/.zsh_configs/theme.zsh"
source "$HOME/.zsh_configs/lib/directories.zsh"
source "$HOME/.zsh_configs/plugins/ssh-agent.plugin.zsh"

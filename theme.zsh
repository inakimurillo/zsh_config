# Standalone prompt theme — no oh-my-zsh required.
# Uses zsh's built-in vcs_info for git/hg branch info and %F{...}/%f for color.

setopt PROMPT_SUBST

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr   "%F{red}●%F{yellow}"
zstyle ':vcs_info:*' unstagedstr "%F{red}●%F{yellow}"
zstyle ':vcs_info:git:*' formats       "%F{yellow}‹%b%c%u› %f"
zstyle ':vcs_info:git:*' actionformats "%F{yellow}‹%b|%a%c%u› %f"
zstyle ':vcs_info:hg:*'  formats       "%F{yellow}‹%b› %f"

_theme_precmd() { vcs_info }
typeset -ag precmd_functions
(( ${precmd_functions[(Ie)_theme_precmd]} )) || precmd_functions+=(_theme_precmd)

_prompt_virtualenv() {
    [[ -n $VIRTUAL_ENV ]] && print -n "%F{green}‹${VIRTUAL_ENV:t}› %f"
}
_prompt_conda() {
    [[ -n $CONDA_DEFAULT_ENV ]] && print -n "%F{green}‹${CONDA_DEFAULT_ENV}› %f"
}

PROMPT='╭─$(_prompt_conda)%B%(!.%F{red}.%F{green})%n@%m%f %F{blue}%~ %f%b${vcs_info_msg_0_}$(_prompt_virtualenv)
╰─%B%(!.#.$)%b '
RPROMPT='%B%(?..%F{red}%? ↵%f)%b'

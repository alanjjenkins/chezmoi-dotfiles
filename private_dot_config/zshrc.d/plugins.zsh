mkdir -p ~/.local/share/zinit
test -d ~/.local/share/zinit/bin || git clone https://github.com/zdharma/zinit.git ~/.local/share/zinit/bin

# Configure zinit
declare -A ZINIT
ZINIT[BIN_DIR]=~/.local/share/zinit/bin
ZINIT[HOME_DIR]=~/.local/share/zinit/

source ~/.local/share/zinit/bin/zinit.zsh

# Sort completion out
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Install tools used by plugins
if command -v fasd &> /dev/null; then
  eval "$(fasd --init auto)"
fi
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Plugins
zinit load Aloxaf/fzf-tab
zinit load alanjjenkins/assume-role-1
zinit load alanjjenkins/zsh-my-aws
zinit load chriskempson/base16-shell
zinit load fabiokiatkowski/exercism.plugin.zsh
zinit load joepvd/zsh-hints
zinit load kiurchv/asdf.plugin.zsh
zinit load macunha1/zsh-terraform
zinit load marzocchi/zsh-notify
zinit load molovo/tipz
zinit load romkatv/powerlevel10k
zinit load softmoth/zsh-vim-mode
zinit load zsh-users/zsh-completions

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions


zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aws/aws.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/fzf/fzf.plugin.zsh'
zinit snippet 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh'

# zinit ice wait
# zinit light unixorn/kubectx-zshplugin

zinit ice lucid wait
zinit load Dbz/kube-aliases

# Kubectl completion
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Kubens and kubectx completion
# if [ -d ~/.asdf/installs/kubectx/0.9.0/completion ]; then
#   source ~/.asdf/installs/kubectx/0.9.0/completion/kubectx.zsh
  # source ~/.asdf/installs/kubectx/0.9.0/completion/kubens.zsh
# fi
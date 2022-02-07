PACKAGES=(
  alacritty
  discord
  gopls
  neovim
  nerd-fonts-complete
  nnn
  slack
  steam
  tmux
  zoxide
)

ASDF_PLUGINS=(
  direnv
  just
  kubectl
  kubectx
  terraform
  tflint
  tfsec
)

INSTALLED_PACKAGES=($(pacman -Q | awk '{ print $1 }'))
TO_INSTALL=()

for package in "${PACKAGES[@]}"; do
  if ! echo "${INSTALLED_PACKAGES[@]}" | grep -q "$package" > /dev/null; then
    TO_INSTALL+=("${package}")
  fi
done

paru -S --noconfirm "${TO_INSTALL[@]}"

ASDF_PLUGINS_INSTALLED=$(asdf plugin list)
ASDF_PLUGINS_TO_INSTALL=$()

for plugin in "${ASDF_PLUGINS[@]}"; do
  if ! echo "${ASDF_PLUGINS_INSTALLED[@]}" | grep -q "$plugin" > /dev/null; then
    asdf plugin add "$plugin"
  fi
done

# install latest versions of asdf tools
ASDF_PLUGINS_INSTALLED=$(asdf plugin list)

for plugin in "${ASDF_PLUGINS_INSTALLED[@]}"; do
  LATEST_VERSION=$(asdf list all "$plugin" | tail -n1)
  asdf install "$plugin" "$LATEST_VERSION"
  asdf global "$plugin" "$LATEST_VERSION"
done

# ensure tmux plugin manager is setup
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

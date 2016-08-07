export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Coreutils installed via brew
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Add .system/bin to path
export PATH="$HOME/.system/bin:$PATH"

for file in $HOME/.system/profile.d/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

[ -r "$HOME/.extra" ] && [ -f "$HOME/.extra" ] && source "$HOME/.extra"

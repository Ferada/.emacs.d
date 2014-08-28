zmodload zsh/complist
autoload -Uz compinit promptinit && compinit && promptinit
# prompt gentoo

autoload edit-command-line
zle -N edit-command-line

autoload zrecompile

zsh_cache=${HOME}/.zsh_cache
mkdir -p $zsh_cache
compinit -d $zsh_cache/zcomp-$HOST
for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
  zrecompile -p $f && rm -f $f.zwc.old
done

setopt extended_glob
for zshrc_snipplet in ~/.zsh.d/[0-9][0-9]*[^~] ; do
  source $zshrc_snipplet
done

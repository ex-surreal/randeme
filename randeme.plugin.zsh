RANDEME=$HOME/.randeme

! [ -f $HOME/.randeme-themes ] && ls $ZSH/themes | sed -n "/\.zsh-theme$/s/.zsh-theme$//p" > $HOME/.randeme-themes

N=$((`wc -l < $HOME/.randeme-themes`))

if [ "$N" -ne "0" ]; then
  n=$(($RANDOM * `date +%S` % $N + 1))
  ZSH_THEME=`sed "${n}q;d" $HOME/.randeme-themes`
  ### Trim leading whitespaces ###
  ZSH_THEME="${ZSH_THEME##*( )}"
  ### trim trailing whitespaces  ##
  ZSH_THEME="${ZSH_THEME%%*( )}"
fi

function randeme_rm {
  grep -v $ZSH_THEME $HOME/.randeme-themes > $HOME/.randeme-themes.temp && mv $HOME/.randeme-themes.temp $HOME/.randeme-themes
  . $HOME/.zshrc
}

function randeme_reset {
  rm -f $HOME/.randeme-themes
}

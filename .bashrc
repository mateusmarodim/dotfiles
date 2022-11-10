#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Include aliases
if [[ -f $HOME/.bash_aliases ]]; then
	. $HOME/.bash_aliases
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if  [[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# if ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [[ ! -a ~/.inputrc ]]; then
  echo '$include /etc/inputrc' > ~/.inputrc;
  echo 'set completion-ignore-case On' >> ~/.inputrc;
fi
pfetch

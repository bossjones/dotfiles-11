#!/bin/bash
echo "== Installing ~/.bashrc ..."
this_dir=$(pwd)

IFS=" "

bashrc_parts=" \
  auto_reload \
  default \
  functions \
  aliases \
  tab_completion \
  ruby_on_rails \
  capistrano \
  golang \
  java \
  android \
  docker \
  database_branches \
  prompt"

# Header
cat > ~/.bashrc <<EOF
# Export path of dotfiles repo
export DOTFILES_PATH="$this_dir"

EOF

for part in $bashrc_parts; do
  if [ "$1" = "copy" ]; then
    # Assemble bashrc from parts
    cat assets/bashrc/$part.sh >> ~/.bashrc
  else
    # Source bashrc from parts
    echo "source \"\$DOTFILES_PATH/bashrc/$part.sh\"" >> ~/.bashrc
  fi
done
echo >> ~/.bashrc

# Footer
cat >> ~/.bashrc <<EOF
# NVM (Node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# YARN (Node)
export PATH="\$PATH:\$HOME/.yarn/bin"

# NPM
export PATH="\$PATH:./node_modules/.bin"

# RVM (Ruby)
[ -s "\$HOME/.rvm/scripts/rvm" ] && source "\$HOME/.rvm/scripts/rvm"
export PATH="\$PATH:\$HOME/.rvm/bin" # Add RVM to PATH for scripting

# SCM Breeze
[ -s "\$HOME/.scm_breeze/scm_breeze.sh" ] && source "\$HOME/.scm_breeze/scm_breeze.sh"

# Hub tab completion
[ -s "\$HOME/.hub.bash_completion" ] && source "\$HOME/.hub.bash_completion"

# Rails Shell
[ -s "\$HOME/.rails_shell/rails_shell.sh" ] && source "\$HOME/.rails_shell/rails_shell.sh"

# GNU utils
PATH="\$PATH:/usr/local/opt/coreutils/libexec/gnubin"

# Dotfiles Scripts
export PATH="\$PATH:$DOTFILES_PATH/bin"

# System Python
export PATH="\$PATH:$HOME/Library/Python/2.7/bin/"

# Node modules in current dir
export PATH="\$PATH:node_modules/.bin"

export PATH="\$PATH:/Users/ndbroadbent/anaconda/bin"
export PATH="\$PATH:/usr/local/opt/imagemagick@6/bin"
export PATH="\$PATH:\$(brew --prefix qt@5.5)/bin"

# Finalize auto_reload sourced files
finalize_auto_reload
EOF


# If this script was sourced from the terminal, update current shell
if ! [[ "$0" =~ "dev_machine_setup.sh" ]] && [[ "$0" == *bash ]]; then source ~/.bashrc; fi

IFS=$' \t\n'

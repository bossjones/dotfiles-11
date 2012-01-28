#!/bin/bash
if [ "$(basename $(pwd))" = "setup" ]; then . _shared.sh; else . setup/_shared.sh; fi;

if [ -n "$GIT_REPO_DIR" ]; then
  install_to="$GIT_REPO_DIR"
else
  install_to="$HOME/code"
fi

mkdir -p "$install_to"

(
  # Update or clone
  if [ -d "$install_to/scm_breeze" ]; then
    cd "$install_to/scm_breeze" && git pull origin master
  else
    git clone git://github.com/ndbroadbent/scm_breeze.git "$install_to/scm_breeze"
    cd "$install_to/scm_breeze"
  fi

  # Run SCM Breeze install script
  ./install.sh
)

#!/bin/bash
for plugin in $(git remote | grep -v origin); do
  git subtree pull --prefix vim/.vim/bundle/$plugin $plugin master --squash
done

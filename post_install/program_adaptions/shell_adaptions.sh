#!/bin/bash

# Change default shell to zsh
chsh -s /usr/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add adaptions to .basrhc and .zshrc (after oh-my-zsh!)
cat $PROGRAM_ADAPT_DIR/.shellrc_custom >> $HOME/.bashrc
cat $PROGRAM_ADAPT_DIR/.shellrc_custom >> $HOME/.zshrc
cat $PROGRAM_ADAPT_DIR/.bashrc_custom >> $HOME/.bashrc
cat $PROGRAM_ADAPT_DIR/.zshrc_custom >> $HOME/.zshrc

# docker-compose completion for bash
sudo curl -L https://raw.githubusercontent.com/docker/compose/$DOCKER_COMPOSE_VERSION/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

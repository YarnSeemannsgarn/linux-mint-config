#!/bin/bash

# Add adaptions to .basrhc and .zshrc
cat $PROGRAM_ADAPT_DIR/.shellrc >> $HOME/.bashrc
cat $PROGRAM_ADAPT_DIR/.shellrc >> $HOME/.zshrc

# Change default shell to zsh
chsh -s /usr/bin/zsh

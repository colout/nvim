# Installation

1. The usual.  Just clone to ~/.config/nvim
2. Lazy will install all the missing plugins.
3. Might ne to restart neovim
4. Create a ~/.config/nvim/get_secret.sh (see below)

# get_secret.sh

This should be a bash script that responds with your secret based on the input. 

## Valid inputs

* `anthropic` - Return the anthropic api key
* `chatgpt` - Return the openai chatgpt key

## Security

You should store the secret in a secure way using a local os vault.

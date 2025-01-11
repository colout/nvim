# My Neovim Config

## Installation

1. The usual.  Just clone to ~/.config/nvim
2. Lazy will install all the missing plugins.  Might need to troubleshoot some errors (like by install luarocks).
3. Restart neovim and check that you you have all the OS dependencies installed. I'm not going to list them here, but you can run :checkhealth in neovim to see what's missing.
4. Create a ~/.config/nvim/get_secret.sh (see below)

## get_secret.sh

This should be a bash script that responds with your secret based on the input. I keep this as a general wrapper and git ignored so I can be flexable with all the OS's I run nvim on (macos, arch (btw), nixos (btw, btw), android termux, whatever remote server I connect to, etc)

### Valid inputs

* `anthropic` - Return the anthropic api key
* `chatgpt` - Return the openai chatgpt key

### Security

You should store the secret in a secure way using a local os vault.

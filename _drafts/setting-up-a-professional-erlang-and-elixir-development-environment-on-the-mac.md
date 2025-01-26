---
layout: post
categories:
- elixir
- erlang
- setup
date: 09/08/2020 9:37 AM +0000
title: Setting up a professional Erlang and Elixir development environment on the
  Mac

---
## Here are our objectives 

1. Install [homebrew](https://brew.sh/)
2. Install [asdf](https://github.com/asdf-vm/asdf) via homebrew
3. Install [openssl](https://www.openssl.org/) via homebrew
4. Install [erlang](https://www.erlang.org) via asdf
5. Install [elixir](https://elixir-lang.org) via asdf
6. Install [direnv](https://direnv.net)using homebrew
7. Install direnv hooks to shell 
8. Install asdf hooks to shell
9. Add asdf shims path to shell (for when you install utils via elixir or python package managers)

Once we've successfully performed this process once we will be able to install any combination of Erlang and Elixir we please.

----

## Run the installer script

Execute this all in one script to install Elixir and Erlang on OSX 

```elixir
#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install asdf

DIRENV_CONF='eval "$(direnv hook zsh)"'

ASDF_CONF=$(
cat <<EOF
export ASDF_DIR="$(brew --prefix asdf)"
. ${ASDF_DIR}/asdf.sh
export PATH=$PATH:~/.asdf/shims/
EOF
)

case $0 in
bash)
echo $DIRENV_CONF >> ~/.bashrc
echo $ASDF_CONF >> ~/.bashrc
;;
-zsh)
echo $DIRENV_CONF >> ~/.zshrc
echo $ASDF_CONF  >> ~/.zshrc
;;
zsh)
echo $DIRENV_CONF >> ~/.zshrc
echo $ASDF_CONF >> ~/.zshrc
;;
esac

eval $ASDF_CONF
eval $DIRENV_CONF

brew install openssl
SSLPATH=$(brew --prefix openssl)
KERL_ADD="export KERL_CONFIGURE_OPTIONS=--with-ssl=${SSLPATH}"

case $0 in
bash)
echo $KERL_ADD >> ~/.bashrc
;;
-zsh)
echo $KERL_ADD >> ~/.zshrc
;;
zsh)
echo $KERL_ADD >> ~/.zshrc
;;
esac

asdf plugin-add erlang
asdf plugin-add elixir
asdf install erlang 23.0.3
asdf install elixir 1.10.4-otp-23
asdf global erlang 23.0.3
asdf global elixir 1.10.4-otp-23
```

So what you will now have is a file `~/.tool-versions`, just for context, lets see what's in mine.

```
% cat ~/.tool-versions
elixir 1.10.4-otp-23
erlang 23.0.3
golang 1.13.1
kubectl 1.19.0-rc.1
nodejs 10.13.0
minikube 1.11.0
python 3.7.5
ruby 2.6.3
rust 1.36.0
```

If you are to run a command like `asdf local erlang 23.0.2` and you have already installed erlang 23.0.2 a file `.tool-versions` will be created in the current directory, now anytime you change into to this directory and execute `erl` you'll be using erlang 23.0.2.


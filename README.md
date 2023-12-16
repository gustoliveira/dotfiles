# Dotfiles

Repo to store my dotfiles for specific configurations to some programs.

## Symlink
Symlink is a type of file in Linux that points to another file or a folder on your computer. Check [this](https://www.freecodecamp.org/news/symlink-tutorial-in-linux-how-to-create-and-remove-a-symbolic-link/) for more info.

1. .bash_aliases
```
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
```

2. nvim
```
ln -s $PWD/dotfiles/nvim $HOME/.config/nvim
```

## Instalations

### Basic
```
sudo apt install git curl
sudo apt install xclip exa ripgrep
sudo apt install gcc g++ build-essential
sudo apt install python3 python3-pip
```

### Neovim

#### Install
```
sudo apt install nvim
```

#### vim-plug
[vim-plug repository](https://github.com/junegunn/vim-plug?tab=readme-ov-file#neovim)

[Instalation for neovim on linux](https://github.com/junegunn/vim-plug?tab=readme-ov-file#neovim)

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

After installing vim-plug, open a nvim session and run
```
:PlugInstall
```

#### LSPs
Check [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) repository to understand more about the LSP instalation.
In order to install a LSP for a language, is necessary to install the language before. Check **asdf** bellow.

#### - Flutter
Will be with the dart instalation. Check [dart-lang LSP repository](https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec)

#### - Ruby
Check [Shopify LSP](https://shopify.github.io/ruby-lsp/)

```
gem install ruby-lsp
```

### asdf
#### Instalation
[Gettings Started](https://asdf-vm.com/guide/getting-started.html)
1. Clone asdf official repository, change the branch to the lastest version:
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
```

3. Add the following to `~/.bashrc`:
```
. "$HOME/.asdf/asdf.sh"
```

4. Restart your shell so that PATH changes take effect. Opening a new terminal tab will usually do it.

#### Installing a tool
1. Install the tool plugin.
In order to install a tool, is necessary to install the tool plugin before. All the plugins can be listed with the following command:
```
asdf plugin list all
```
To facilitate, echo the output of this command to a file and use grep to search for the plugin.

2. Add the plugin
```
asdf plugin add <name> <git-url>
# asdf plugin add elm https://github.com/vic/asdf-elm
```

3. See all version available for the plugin
```
asdf list all <plugin-name>
```

4. Install the tool
```
asdf list all <plugin-name> latest
asdf list all <plugin-name> <version>
```

5. Set the version
```
asdf global <plugin-name> <version>
asdf local <plugin-name> <version>
```

Install versions for **Flutter**, **Ruby**.

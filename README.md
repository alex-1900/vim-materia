# Vim Materia
The materia vim configuration

![Preview](https://user-images.githubusercontent.com/49949411/103734569-377fc880-5027-11eb-8760-9051c9d207bb.gif)

# Get start
If you're using vim, link or copy the `init.vim` to `~/.vimrc`, and then, just open your vim/neovim, This will install all plugins (more than 50) into `bundles` directory.

After all plugins are installed, You need to restart your vim/nvim.

## Requirements
This configure requires Python3, If `:echo has("python3")` returns `1`, then you're done.

Enable Python3 interface with pip:
```sh
pip3 install --user pynvim
```

And the following optional dependencies:
- Silver searcher (Ag) for text searching:
https://github.com/ggreer/the_silver_searcher

- Ripgrep (Rg), A line-oriented search tool:
https://github.com/BurntSushi/ripgrep

- Bat, supports syntax highlighting for a large number of programming and markup languages:
https://github.com/sharkdp/bat

You also need to install a `Powerline font` to display Unicode icons, I’m using the [`SourceCodePro`](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip), You can find other fonts at https://github.com/ryanoasis/nerd-fonts

### coc-clangd
Need to install [`clangd language server.`](https://github.com/clangd/clangd) to get C/C++/Objective-C surport. Please read the [Quick Start](https://github.com/clangd/coc-clangd#quick-start) section and the clangd document about [Project setup](https://clangd.llvm.org/installation.html#project-setup).

Note that [SIP Issue](https://github.com/rizsotto/Bear/issues/108) for `MacOS` users.

# Configure
This object requires more than 50 plugins, and many configuration options, You have two ways to change, add or disable them:
### The `config.json`
The`config.default.json` is used to generate the default options, and you can create a file called `config.json` to replicate it. For example:
```json
{
  "environment": {
    "http_proxy": "'http://localhost:1087'",
    "https_proxy": "'http://localhost:1087'"
  },
  "parts": {
    "vim_virtualenv": {
      "directory": "/Users/alex/envs/vim-materia"
    }
  }
}
```
`Materia` will merge the `config.json` with `config.default.json` (merge objects and replace others).

### The `custom` directory
If you want to add plugins or make more complex custom settings, You can add your own vimscript in the `custom/main.vim` to add or override the default options and settings.

## Plugins management
Materia manages plugins in a unified way, ensure that you will not add the same plugin repeatedly:
```vim
" custom/main.vim

let nord_vim = {'id': 'nord_vim', 'directory': 'nord-vim'}

if materia#config#get('options.colorscheme') == 'nord'
  function! nord_vim.config()
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_status_lines = 1
    let g:nord_bold = materia#config#get('parts.nord_vim.bold')
    let g:nord_italic = materia#config#get('parts.nord_vim.italic')
  endfunction

  function! nord_vim.listener()
    colorscheme nord
    call airline#switch_theme('nord')
  endfunction
endif

function! nord_vim.install(install)
  call a:install('arcticicestudio/nord-vim')
endfunction

call materia#part#add(nord_vim)
```

In config.json you should:
```json
{
  "options": {
    "colorscheme": "nord"
  },
  "parts": {
    "nord_vim": {
      "bold": 0,
      "italic": 1
    }
  }
}
```
You can change the json field `parts.nord_vim.disable` to enable/disable this theme.

# Mixed
Some records are used to simplify your setup.
## proxies
- node/npm/yarn
```sh
npm config set proxy http://username:password@host:port
npm config set https-proxy http://username:password@host:port

yarn config set proxy http://username:password@host:port
yarn config set https-proxy http://username:password@host:port
```
remove proxy
```sh
npm config rm proxy
npm config rm https-proxy

npm config delete proxy
npm config delete https-proxy
```

- git
```sh
git config --global http.proxy http://username:password@host:port
```
remove proxy
```sh
git config --global --unset http.proxy
```

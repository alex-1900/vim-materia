# Vim Materia
The materia vim configuration

![18DE2130-7759-4C7F-9758-4977C1B901D9](https://user-images.githubusercontent.com/49949411/103442207-233a7500-4c8f-11eb-9f81-0d0f6b66c72e.png)

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
  "packages": {
    "vim_virtualenv": {
      "directory": "/Users/alex/envs/vim-materia"
    },
    "vim_floaterm": {
      "disable": 1
    }
  }
}
```
`Materia` will merge the `config.json` with `config.default.json` (merge objects and replace others).

### The `custom` directory
If you want to add plugins or make more complex custom settings, You can add your own vimscript in the `custom/main.vim`.

## Plugins management
Materia manages plugins in a unified way, ensure that you will not add the same plugin repeatedly:
```vim
let nord_vim = {'name': 'nord-vim'}

if materia#conf('options.colorscheme') == 'nord'
  function! nord_vim.config()
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_status_lines = 1
    let g:nord_bold = 0
    let g:nord_italic = 1
  endfunction

  function! nord_vim.listener()
    colorscheme nord
    call airline#switch_theme('nord')
  endfunction
endif

function! nord_vim.install(install)
  call a:install('arcticicestudio/nord-vim', { 'branch': 'develop' })
endfunction

call materia#packages#add('nord_vim', nord_vim)
```

In config.json you should:
```json
{
  "options" {
    "colorscheme": "nord"
  },
  "packages": {
    "nord_vim": {}
  }
}
```
And then, you can change the json field `packages.nord_vim.disable` to enable/disable this theme.

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

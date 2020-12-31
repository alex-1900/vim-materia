# vim-materia
The materia vim configuration

![F7F0CBB1-EF6A-49AA-A6F5-F2D38B8DDB5C](https://user-images.githubusercontent.com/49949411/103366286-2a317e00-4afd-11eb-8dbd-54aa91d125cb.png)

## First Try
If you're using vim, link or copy the `init.vim` to `~/.vimrc`, and then, just open your vim/neovim, This will install all plugins (more than 50) into `bundles` directory.

After all plugins are installed, You need to restart your vim/nvim.

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

## Alacritty
https://github.com/alacritty/alacritty

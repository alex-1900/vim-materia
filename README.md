# vim-materia
The materia vim configuration

![07B82751-8CD0-402A-8EDA-FE7BEA159019](https://user-images.githubusercontent.com/49949411/103300187-44a22380-4a39-11eb-9bd6-f6f94d5939a9.png)

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

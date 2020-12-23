# vim-materia
The materia vim configuration

![64DC80E8-3370-4B26-8BE9-45F48C1AF9BB](https://user-images.githubusercontent.com/49949411/103017554-bfbd9280-457e-11eb-9f50-122e7eb44881.png)

## First Try
If you're using vim, link or copy the `init.vim` to `~/.vimrc`, and then, just open your vim/neovim, This will install all plugins (more than 50) into `bundles` directory.

After all plugins are installed, You need to restart your vim/nvim.

## proxies
- node/npm
```sh
npm config set proxy http://username:password@host:port
npm config set https-proxy http://username:password@host:port
```
remove proxy
```sh
npm config rm proxy
npm config rm https-proxy
```

- git
```sh
git config --global http.proxy http://username:password@host:port
```
remove proxy
```sh
git config --global --unset http.proxy
```

# automemories-vim
The automemories vim configuration

![1608634495(1)](https://user-images.githubusercontent.com/49949411/102881131-5dce3180-4487-11eb-8394-eeccdd99fc3b.png)

## First Try
If you're using vim, link or copy the `init.vim` to `~/.vimrc`

and then, just open your vim/neovim, there will be install all the plugins (more than 50) to the `bundles`.

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

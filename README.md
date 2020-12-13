# automemories-vim
The automemories vim configure

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

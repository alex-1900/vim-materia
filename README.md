# automemories-vim
The automemories vim configure

![E96DB16C-1CA9-40AB-B091-6E1E14CE2562](https://user-images.githubusercontent.com/49949411/102719208-bf778a00-4327-11eb-863a-3dbe01216be0.png)

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

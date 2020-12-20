# automemories-vim
The automemories vim configure

![1B99064E-6DF3-41E8-9B02-98AC15E932D2](https://user-images.githubusercontent.com/49949411/102719343-82f85e00-4328-11eb-8bde-88151bdc5d0a.png)

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

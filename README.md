# go-vim Docker image
This Docker image adds [Go](https://golang.org/) tools and the following vim plugins to the [official Go image](https://registry.hub.docker.com/_/golang/):

* [vim-go](https://github.com/fatih/vim-go)
* [tagbar](https://github.com/majutsushi/tagbar)
* [neocomplete](https://github.com/Shougo/neocomplete)
* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [vim-airline](https://github.com/bling/vim-airline)
* [fugitive.vim](https://github.com/tpope/vim-fugitive)
* [NERD Tree tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [undotree](https://github.com/mbbill/undotree)
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)

## Usage

Run this image from within your go workspace. You can than edit your project using `vim`, and usual go commands: `go build`, `go run`, etc. 

```
cd your/go/workspace
docker run --rm -tiv `pwd`:/go mbrt/golang-vim-dev
```

## Limitations

This image lacks [gdb](https://golang.org/doc/gdb) support. If anyone has managed to get it working on this image, please let me know (breakpoints are not working for me).

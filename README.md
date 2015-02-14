# go-vim Docker image
This Docker image adds [Go](https://golang.org/) tools and [vim-go](https://github.com/fatih/vim-go) to the [official Go image](https://registry.hub.docker.com/_/golang/).

## Usage

Run this image from within your go workspace. You can than edit your project using `vim`, and usual go commands: `go build`, `go run`, etc. 

```
cd your/go/workspace
docker run --rm -t -i -v `pwd`:/go mbrt/golang-vim-dev
```

## Limitations

This image lacks [gdb](https://golang.org/doc/gdb) support. If anyone has managed to get it working on this image, please let me know (breakpoints are not working for me).

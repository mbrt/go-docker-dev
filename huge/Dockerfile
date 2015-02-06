FROM golang:1.4.1-wheezy
MAINTAINER Michele Bertasi version: 0.1

ADD vimrc /.vimrc

RUN echo 'APT::Default-Release "stable";' > /etc/apt/apt.conf.d/default-release     && \
    echo 'deb http://http.debian.net/debian jessie main' >> /etc/apt/sources.list   && \
    apt-get update
    apt-get install -y -t testing vim vim-youcompleteme vim-addon-manager           && \
        exuberant-ctags                                                             && \
    vim-addon-manager install youcompleteme
    mkdir -p ~/.vim/bundle/Vundle.vim                                               && \
    cd ~/.vim/bundle                                                                && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git                    && \
    git clone --depth 1 https://github.com/fatih/vim-go.git                         && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git                    && \
    vim +PluginInstall +GoInstallBinaries +qall                                     && \
    go get golang.org/x/tools/cmd/godoc                                             && \
    mv /go/bin/* /usr/src/go/bin                                                    && \
    rm -rf /go/src/* /go/pkg                                                        && \
    rm -rf Vundle.vim/.git vim-go/.git tagbar/.git                                  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

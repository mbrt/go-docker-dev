FROM golang:1.4.1-wheezy
MAINTAINER Michele Bertasi version: 0.1

ENV GOBIN /usr/src/go
ADD vimrc /.vimrc

RUN apt-get update                                                      && \
    apt-get install -y vim exuberant-ctags                              && \
    mkdir -p ~/.vim/bundle/Vundle.vim                                   && \
    cd ~/.vim/bundle                                                    && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git        && \
    git clone --depth 1 https://github.com/fatih/vim-go.git             && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git        && \
    vim +PluginInstall +GoInstallBinaries +qall                         && \
    rm -rf Vundle.vim/.git vim-go/.git tagbar/.git                      && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

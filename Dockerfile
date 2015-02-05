FROM golang:1.4.1-wheezy
MAINTAINER Michele Bertasi version: 0.1

ENV GOBIN /usr/src/go
ADD vimrc /.vimrc

RUN apt-get update                                                      && \
    apt-get install -y vim                                              && \
    mkdir -p ~/.vim/autoload ~/.vim/bundle                              && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    cd ~/.vim/bundle                                                    && \
    git clone --depth 1 https://github.com/fatih/vim-go.git             && \
    vim +GoInstallBinaries                                              && \
    rm -rf vim-go/.git                                                  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

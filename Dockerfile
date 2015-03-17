FROM golang:1.4.2-wheezy
MAINTAINER Michele Bertasi

ENV HOME /root
ADD fs/ /

RUN apt-get update                                                      && \
    apt-get install -y ncurses-dev libtolua-dev exuberant-ctags         && \
    ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
    cd /tmp                                                             && \
    hg clone https://code.google.com/p/vim/                             && \
    cd vim                                                              && \
    ./configure --with-features=huge --enable-luainterp                    \
        --enable-gui=no --without-x --prefix=/usr                       && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim74                             && \
    make install                                                        && \
    mkdir -p ~/.vim/bundle                                              && \
    cd  ~/.vim/bundle                                                   && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git        && \
    git clone --depth 1 https://github.com/fatih/vim-go.git             && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git        && \
    git clone --depth 1 https://github.com/Shougo/neocomplete.vim.git   && \
    git clone --depth 1 https://github.com/scrooloose/nerdtree.git      && \
    git clone --depth 1 https://github.com/bling/vim-airline.git        && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive.git       && \
    git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git  && \
    vim +PluginInstall +GoInstallBinaries +qall                         && \
    go get golang.org/x/tools/cmd/godoc                                 && \
    mv /go/bin/* /usr/src/go/bin                                        && \
    rm -rf /go/src/* /go/pkg                                            && \
    rm -rf Vundle.vim/.git vim-go/.git tagbar/.git neocomplete.vim/.git && \
    rm -rf nerdtree/.git vim-airline/.git vim-fugitive/.git             && \
    rm -rf vim-nerdtree-tabs/.git                                       && \
    apt-get remove -y ncurses-dev                                       && \
    apt-get autoremove -y                                               && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

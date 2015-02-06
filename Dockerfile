FROM golang:1.4.1-wheezy
MAINTAINER Michele Bertasi version: 0.1

ENV GOBIN /usr/src/go
ADD vimrc /.vimrc

RUN apt-get update                                                      && \
    apt-get install -y vim                                              && \
    mkdir -p ~/.vim/bundle/Vundle.vim                                   && \
    cd ~/.vim/bundle                                                    && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git        && \
    cd ~/.vim/bundle                                                    && \
    git clone --depth 1 https://github.com/fatih/vim-go.git             && \
    vim +PluginInstall +qall                                            && \
    vim +GoInstallBinaries +qall                                        && \
    rm -rf ~/.vim/bundle/Vundle.vim/.git                                && \
    rm -rf vim-go/.git                                                  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# to install YouCompleteMe
# see http://christopherpoole.github.io/setting-up-vim-with-YouCompleteMe/
# glibc >= 2.14
echo 'APT::Default-Release "stable";' > /etc/apt/apt.conf.d/default-release
echo 'deb http://http.debian.net/debian jessie main' >> /etc/apt/sources.list
apt-get update
apt-get -t testing install libc-dev
# compile vim
apt-get install ncurses-dev
cd /tmp
hg clone https://vim.googlecode.com/hg/ vim
./configure --prefix=/usr --enable-pythoninterp
make install
apt-get autoremove ncurses-dev
# install YouCompleteMe
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh

# add Plugin 'Valloric/YouCompleteMe' to .vimrc

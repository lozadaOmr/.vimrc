get-current-vimrc:
	cat ~/.vimrc > .vimrc

setup:
	-cat .vimrc > ~/.vimrc
	-make install-plugin

install-plugin:
	vim +PluginInstall +qall

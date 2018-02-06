
PREFIX ?= /usr

all:
	@echo Run \'make install\' to install  bashmultitool.

install:

	@echo 'Installing bashmultitool'
	@echo 'Making directory...'
	@mkdir -vp $(PREFIX)/lib/bashmultitool/
	@mkdir -vp $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'Installing library file...'
	@cp -vp lib/bashmultitool $(PREFIX)/lib/bashmultitool/
	
	@echo 'Installing Readme...'
	@cp -vp README.md  $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'DONE!'




PREFIX ?= /usr

all:
	@echo Run \'make install\' to install  bashmultitool.

install:

	@echo 'Installing bashmultitool'
	@echo 'Making directory...'
	@mkdir -vp $(PREFIX)/lib/bashmultitool/
	@mkdir -vp $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'Installing software...'
	@cp -vp lib/* $(PREFIX)/lib/bashmultitool/
	@cp -vp bashmultitool.sh $(PREFIX)/bin
	@chmod 755 $(PREFIX)/bin/bashmultitool.sh
	
	@echo 'Installing Documentation...'
	@cp -vp README.md  $(PREFIX)/share/doc/bashmultitool/
	@cp -vp documentation/*  $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'DONE!'



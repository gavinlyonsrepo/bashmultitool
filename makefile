
PREFIX ?= /usr

all:
	@echo Run \'make install\' to install  bashmultitool.
	@echo 'or'
	@echo Run \'make uninstall\' to uninstall  bashmultitool.

install:

	@echo 'Installing bashmultitool ... '
	@echo 'Making directory...'
	@mkdir -vp $(PREFIX)/lib/bashmultitool/
	@mkdir -vp $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'Installing software...'
	@cp -vp lib/* $(PREFIX)/lib/bashmultitool/
	@cp -vp main/bashmultitool $(PREFIX)/bin
	@chmod 755 $(PREFIX)/bin/bashmultitool
	
	@echo 'Installing Documentation...'
	@cp -vp README.md  $(PREFIX)/share/doc/bashmultitool/
	@cp -vp documentation/bmt*  $(PREFIX)/share/doc/bashmultitool/
	
	@echo 'DONE!'

uninstall:
	@echo 'uninstalling bashmultitool ... '
	@echo 'uninstalling software...'
	@rm -vf $(PREFIX)/bin/bashmultitool
	@rm -vf $(PREFIX)/lib/bashmultitool/bmt*
	@echo 'uninstalling Documentation...'
	@rm -vf $(PREFIX)/share/doc/bashmultitool/*.md
	@echo 'DONE!'

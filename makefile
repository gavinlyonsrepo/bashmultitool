
PREFIX ?= /usr

all:
	@echo Run \'make install\' to install  bashmultitool.

install:
	@echo 'Installing bashmultitool'
	@echo 'Making directory...'
	@mkdir -vp $(PREFIX)/lib/bashmultitool/
	
	@echo 'Installing library file...'
	@cp -vp lib/bashmultitool $(PREFIX)/lib/bashmultitool/
	
	@echo 'DONE!'



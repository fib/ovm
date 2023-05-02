PREFIX ?= /usr

all:
	@echo install, uninstall

install:
	@install -Dm755 ovm.sh ${PREFIX}/bin/ovm

uninstall:
	@rm -f ${PREFIX}/bin/ovm

#  A quick and dirty Makefile to download/build and install
#
#  Usage:
#    make
#    sudo make install

# lib name, version
LIBNAME=openssl
VERSION=1.0.0a
SOURCE=$(LIBNAME)-$(VERSION)
# download location and format
BASE_URL=http://www.openssl.org/source
ARCHIVE=$(SOURCE).tar.gz
# configuration settings
# TODO: need to fix $(CC) and $(CFLAG) to take passed SDK settings

RETRIEVE_TOOL=curl
RETRIEVE_TOOL_FLAGS=-Ls --output $(ARCHIVE)
ARCHIVE_TOOL=tar
ARCHIVE_TOOL_FLAGS=xf

LIBDYLIB=$(SOURCE)/src/.libs/lib$(LIBNAME).dylib

CLEAN_FILES=$(ARCHIVE) $(SOURCE)

all: $(LIBDYLIB)

$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(SOURCE): $(ARCHIVE)
	-rm -rf $(SOURCE)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(ARCHIVE)
	cd $(SOURCE); ./Configure darwin-i386-cc zlib no-asm no-krb5 shared --openssldir=/usr/local/xbmc-ios-4.1
	cd $(SOURCE); patch -p1 < ../01-build-armv7.patch

$(LIBDYLIB): $(SOURCE)
	make -C $(SOURCE)

install:
	sudo make -C $(SOURCE) install

clean:
	make -C $(SOURCE) clean

distclean::
	rm -rf $(SOURCE)

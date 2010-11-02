#  A quick and dirty Makefile to download/build and install
#
#  Usage:
#    make
#    sudo make install

# lib name, version
LIBNAME=fontconfig
VERSION=2.6.0
SOURCE=$(LIBNAME)-$(VERSION)
# download location and format
BASE_URL=http://fontconfig.org/release
ARCHIVE=$(SOURCE).tar.gz
# configuration settings 
# crap, with-freetype-config need prefix path which is set in configure-atv.sh
CONFIGURE=--host=arm-apple-darwin --enable-shared=yes --with-arch=arm --enable-libxml2 --disable-docs --with-freetype-config=/usr/local/xbmc-ios-4.1/bin/freetype-config CFLAGS="-Wl,-read_only_relocs,suppress"

RETRIEVE_TOOL=curl
RETRIEVE_TOOL_FLAGS=-Ls --output $(ARCHIVE)
ARCHIVE_TOOL=tar
ARCHIVE_TOOL_FLAGS=xf

LIBDYLIB=$(SOURCE)/.libs/lib$(LIBNAME).dylib

CLEAN_FILES=$(ARCHIVE) $(SOURCE)

all: $(LIBDYLIB)

$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(SOURCE): $(ARCHIVE)
	-rm -rf $(SOURCE)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(ARCHIVE)
	cd $(SOURCE); patch -p1 < ../01-fontconfig-cross-compile-fix.patch
	cd $(SOURCE); autoreconf -vif; automake
	cd $(SOURCE); ../../configure-atv.sh $(CONFIGURE)

$(LIBDYLIB): $(SOURCE)
	make -C $(SOURCE)

install:
	sudo make -C $(SOURCE) install

clean:
	make -C $(SOURCE) clean

distclean::
	rm -rf $(SOURCE)


#(cd $<; $(HOSTCC) LIBXML2_CFLAGS=`xml2-config --cflags` LIBXML2_LIBS=`xml2-config --libs` ./configure $(HOSTCONF) --with-cache-dir=/usr/X11/var/cache/fontconfig --with-confdir=/usr/X11/lib/X11/fonts --with-default-fonts=/System/Library/Fonts --with-add-fonts=/Library/Fonts,~/Library/Fonts --prefix=$(PREFIX) --with-freetype-config=$(PREFIX)/bin/freetype-config --with-arch=$(ARCH) --enable-libxml2 --disable-docs && make && make install-exec && (cd fontconfig ; make install-data) && cp fontconfig.pc $(PKG_CONFIG_LIBDIR))
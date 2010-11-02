#  A quick and dirty Makefile to download/build and install
#
#  Usage:
#    make
#    sudo make install

# lib name, version
LIBNAME=samba
VERSION=3.3.14
SOURCE=$(LIBNAME)-$(VERSION)
# download location and format
BASE_URL=http://us1.samba.org/samba/ftp/stable
ARCHIVE=$(SOURCE).tar.gz
# configuration settings
CONFIGURE=--host=arm-apple-darwin10 --enable-shared=yes samba_cv_CC_NEGATIVE_ENUM_VALUES=yes --with-fhs --without-cluster-support --disable-swat --without-ldap CFLAGS="-read_only_relocs suppress"

RETRIEVE_TOOL=curl
RETRIEVE_TOOL_FLAGS=-Ls --output $(ARCHIVE)
ARCHIVE_TOOL=tar
ARCHIVE_TOOL_FLAGS=xf

LIBDYLIB=$(SOURCE)/source/(LIBNAME).dylib

CLEAN_FILES=$(ARCHIVE) $(SOURCE)

all: $(LIBDYLIB)

$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(SOURCE): $(ARCHIVE)
	-rm -rf $(SOURCE)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(ARCHIVE)
	cd $(SOURCE)/source; ../../../configure-atv.sh $(CONFIGURE)

$(LIBDYLIB): $(SOURCE)
	make -C $(SOURCE)/source

install:
	sudo make -C $(SOURCE)/source install

clean:
	make -C $(SOURCE)source clean

distclean::
	rm -rf $(SOURCE)

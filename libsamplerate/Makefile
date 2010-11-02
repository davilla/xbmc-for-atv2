#  A quick and dirty Makefile to download/build and install
#
#  Usage:
#    make
#    sudo make install

# lib name, version
LIBNAME=libsamplerate
VERSION=0.1.7
SOURCE=$(LIBNAME)-$(VERSION)
# download location and format
BASE_URL=http://www.mega-nerd.com/SRC
ARCHIVE=$(SOURCE).tar.gz
# configuration settings
CONFIGURE=--host=arm-apple-darwin --enable-shared=yes --disable-sndfile --disable-fftw

RETRIEVE_TOOL=curl
RETRIEVE_TOOL_FLAGS=-Ls --output $(ARCHIVE)
ARCHIVE_TOOL=tar
ARCHIVE_TOOL_FLAGS=xf

LIBDYLIB=$(SOURCE)/.libs/$(LIBNAME).dylib

CLEAN_FILES=$(ARCHIVE) $(SOURCE)

all: $(LIBDYLIB)

$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(SOURCE): $(ARCHIVE)
	-rm -rf $(SOURCE)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(ARCHIVE)
	cd $(SOURCE); patch -p1 < ../01-libsamplerate-arm.patch
	cd $(SOURCE); ../../configure-atv.sh $(CONFIGURE)

$(LIBDYLIB): $(SOURCE)
	make -C $(SOURCE)

install:
	sudo make -C $(SOURCE) install

clean:
	make -C $(SOURCE) clean

distclean::
	rm -rf $(SOURCE)

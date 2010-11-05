#  A quick and dirty Makefile to configure xbmc
#

include ../config.mk

# configuration settings
CONFIGURE=./configure --prefix=$(PREFIX) --host=$(HOST) --with-arch=arm --with-cpu=cortex-a8 --enable-external-python --enable-gles --disable-pulse --disable-webserver --disable-optimizations --disable-ccache --disable-xrandr

LIBDYLIB=$(SOURCE)/xbmc.bin

CLEAN_FILES=$(ARCHIVE) $(SOURCE)

all: configure

configure:
	cd $(SOURCE); $(CONFIGURE)

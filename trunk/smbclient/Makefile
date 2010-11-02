#  A quick and dirty Makefile to download/build and install
#
#  Usage:
#    make
#    sudo make install
ls
SOURCE=samba_3.2.7-4_iphoneos-arm
# download location and format
# wget http://apt.saurik.com/debs/samba_3.2.7-4_iphoneos-arm.deb

ARCHIVE=$(SOURCE).deb

ARCHIVE_TOOL=ar
ARCHIVE_TOOL_FLAGS=-x

all: $(SOURCE)

$(SOURCE): $(ARCHIVE)
	-rm -rf $(SOURCE); mkdir $(SOURCE)
	cd $(SOURCE); $(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) ../$(ARCHIVE)
	cd $(SOURCE); mkdir data; tar -xzf data.tar.gz -C data

install:
	sudo cp -rf $(SOURCE)/data/usr/* /usr/local/xbmc-ios-4.1/ 

clean:
distclean::
	rm -rf $(SOURCE)


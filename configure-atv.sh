#!/bin/bash

### Copyright (c) 2010 by Scott D. Davilla, All Rights Reserved.

# Disallow undefined variables
#set -u
#set -x			# activate debugging from here

platform_os="iPhoneOS"
platform_os_version="4.1"
platform_path="/Developer/Platforms/iPhoneOS.platform/Developer"
platform_os_min="iphoneos-version-min=${platform_os_version}"
platform_os_cflags="-march=armv7 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp -pipe -mdynamic-no-pic -Wno-trigraphs -fpascal-strings -O0 -Wreturn-type -Wunused-variable -fmessage-length=0 -fvisibility=hidden -gdwarf-2 -no-force_cpusubtype_ALL"
platform_os_ldflags=""
prefix_path="/usr/local/xbmc-ios-${platform_os_version}"

#platform_os="MacOSX"
#platform_os_version="10.4"
#platform_path="/Developer"
#platform_os_min="macosx-version-min=${platform_os_version}"
#platform_os_cflags=""
#prefix_path="/usr/local/xbmc-osx-${platform_os_version}"

platform_sdk_path="${platform_path}/SDKs/${platform_os}${platform_os_version}.sdk"
platform_bin_path="${platform_path}/usr/bin"

NM="/usr/bin/nm"
CPP="/usr/bin/cpp"
CXXCPP="${CPP} -I${platform_sdk_path}/usr/include/c++/4.2.1/armv7-apple-darwin10"
CPPFLAGS="-I${platform_sdk_path}/usr/include  -I${prefix_path}/include"
CC="${platform_bin_path}/arm-apple-darwin10-gcc-4.2.1"
CFLAGS="$CFLAGS -std=c99 -no-cpp-precomp -m${platform_os_min} -isysroot ${platform_sdk_path} -I${platform_sdk_path}/usr/include ${platform_os_cflags}"
LD="${platform_bin_path}/ld"
LDFLAGS="$LDFLAGS -m${platform_os_min} -isysroot ${platform_sdk_path} -L${platform_sdk_path}/usr/lib ${platform_os_ldflags} -L${prefix_path}/lib"
CXX="${platform_bin_path}/arm-apple-darwin10-g++-4.2.1 -I${platform_sdk_path}/usr/include/c++/4.2.1/armv7-apple-darwin10"
CXXFLAGS="-m${platform_os_min} -isysroot ${platform_sdk_path} ${platform_os_cflags}"
AR="${platform_bin_path}/ar"
AS="${platform_bin_path}/as"
CCAS="--tag CC gas-preprocessor.pl ${CC}"
STRIP="${platform_bin_path}/strip"
RANLIB="${platform_bin_path}/ranlib"
LIBTOOL="${platform_bin_path}/libtool"

PREFIX="${prefix_path}"
DEVROOT="${platform_path}"
SDKROOT="${platform_sdk_path}"
PKG_CONFIG_PATH=${prefix_path}:${platform_sdk_path}/usr/lib/pkgconfig

# do it this way to not pollute our command-line name space
NM=${NM} \
AR=${AR} \
AS=${AS} \
LD=${LD} \
CC=${CC} \
CCAS=${CCAS} \
CFLAGS=${CFLAGS} \
LDFLAGS=${LDFLAGS} \
CXX=${CXX} \
CXXFLAGS=${CXXFLAGS} \
CPP=${CPP} \
CXXCPP=${CXXCPP} \
CPPFLAGS=${CPPFLAGS} \
STRIP=${STRIP} \
RANLIB=${RANLIB} \
LIBTOOL=${LIBTOOL} \
PKG_CONFIG_PATH=${PKG_CONFIG_PATH} \
PATH="${prefix_path}/bin:${platform_bin_path}:$PATH" \
PREFIX="${prefix_path}" \
DEVROOT="${platform_path}" \
SDKROOT="${platform_sdk_path}" \
./configure \
    --prefix="${prefix_path}" \
    "$@" || exit


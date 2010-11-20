platform_os=iPhoneOS
platform_os_version=4.1
platform_gcc_version=4.2.1
platform_host=arm-apple-darwin10
platform_path=/Developer/Platforms/iPhoneOS.platform/Developer
platform_os_min=iphoneos-version-min=${platform_os_version}
platform_os_cflags=-march=armv7 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp -mdynamic-no-pic -pipe -Wno-trigraphs -fpascal-strings -O0 -Wreturn-type -Wunused-variable -fmessage-length=0 -gdwarf-2
platform_os_ldflags=-march=armv7 -mcpu=cortex-a8
prefix_path=/usr/local/xbmc-ios-${platform_os_version}

#platform_os="MacOSX"
#platform_os_version="10.4"
#platform_path="/Developer"
#platform_os_min="macosx-version-min=${platform_os_version}"
#platform_os_cflags=""
#prefix_path="/usr/local/xbmc-osx-${platform_os_version}"

platform_sdk_path=${platform_path}/SDKs/${platform_os}${platform_os_version}.sdk
platform_bin_path=${platform_path}/usr/bin

export NM=/usr/bin/nm
export CPP=/usr/bin/cpp
export CXXCPP=${CPP} -I${platform_sdk_path}/usr/include/c++/${platform_gcc_version}/${platform_host}
export CPPFLAGS=-I${platform_sdk_path}/usr/include  -I${prefix_path}/include
export CC=${platform_bin_path}/${platform_host}-gcc-${platform_gcc_version}
export CFLAGS=-std=c99 -no-cpp-precomp -m${platform_os_min} -isysroot ${platform_sdk_path} -I${platform_sdk_path}/usr/include ${platform_os_cflags}
export LD=${platform_bin_path}/ld
export LDFLAGS=-m${platform_os_min} -isysroot ${platform_sdk_path} -L${platform_sdk_path}/usr/lib ${platform_os_ldflags} -L${prefix_path}/lib
export CXX=${platform_bin_path}/${platform_host}-g++-${platform_gcc_version} -I${platform_sdk_path}/usr/include/c++/${platform_gcc_version}/${platform_host}
export CXXFLAGS=-m${platform_os_min} -isysroot ${platform_sdk_path} ${platform_os_cflags}
export AR=${platform_bin_path}/ar
export AS=${platform_bin_path}/as
export CCAS=--tag CC gas-preprocessor.pl ${CC}
export STRIP=${platform_bin_path}/strip
export RANLIB=${platform_bin_path}/ranlib
export LIBTOOL=${platform_bin_path}/libtool
export HOST=${platform_host}
export PREFIX=${prefix_path}
export DEVROOT=${platform_path}
export SDKROOT=${platform_sdk_path}
export PKG_CONFIG_PATH=${prefix_path}:${platform_sdk_path}/usr/lib/pkgconfig
export PATH:=${prefix_path}/bin:${platform_bin_path}:$(PATH)


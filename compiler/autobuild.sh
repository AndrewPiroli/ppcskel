#!/usr/bin/env bash
#### User serviceable options

USE_SUDO=1
ENABLE_CPLUSPLUS=1
PREFIX=/opt/devkitamateur/
POWER_LEVEL=17
gcc_ver=gcc-12.1.0
binutils_ver=binutils-2.39

#### End user serviceable options

if [ $ENABLE_CPLUSPLUS -eq 1 ]
then
	LANGS=c,c++
else
	LANGS=c
fi

start_dir=$(pwd)
binutils_url=https://ftp.gnu.org/gnu/binutils/${binutils_ver}.tar.gz
gcc_url=https://ftp.gnu.org/gnu/gcc/${gcc_ver}/${gcc_ver}.tar.gz

echo Download binutils
wget $binutils_url
echo Extracting binutils
tar xf ${binutils_ver}.tar.gz

echo Download GCC
wget $gcc_url
echo Extracting GCC
tar xf ${gcc_ver}.tar.gz

echo Starting build!
mkdir binutils-build
cd binutils-build
../${binutils_ver}/configure --prefix=${PREFIX} --target=powerpc-none-elf --disable-nls --with-sysroot --disable-werror
make -j${POWER_LEVEL}
if [ $USE_SUDO -eq 1 ]
then
	sudo make install
else
	make install
fi
cd $start_dir
mkdir gcc-build
cd gcc-build
../${gcc_ver}/configure --prefix=${PREFIX} --target=powerpc-none-elf --disable-nls --enable-languages=${LANGS} --without-headers
make all-gcc -j${POWER_LEVEL}
make all-target-libgcc -j${POWER_LEVEL}
if [ $USE_SUDO -eq 1 ]
then
	sudo make install-gcc
	sudo make install-target-libgcc
else
	make install-gcc
	make install-target-libgcc
fi
cd $start_dir

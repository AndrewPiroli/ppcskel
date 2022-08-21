#!/usr/bin/env bash
#### User serviceable options

USE_SUDO=1
ENABLE_CPLUSPLUS=1
PREFIX=/opt/devkitamateur/
MAKE_JOBS=17
VERIFY_DL=1
gcc_ver=gcc-12.2.0
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

rm -rf binutils-build
rm -rf gcc-build

if ! [[ -d "${gcc_ver}" ]]
then
	if ! [[ -f "${gcc_ver}.tar.gz" ]]
	then
		echo Download GCC
		wget $gcc_url
		if [ $VERIFY_DL -eq 1 ] && ! sha256sum --strict -c hash_gcc.txt; then
			echo gcc tarball did not match stored hash
			exit 1
		fi
	fi
	echo Extracting GCC
	tar xf ${gcc_ver}.tar.gz
fi

if ! [[ -d "${binutils_ver}" ]]
then
	if ! [[ -f "${binutils_ver}.tar.gz" ]]
	then
		echo Download binutils
		wget $binutils_url
		if [ $VERIFY_DL -eq 1 ] && ! sha256sum --strict -c hash_binutils.txt; then
			echo binutils tarball did not match stored hash
			exit 1
		fi
	fi
	echo Extracting binutils
	tar xf ${binutils_ver}.tar.gz
fi

echo Starting build!
mkdir binutils-build
cd binutils-build
../${binutils_ver}/configure --prefix=${PREFIX} --target=powerpc-none-elf --disable-nls --with-sysroot --disable-werror
make -j${MAKE_JOBS}
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
make all-gcc -j${MAKE_JOBS}
make all-target-libgcc -j${MAKE_JOBS}
if [ $USE_SUDO -eq 1 ]
then
	sudo make install-gcc
	sudo make install-target-libgcc
else
	make install-gcc
	make install-target-libgcc
fi
cd $start_dir

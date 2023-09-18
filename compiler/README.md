# Getting a working compiler

The autobuild.sh bash script will attempt to download binutils and GCC for you and try to compile them.

It does not build a standard library since this project does not require that. The resulting compiler will only be able to build freestanding executables.

It does not verify dependencies, if you are on a Debian based system, start with `build-essential`, `libgmp-dev`, `libmpc-dev`, `libmpfr-dev`, `texinfo`. Maybe some others, I can't check every system to know what is needed.

There are some options to set (by editing the script), PREFIX is where the files will be installed and also what you should set the DEVKITAMATEUR env variable to.

USE\_SUDO should be left at 1 if `make install` will need sudo powers to write to PREFIX, else you can set it to 0.

ENABLE\_CPLUSPLUS is 0 by default. NOTE: setting this to 1 enables C++ support in GCC but *does not* build libstdc++

MAKE\_JOBS determines how many make jobs to use, this greatly improves compiliation time. Conventional wisdom is to set this to your number of CPU cores + 1.

VERIFY\_DL enables checking of the downloaded GCC and binutils tarballs with sha256. NOTE: this only checks freshly downloaded tarballs, if the tarball is already there it won't be downloaded or checked again.

gcc\_ver and binutils\_ver select the versions to download.

## I don't know anything, can you build it for me?

Alternative to all of this, you can try a [precompiled cross-compiler](http://gh.andrewtech.net/assets/static/ppc-cross.tar.7z), good luck.

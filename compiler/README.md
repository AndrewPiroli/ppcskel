# Getting a working compiler

## I know how to build a compiler, just give me the details

Start with an older GCC/binutils, target powerpc-none-elf and install wherever you like, there is no need to build a standard library

I tested GCC 4.8.5 and binutils 2.24, which are super old but still work on a modern Ubuntu 20.04 LTS system (C++ support does not build, only C).

Newer compilers/binutils should work, but I ran into an issue with an integer overflow bug affecting an ELF Program Header on some versions, so if your shiny new compiler doesn't work, run it through `powerpc-none-elf-readelf -l` and check the Program Headers MemSize, it should be "not huge". Other issues are tough to debug since mini's only useful output before ppcboot loads is via USB Gecko.

Once you are done, point DEVKITAMATEUR to the prefix you built & installed your compiler to.

## I'm \*nix savvy, but I don't know much about building compilers

The autobuild.sh bash script will attempt to download binutils and GCC for you and try to compile them.

It does not build a standard library since this project does not require that. The resulting compiler will only be able to build freestanding executables.

It does not verify dependencies, if you are on a debian based system, start with `build-essential`, `libgmp-dev`, `libmpc-dev`, `libmpfr-dev`. Maybe some others, it's on you.

There are some options to set (by editing the script), PREFIX is where the files will be installed and also what you should set the DEVKITAMATEUR env variable to.

USE\_SUDO should be left at 1 if `make install` will need sudo powers to write to PREFIX, else you can set it to 0.

ENABLE\_CPLUSPLUS is 0 by default since the default gcc version does not build on modern systems with C++ support.

POWER\_LEVEL determines how many make jobs to use, this greatly improves compiliation time.

gcc\_ver and binutils\_ver select the versions to download.

## I don't know anything, can you build it for me?

Alternative to all of this, you can try a [precompiled cross-compiler](http://gh.andrewtech.net/assets/static/ppc-cross.tar.7z), good luck.

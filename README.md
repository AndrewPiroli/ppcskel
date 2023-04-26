# ppcskel

Skeleton code for mini-based homebrew

## Compiling

This code requires a powerpc-none-elf- cross compiler, devkitPro currently ships a powerpc-eabi- cross compiler which is not compatible with the project in it's current state.

Tested working with GGC/13.1.0 binutils/2.40.0

## Credits

Thanks to MethodOrMadness and company for testing and help finding a USB Gecko.

Without the USB Gecko's debug output from mini, it would have taken much longer to find the bugged ELF Program Header.

import nake
import os

const
  CC = "i686-elf-gcc"
  asmC = "i686-elf-as"

task "clean", "Removes build files.":
  removeFile("boot.o")
  removeFile("main.bin")
  removeDir("nimcache")
  echo "Done."

task "build", "Builds the operating system.":
  echo "Compiling..."
  direShell "~/prototracer/libs/nim/bin/nim c --nimcache:nimcache -d:release --gcc.exe:$1 main.nim" % CC
  
  direShell asmC, "boot.s -o boot.o"
  
  echo "Linking..."
  
  direShell CC, "-T linker.ld -o main.bin -ffreestanding -O2 -nostdlib boot.o nimcache/main.c.o nimcache/stdlib_system.c.o nimcache/stdlib_unsigned.c.o nimcache/ioutils.c.o"
  
  echo "Done."
  
task "run", "Runs the operating system using QEMU.":
  if not existsFile("main.bin"): runTask("build")
  direShell "qemu-system-i386 -kernel main.bin"

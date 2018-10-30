import ioutils
type
  TMultiboot_header = object
  PMultiboot_header = ptr TMultiboot_header

# type
  # GDT = object {.packed.}
  #   address: uint32
  #   size: uint16

  # FileSystem* = object
  #   current*: cstring

  # LodkaEnv* = object
  #   vram*: PVIDMem
  #   fs*: FileSystem
 
var keyboardIndex = 0

# proc sleep*(ms: uint): void =
#   var j = 0
#   while j < ms.int * 100_000:
#     j += 1

# proc readLine*(env: LodkaEnv): string =
#   sleep(100'u)
#   if keyboardIndex >= keyboardCommands.len:
#     result = ""
#   else:
#     result = $keyboardCommands[keyboardIndex]
#     keyboardIndex += 1
#     let attr = makeColor(White, Black)
#     env.vram.writeString($env.fs.current & " > " & result, attr, (25 + keyboardIndex * 10, 10))

# proc ezeroRun*(input: string, env: LodkaEnv) =
#   discard

# proc startEzero*(env: LodkaEnv) =
#   var vram = cast[PVIDMem](0xB8000)
#   var line = ""
#   while true:
#     line = readLine(env)
#     if line.len > 0:
#       ezeroRun(line, env)

# proc initFileSystem*: FileSystem =
#   result = FileSystem(current: "#my")


proc kmain(mb_header: PMultiboot_header, magic: int) {.exportc.} =
  if magic != 0x2BADB002:
    discard # Something went wrong?

  var vram = cast[PVIDMem](0xB8000)
  screenClear(vram, Black) # Make the screen yellow.

  var e = @[0]

  writeString(vram, "e", makeColor(Black, White), (25, 10))
  # Demonstration of error handling.
  # var x = len(vram[])
  # var outOfBounds = vram[x]

  # var env = LodkaEnv(vram: vram)

  # env.fs = initFileSystem()
  # startEzero(env)

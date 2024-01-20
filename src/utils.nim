import std/math
import chroma

import ./types

# proc stringSignals*(input: string): seq[RGBA] =
#   var result: seq[RGBA]
#   for i in 0 ..< input.len div 4:
#     var chunk: array[4, uint8]
#     for j in 0 .. 3:
#       let index = i * 4 + j
#       if index < input.len:
#         chunk[j] = uint8(input[index])
#       else:
#         chunk[j] = 0'u8  # Fill with zeros if the string is not long enough
#     result.add(chunk)
#   return result


proc toColorRGBA*(input: array[4, uint8]): ColorRGBA =
  echo (input[0], input[1], input[2], input[3])
  rgba(input[0], input[1], input[2], input[3])



proc toColors*(input: string): seq[ColorRGBA] =
  let chunks = int(ceil(input.len().toFloat() / 4.0))
  for i in 0 ..< chunks:
    var chunk: array[4, uint8]
    for j in 0 .. 3:
      let index = i * 4 + j
      if index < input.len:
        chunk[j] = uint8(input[index])
      else:
        chunk[j] = 0'u8  # Fill with zeros if the string is not long enough
    result.add(chunk.toColorRGBA())
  return result



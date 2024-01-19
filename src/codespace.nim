import ./opcode

type Codespace* = ref object
  signals*: seq[string]
  lanterns*: seq[string]



case name:
of "save":
  let argText = loadArg(args[0], string)
  let argFilename = loadArg(args[1], LFilename)
  let argTags = loadArg(args[2], seq[LTag])
  save(argText, argFilename)

# pass correct code
# so we work

type
  EzeroTokenKind* = enum EName, EInt, EString, EBool, ETag, EFilename

  EzeroToken* = object
    kind*:     EzeroTokenKind
    location*: (start: int, until: int)

  EzeroNodeKind* = enum EGLit, EGInt, EGBool, EGCall

  EzeroNode* = object
    case kind*: EzeroNodeKind:
    of EGLit:
      litKind*: EzeroTokenKind
      name*:    string
    of EGInt:
      i*:       int
    of EGBool:
      b*:       bool
    of EGCall:
      functionName*: string
      args*:         seq[EzeroNode]
    typ*: EzeroType

  EzeroTypeKind* = enum ETInt, ETString, ETBool, ETTag, ETFilename, ETSequence, ETError

  EzeroType* = ref object
    case kind*: EzeroTypeKind:
    of ETInt, ETString, ETBool, ETTag, ETFilename, ETError:
      discard
    of ETSequence:
      childType*: EzeroType



proc tokenize(input: string): seq[EzeroToken] =
  discard

proc parse(input: seq[EzeroToken]): EzeroNode =
  discard

proc parse(input: string): EzeroNode =
  input.tokenize.parse

proc typecheck(input: EzeroNode) =
  discard

let ast = input.parse.typecheck

case ast.kind:
of EGLit:
  env.writeSuccess(ast.name)
of EGCall:
  invokeNimFunction(ast, env)


and check it out
but how to parse them

ETFunction.init(args = @[ETString.init, ETFilename.init, ETVarargs.init(arg = @[ETTag.init])])

proc save(text: string, filename: LFilename, tags: openarray[LTag] , env: Env): Exit {.osPublic.} =
  # save file
  discard

proc ls(path: LPath = CURRENT_LPATH, env: Env) {.osPublic.} =
  # show this path
  discard

save a table with all
each tag has a hash and each hash is in array: showing metadata and stuff
save and ls use this
they also have an index to file block where content is

#[  
~              > (#my )
~              > make #lang #tests
created new tags: #lang #tests
~              > in #lang #tests
~ #lang #tests > save 'test' /test
saved file /test
~ #lang #tests > ls
test
~ #lang #tests > save 'test' /test2 #my #lang
save file /test2
~ #lang #tests > ls #lang
/test 				#my #lang #tests
/test2 				#my #lang
~ #lang #tests > ls tag == #tests
/test 				#my #lang #tests


]#


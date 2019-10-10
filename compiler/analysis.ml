(* TODO: open Binary *)

(* type *)

type bit = Zero | One

type peanoType = Zero | Successor

type parenType = Open_paren | Close_paren

(* init *)

let zFlag : bit = Zero (* zlag is not switch One to Zero *)
let sFlag : bit = Zero
let openParenFlag : bit = Zero
let closeParenFlag : bit = Zero


let sChain : int = 0

(* func *)

let readPeanoFlag bit peanoType = function
  | (bit, Zero) ->
    if zFlag = One && bit = One
    then
      raise (Failure "Z is already read. Z match only one times in peano")
    else
      zFlag = bit
  | (bit, Successor) ->
    if sFlag = One && bit = One
    then
      raise (Failure "S is already read. Please fix chain of successor.")
    else
      sFlag = bit

let readParenFlag bit parenType = function
  | (bit, Open_paren) ->
    if openParenFlag = One && bit = One
    then
      raise (Failure "OpenParen is already read. Please fix chain of openParen.")
    else
      openParenFlag = bit
  | (bit, Close_paren) ->
    (*
     * TIP:
     * Close_paren chains just count of sChain.
     * If not chains just the count, SyntaxError occure .
     *)
    (* FIXME: *)
    closeParenFlag = bit


let parsePeano peanoType = match peanoType with
  | Zero -> readParenFlag One Zero
  | Successor -> readParenFlag One Successor

let parseParen parenType = match parenType with
  | Open_paren  -> ()
  | Close_paren  -> ()

let invalid_token =
  raise (Failure "Invalid token read")

let read_input (str:string) =
  let len = String.length str in
  for i = 0 to len - 1 do
    match str . [i] with
    | 'Z' -> parsePeano Zero
    | 'S' -> parsePeano Successor
    | '(' -> parseParen Open_paren
    | ')' -> parseParen Close_paren
    | _ -> invalid_token
  done

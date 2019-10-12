(* TODO: open Binary *)

type bit = Zero | One

type peanoType = ZeroP | Successor

type parenType = Open_paren | Close_paren

let zFlag = ref Zero (* zlag is not switch One to Zero *)
let sFlag = ref Zero
let openParenFlag = ref Zero
let closeParenFlag = ref Zero
let sCount = ref 0
let closeParenCount = ref 0

let zFlagSwitch bit =
  zFlag := bit;
  sFlag := Zero;
  openParenFlag := Zero
let sFlagSwitch bit =
  zFlag := Zero;
  sFlag := bit;
  openParenFlag := Zero
let openParenFlagSwitch bit =
  zFlag := Zero;
  sFlag := Zero;
  openParenFlag := bit
let closeParenFlagSwitch bit =
  zFlag := Zero;
  sFlag := Zero;
  openParenFlag := Zero;
  closeParenFlag := bit

(* let checkAfterCloseParenToken = *)
(*   if !closeParenFlag = One *)
(*   then *)
(*     raise (Failure "Don't put token after closeParenthesis. CloseParenthesis means end of chainToken.") *)

(* FIXME: use checkAfterCloseParenToken to call expeption when put peanoToken after closeParen *)
let readPeanoFlag = function
  | (bit, ZeroP) ->
    if !closeParenFlag = One
    then
      raise (Failure "Don't put token after closeParenthesis. CloseParenthesis means end of chainToken.")
    else
    if bit = One && !zFlag = One
    then raise (Failure "Z is already read. Z match only one times in peano")
    else zFlagSwitch bit
  | (bit, Successor) ->
    if !closeParenFlag = One
    then
      raise (Failure "Don't put token after closeParenthesis. CloseParenthesis means end of chainToken.")
    else
    if bit = One && !sFlag = One
    then
      raise (Failure "S is already read. Please fix chain of successor.")
    else
      sCount := !sCount + 1;
    sFlagSwitch bit

(* FIXME: use checkAfterCloseParenToken to call expeption when put peanoToken after closeParen *)
let readParenFlag = function
  | (bit, Open_paren) ->
    if !closeParenFlag = One
    then
      raise (Failure "Don't put token after closeParenthesis. CloseParenthesis means end of chainToken.")
    else
    if bit = One && !sFlag != One
    then
      raise (Failure "Don't use openParenthesis without put SuccessorPeano")
    else
    if bit = One && !openParenFlag = One
    then raise (Failure "OpenParen is already read. Please fix chain of openParen.")
    else openParenFlagSwitch bit
  | (bit, Close_paren) ->
    if bit = One && !zFlag = Zero
    then
      if !closeParenFlag = Zero
      then
        raise (Failure "Don't use with closeParenthesis without put ZeroPeano")
      else
        (
          closeParenCount := !closeParenCount + 1;
          closeParenFlagSwitch bit
        )
    else
    if bit = One && !zFlag = One
    then
      (
        closeParenCount := !closeParenCount + 1;
        closeParenFlagSwitch bit
      )

    (*
     * TIP:
     * Close_paren chains just count of sChain.
     * If not chains just the count, SyntaxError occure .
     *)
(* FIXME: *)

let parsePeano = function
  | ZeroP -> readPeanoFlag (One, ZeroP)
  | Successor -> readPeanoFlag (One, Successor)

let parseParen = function
  | Open_paren -> readParenFlag (One, Open_paren)
  | Close_paren -> readParenFlag (One, Close_paren)

(* TODO: check each flag *)
(* let check_each_flag tokenFlag = match tokenFlag with *)
(*   | readToken *)

let read_input (str:string) =
  let len = String.length str in
  for i = 0 to len - 1 do
    match str . [i] with
    (* FIXME: refactoring *)
    | 'Z' -> parsePeano ZeroP
    | 'S' -> parsePeano Successor
    | '(' -> parseParen Open_paren
    | ')' -> parseParen Close_paren (* If parse Close_paren, it means end of peanos *)
    | _ -> raise (Failure "Invalid token read")
  done
  ;
  if !sCount <> !closeParenCount
  then
    raise (Failure "Please fix closeParenthesis just count of SuccessorPeano")
  else
    sCount := 0;
  closeParenCount := 0

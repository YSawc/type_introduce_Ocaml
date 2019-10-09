(* TODO: open Binary *)

type bit = Zero | One

type peanoType = Zero | Successor

type parenType = Open_paren | Close_paren

(* init *)

let zflag : bit = Zero
let sflag : bit = Zero
let openParenFlag : bit = Zero
let closeParenFlag : bit = Zero

let parsePeano peanoType = match peanoType with
  | Zero -> print_string ("parsed Z" ^ "\n" )
  | Successor -> print_string ("parsed S" ^ "\n" )

let parseParen parenType = match parenType with
  | Open_paren  -> print_string ( "Close_paren" ^ "\n" )
  | Close_paren  -> print_string ( "Close_paren" ^ "\n" )

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

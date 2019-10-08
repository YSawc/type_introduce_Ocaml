type bit

let analysis : bool =
  false
(* return boolean execution of expr *)

let parseS =
  print_string ("from parseS" ^ "\n" )

let parseZ =
  print_string ( "from parseZ" ^ "\n" )

let void () = ()

type parenType = Open_paren | Close_paren

let parseParen parenType = match parenType with

let read_input (str:string) =
  let len = String.length str in
  for i = 0 to len - 1 do
    match str . [i] with
    | 'S' -> parseS
    | 'Z' -> parseZ
    | '(' -> parseParen Open_paren
    | ')' -> parseParen Close_paren
    | _ -> ()
  done

(* parseParen Open_paren *)

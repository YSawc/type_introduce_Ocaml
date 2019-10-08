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

(* let parseParen (key:string) = match key with *)
(*   | "Open"-> print_string "Open_paren" *)
(*   | (Open_paren)  -> () *)
(*   | "Close" -> print_string "Close_paren" *)
(*   | _ -> raise @@ Invalid_argument "Error cause parseParen! Please fix argument" *)
(*   | (Close_paren) -> () *)

let parseParen parenType = match parenType with
  | (Open_paren)  -> print_string ( "Close_paren" ^ "\n" )
  | (Close_paren)  -> print_string ( "Close_paren" ^ "\n" )

(* type peanoNum = Z | S *)

(* let read_input (str:string) () = *)
(*   let len = String.length str in *)
(*   try *)
(*     let i = 0 in *)
(*     let rec read_token = function *)
(*       | (current, chr) when current >= len -> void *)
(*       | (current, chr) when chr = 'S' -> parseS; *)
(*       | (current, chr) when chr = 'Z' -> parseZ; *)
(*       | (current, chr) when chr = '(' -> parseParen "Open"; *)
(*       | (current, chr) when chr = ')' -> parseParen "Close"; *)
(*       | _ -> raise @@ Invalid_argument "Error cause with token " *)
(*     in *)
(*     read_token (i + 1, str . [i + 1]) *)
(*   with Exit -> print_string "finished read_input" ;; *)

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

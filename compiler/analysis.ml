

type bit

let analysis : bool =
  false
(* return boolean execution of expr *)

let parseS () =
  false

let parseZ () =
  false

type parenType = Open_paren | Close_paren

let parseParen = function
  | (Open_paren)  -> ()
  | (Close_paren) -> ()

let read_input (str:string) =
  let len = String.length str in
  let i = 0 in
  let rec read_token = function
    (* TODO: fix repetition *)
    | (current, chr) when current >= len -> parseZ
    | (current, chr) when chr = 'S' -> parseS
    | (current, chr) when chr = 'Z' -> parseZ
    (* | (current, chr) when chr = '(' -> parseParen (Open_paren) *)
    (* | (current, chr) when chr = ')' -> parseParen (Close_paren) *)
    | _ -> raise @@ Invalid_argument "Error cause with "
  in
  let i = i + 1 in
  read_token (str . [i + 1])


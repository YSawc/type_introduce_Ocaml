

type bit

let analysis : bool =
  false
(* return boolean execution of expr *)

let parseS () =
  false

let parseZ () =
  false

let parseParen :bool () =
  false

let read_input (str:string) =
  let len = String.length str in
  let i = 0 in
  let chr = str . [i] in
  let rec read_token = function
    (* TODO: fix repetition *)
    | (chr) when chr = 'S' -> parseS
    | (chr) when chr = 'Z' -> parseZ
    | (chr) when chr = '(' -> parseParen opn
    | (chr) when chr = ')' -> parseParen cls
  in
  let i = i + 1 in
  read_token (str . [i + 1])


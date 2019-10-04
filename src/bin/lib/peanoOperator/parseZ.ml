(* per: read Z *)
(* premise: read first word is Z *)
(* TIP: if read string, return typeError *)

(* func *)

let parseZ (c:char) : bool =
    if c = 'Z'
    then true
    else false

(* test *)
let test1 = parseZ 'Z' = true
let test2 = parseZ '_' = false

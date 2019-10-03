(* per: read next word of Z *)
(* premise: read first word is Z *)

(* test *)
let test1 = parseZ "Z" = true
let test2 = parseZ "Z." = false
let test3 = parseZ "Z()" = false

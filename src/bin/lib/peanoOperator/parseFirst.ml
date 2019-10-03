(* func *)

(* test *)
let test1 = parseFirst "S" = true
let test1 = parseFirst "S(S(Z))" = true
let test1 = parseFirst "S)" = true
let test2 = parseFirst "Z" = true
let test3 = parseFirst "." = false
let test4 = parseFirst "" = false

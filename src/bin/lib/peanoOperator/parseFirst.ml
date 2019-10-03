(* func *)

(* test *)
let test1 = parseFirst "S" = true
let test2 = parseFirst "S(S(Z))" = true
let test3 = parseFirst "S)" = true
let test4 = parseFirst "Z" = true
let test5 = parseFirst "." = false
let test6 = parseFirst "" = false

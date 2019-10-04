(* per: read S and chain word *)
(* premise: read first word is S *)

(* test *)
let test1 = parseS "S(S(Z))" = true
let test2 = parseS "S(S(Z)" = false
let test2 = parseS "S(S)" = false
let test2 = parseS "s(S(Z))" = false

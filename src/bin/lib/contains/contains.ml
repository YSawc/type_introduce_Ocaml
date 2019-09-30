(* ref: https://stackoverflow.com/questions/8373460/substring-check-in-ocaml *)

(* load *)

#load "str.cma"


(* test *)

let test1 = contains "abc" "b" = true
let test2 = contains "abc" "d" = false
let test3 = contains "abc" "" = false

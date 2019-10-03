(* per: parse first char of natural number *)

(* data__peano *)

let peanosData = [
    'Z';
    'S';
]

(* func *)

let rec parseFirst str peanosData = match peanosData with
    [] -> false
    | first :: rest ->
        if str . [0] = first
        then true
        else parseFirst str rest

(* test *)
let test1 = parseFirst "S" peanosData = true
let test2 = parseFirst "S(S(Z))" peanosData = true
let test3 = parseFirst "S)" peanosData = true
let test4 = parseFirst "Z" peanosData = true
let test5 = parseFirst "." peanosData = false
let test6 = parseFirst "" peanosData = false

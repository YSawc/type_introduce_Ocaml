(* ref: https://stackoverflow.com/questions/8373460/substring-check-in-ocaml *)

(* per: string -> string -> bool *)

(* load *)

#load "str.cma"

(* func *)

let contains s1 s2 =
    let re = Str.regexp_string s2
    in
        try ignore (Str.search_forward re s1 0);
        if s2 = ""
        then false
        else true
        with Not_found -> false

(* test *)

let test1 = contains "abc" "b" = true
let test2 = contains "abc" "d" = false
let test3 = contains "abc" "." = false
let test4 = contains "abc" "" = false

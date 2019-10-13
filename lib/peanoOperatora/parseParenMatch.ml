(* test *)

let test2 = parseParenMatch "S(S(S(Z)))" = true
let test3 = parseParenMatch "S(S(Z)" = false
let test4 = parseParenMatch "S(SZ)" = false
let test5 = parseParenMatch "()S" = false
let test1 = parseParenMatch "S" = false
let test6 = parseParenMatch "Z" = true
let test7 = parseParenMatch "(Z)" = false

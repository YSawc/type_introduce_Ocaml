(* per: read S and chain word *)
(* premise: read first word is S *)

(* val *)

let charBuf = Buffer.create 32
let openParenBuf = Buffer.create 64
let closeParenBuf = Buffer.create 64
let parenBuf = Buffer.create 128

(* test *)
let test1 = parseS "S(S(Z))" = true
let test2 = parseS "S(S(Z)" = false
let test2 = parseS "S(S)" = false
let test2 = parseS "s(S(Z))" = false

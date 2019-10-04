(* per: read S and chain word *)
(* premise: read first word is S *)

(* val *)

let charBuf = Buffer.create 32
let openParenBuf = Buffer.create 64
let closeParenBuf = Buffer.create 64
let parenBuf = Buffer.create 128

(* func *)

let parseS (str:string) =
    for i = 0 to String.length str do
            let (ittr:char) = str . [i] in
            if ittr = 'S'
            then
                Buffer.add_char charBuf 'S'  (* append charPop *)
            else if ittr = 'Z'
            then
                Buffer.add_char charBuf 'Z'  (* append charPop *)
            else if ittr = '('
            then
                Buffer.add_char openParenBuf '('  (* append charPop *)
            else if ittr = ')'
            then
                Buffer.add_char closeParenBuf ')'  (* append charPop *)
                (* readChar idx-1 *)
          done
(* test *)
let test1 = parseS "S(S(Z))" = true
let test2 = parseS "S(S(Z)" = false
let test2 = parseS "S(S)" = false
let test2 = parseS "s(S(Z))" = false

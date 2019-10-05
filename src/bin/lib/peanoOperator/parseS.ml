(* per: read S and chain word *)
(* premise: read first word is S *)

(* val *)

let charBuf = Buffer.create 32
let openParenBuf = Buffer.create 64
let closeParenBuf = Buffer.create 64
let parenBuf = Buffer.create 128

(* func *)

let parseToken (str :string) =
    for i = 0 to String.length str do
        let (ittr :char) = str . [i] in
        if ittr = 'S'
        then Buffer.add_char charBuf 'S'
            (* TODO: add flag of SRead *)
        else
        if ittr = 'Z'
        then Buffer.add_char charBuf 'Z'
            (* TODO: add flag of ZRead *)
        else
        if ittr = '('
        then Buffer.add_char openParenBuf '('
            (* TODO: add flag of openParenRead *)
        else
        if ittr = ')'
        then Buffer.add_char closeParenBuf ')'
            (* TODO: add flag of closeParenRead *)
    done

let charBufCompOpenBuf (chrBuf :Buffer.t) (opnBuf :Buffer.t) :bool =
    if Buffer.length chrBuf =Buffer.length opnBuf - 1
    then true
    else false

let charBufCompCloseBuf (chrBuf :Buffer.t) (clsBuf :Buffer.t) :bool =
    if Buffer.length chrBuf =Buffer.length clsBuf - 1
    then true
    else false

let lengthCompRes (openComp :bool) (closeComp :bool) :bool =
  if openComp == closeComp
  then true
  else false
(* let parseToken (str :string) = *)
   (* define flag *)
    (* TODO: refactoring *)
    (* let flag__readPeano:bit = Zero in *)
    (* let flag__readS:bit = Zero in *)
    (* let flag__readZ:bit = Zero in *)
    (* let flag__readOpenParen:bit = Zero in *)
    (* let flag__readCloseParen:bit = Zero in *)
   (* END: *)
   (* define flag *)
    (* for i = 0 to String.length str do *)
    (*     if ittr = 'S' && flag__readPeano = 0 && flag__readS = 0 *)
    (*     then *)
    (*         Buffer.add_char charBuf 'S'; *)
    (*         let flag__readPeano = 1; *)
    (*         let flag__readS = 1; *)
    (*     else *)
    (*     if ittr = 'Z' *)
    (*     then *)
    (*         Buffer.add_char charBuf 'Z'; *)
    (*         let flag__readPeano = 1; *)
    (*         let flag__readZ = 1; *)
    (*         let flag__readS = 0; *)
    (*     else *)
    (*     if ittr = '(' *)
    (*     then *)
    (*         Buffer.add_char openParenBuf '('; *)
    (*         flag__readOpenParen *)
    (*     else *)
    (*     if ittr = ')' *)
    (*     then *)
    (*         Buffer.add_char closeParenBuf ')'; *)
    (*         flag__readCloseParen *)
    (* done *)

(* let flag__charBufCompOpenBuf (chrBuf :Buffer.t) (opnBuf :Buffer.t) :bool = *)
(*     if Buffer.length chrBuf = Buffer.length opnBuf - 1 *)
(*     then true *)
(*     else false *)
(* ;; *)

(* let flag__charBufCompCloseBuf (chrBuf :Buffer.t) (clsBuf :Buffer.t) :bool = *)
(*     if Buffer.length chrBuf = Buffer.length clsBuf - 1 *)
(*     then true *)
(*     else false *)
(* ;; *)

(* let flag__lengthCompRes (openComp :bool) (closeComp :bool) :bool = *)
(*   if openComp == true && closeComp == true *)
(*   then true *)
(*   else false *)
(* ;; *)

(* let justifyParsedToken :bool = *)
(*   for i = 0 to Buffer.length charBuf do *)
(*     if Buffer.nth charBuf i = 'S' && Buffer.nth openParenBuf i = '(' *)
(*     then true *)
(*     else *)
(*     if Buffer.nth charBuf i = 'Z' *)
(*     then *)
(*   done *)

(* ;; *)

(* test *)
let test1 = parseS "S(S(Z))" = true
let test2 = parseS "S(S(Z)" = false
let test2 = parseS "S(S)" = false
let test2 = parseS "s(S(Z))" = false

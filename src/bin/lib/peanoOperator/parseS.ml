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

(* test *)
let test1 = parseS "S(S(Z))" = true
let test2 = parseS "S(S(Z)" = false
let test2 = parseS "S(S)" = false
let test2 = parseS "s(S(Z))" = false

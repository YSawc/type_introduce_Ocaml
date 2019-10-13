type wordType =
  | Peano
  | Operation

type operatorType =
  | Plus
  | Times
  | Is

let parseWords (words:string) : string list =
  Str.split (Str.regexp " " ) words

let parsePeanoSyntax (peano:string) =
  ()

let parseSyntax = function
  | Peano -> ()
  | Operation -> ()

let parseWord (word:string) =
  match word . [0] with
  | 'S' | 'Z' -> parseSyntax Peano
  (* TODO: refactoring *)
  | _ -> ()

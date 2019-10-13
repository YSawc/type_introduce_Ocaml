type wordType =
  | Peano
  | Operation

type operatorType =
  | Plus
  | Times
  | Is

type operatorData =
  { name: string
  ; operator : operatorType
  }

let operatorDatas =
  [ { name = "plus"; operator = Plus }
  ; { name = "times"; operator = Times }
  ; { name = "is"; operator = Is }
  ]

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

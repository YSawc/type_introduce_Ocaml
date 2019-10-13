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

let parseOperatorSyntax (operator:string) =
  ()

let rec operatorDetector rowWord =
  match operatorDatas with
  (* TODO: over valiable *)
    [] -> raise (Failure "Invalid word detected with [] .")
  | { name = n; operator = _} :: rest ->
    if rowWord = n
    then
      parseOperatorSyntax @@ rowWord
    else
      operatorDetector @@ rowWord

let parseWord (word:string) =
  match word . [0] with
  | 'S' | 'Z' -> parsePeanoSyntax @@ word
  (* TODO: refactoring *)
  | _ ->
    operatorDetector @@ word

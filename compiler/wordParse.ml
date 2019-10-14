open LetterAnalyse

(* TODO:
 * call types from module *)
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
  read_input @@ peano

let parseOperatorSyntax (operator:string) =
  ()

let rec operatorDetector (rowWord:string) (operatorDatas) =
  match operatorDatas with
  | [] -> raise (Failure "Invalid word detected with [] .")
  | { name = n; operator = _} :: rest ->
    if rowWord = n
    then
      parseOperatorSyntax @@ rowWord
    else
      operatorDetector rowWord rest

let parseWord (rowStr:string) =
  match rowStr . [0] with
  | 'S' | 'Z' -> parsePeanoSyntax @@ rowStr
  | _ ->
    operatorDetector rowStr operatorDatas

let parseDetector (rowStr:string) =
  let rowStrList = parseWords @@ rowStr in
  let len = List.length rowStrList in
  for i = 0 to len - 1 do
    parseWord @@ List.nth rowStrList i
  done

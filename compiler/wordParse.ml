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

let _LLSidePeano = ref ""
let _LRSidePeano = ref ""
let _RSidePeano = ref ""

let readPeanoIndex = ref 0

let initReadPeanos =
  _LLSidePeano := ""
  ;
  _LRSidePeano := ""
  ;
  _RSidePeano := ""

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
  | 'S' | 'Z' ->
    parsePeanoSyntax @@ rowStr
    ;
    (
      match !readPeanoIndex with
      | 0 -> _LLSidePeano := rowStr
      | 1 -> _LRSidePeano := rowStr
      | 2 -> _RSidePeano := rowStr
      | _ -> raise (Failure "Total peano number is wrong! Please fix form like left n1 expr n2 expr n3.")
    )
    ;
    readPeanoIndex := !readPeanoIndex + 1
  | _ ->
    operatorDetector rowStr operatorDatas

let parseDetector (rowStr:string) =
  let rowStrList = parseWords @@ rowStr in
  let len = List.length rowStrList in
  for i = 0 to len - 1 do
    parseWord @@ List.nth rowStrList i
  done
  ;
  readPeanoIndex := 0
  ;
  initReadPeanos

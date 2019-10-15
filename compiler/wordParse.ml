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

let _LLPeano = ref ""
let _LRPeano = ref ""
let _RPeano = ref ""

let _LCalcExpr = ref ""
let _RCalcExpr = ref ""

let readPeanoIndex = ref 0

let readCalcIndex = ref 0

let initReadPeanos =
  _LLPeano := ""
  ;
  _LRPeano := ""
  ;
  _RPeano := ""

let initReadCalcExpr =
  _LCalcExpr := ""
  ;
  _RCalcExpr := ""

let parseWords (words:string) : string list =
  Str.split (Str.regexp " " ) words

let parsePeanoSyntax (peano:string) =
  read_input @@ peano

let rec operatorDetector (rowWord:string) (operatorDatas) =
  (
    match operatorDatas with
    | [] -> raise (Failure "Invalid word detected with [] .")
    | { name = n; operator = _} :: rest ->
      (
        if rowWord = n
        then
          (
            (
              match !readCalcIndex with
              | 0 -> _LCalcExpr := n
              | 1 -> _RCalcExpr := n
              | _ -> raise (Failure "Total expr number is wrong! Please fix form like n1 expr n2 expr n3.")
            );
            readCalcIndex := !readCalcIndex + 1
          );
        operatorDetector rowWord rest
      )
  );
  if !readCalcIndex <> 1
  then
    raise (Failure "Total expr number is wrong! Please fix form like n1 expr n2 expr n3.")

let parseWord (rowStr:string) =
  match rowStr . [0] with
  | 'S' | 'Z' ->
    parsePeanoSyntax @@ rowStr
    ;
    (
      match !readPeanoIndex with
      | 0 -> _LLPeano := rowStr
      | 1 -> _LRPeano := rowStr
      | 2 -> _RPeano := rowStr
      | _ -> raise (Failure "Total peano number is wrong! Please fix form like n1 expr n2 expr n3.")
    );
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
let initDetector =
  readPeanoIndex := 0
  ;
  initReadPeanos
  ;
  readCalcIndex  := 0
  ;
  initReadCalcExpr
  ;

open WordParse

let sCount = ref 0

let rec countSuccessor (str:string) =
  let nextIndexOfS = String.index str 'S'
  in
  try
    let fillStr =
      String.sub str (nextIndexOfS + 1) (String.length str)
    in
    sCount := !sCount + 1
    ;
    countSuccessor fillStr
  with Not_found ->
    ()

let exprPlus =
  ()

let exprTimes =
  ()

let exprIs (l:string) (r:string) =
  ()

let exprCalcurator (list:string) = function
  | Plus -> ()
  | Times -> ()

let preExpr (list:string) =

open WordParse

let rec countSuccessor (str:string) =
  let nextIndexOfS = String.index str 'S'
  in
  try
    let fillStr =
      String.sub str (nextIndexOfS + 1) (String.length str)
    in
    ()
    ;
    fillStr |> countSuccessor
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

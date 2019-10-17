open WordParse
open PeanoDefinator

type inferenceNode =
  { preExprTokens : preExprTokens_t
  ; leadingRule : exprDefinition
  }

let exprDefinator = function
  | P_Zero -> ()
  | P_Succ -> ()
  | T_Zero -> ()
  | T_Succ -> ()

let inferenceChecker =
  if !preExprTokens.d_LLPeano . [0] = 'S'
  then ()
  else
  if !preExprTokens.d_LLPeano . [0] = 'Z'
  then ()
  else
    raise (Failure "PeanoToken of left on left side is something wrong! Please fix token to peano.")

let exprPlus =
  ()

let exprTimes =
  ()

let exprIs (l:string) (r:string) =
  ()

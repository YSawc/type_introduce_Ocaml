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

let inferenceChecker = function
  (* FIXME: refactoring *)
  | Plus ->
    if !preExprTokens.d_LLPeano . [0] = 'Z'
    then exprDefinator P_Zero
    else
    if !preExprTokens.d_LLPeano . [0] = 'S'
    then exprDefinator P_Succ
  | Times ->
    if !preExprTokens.d_LLPeano . [0] = 'Z'
    then exprDefinator T_Zero
    else
    if !preExprTokens.d_LLPeano . [0] = 'S'
    then exprDefinator T_Succ

let exprPlus =
  ()

let exprTimes =
  ()

let exprIs (l:string) (r:string) =
  ()

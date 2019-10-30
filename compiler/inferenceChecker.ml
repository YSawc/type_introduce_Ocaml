open WordParse
open PeanoDefinator

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


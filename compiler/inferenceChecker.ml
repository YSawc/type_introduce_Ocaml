open WordParse
open PeanoDefinator
open Calcurator

let inferenceChecker =
  (* FIXME: refactoring *)
  let pReadToken = !preExprTokens.d_LLPeano . [0] in
  function
  | Plus ->
    if pReadToken = 'Z'
    then exprDefinator P_Zero
    else
    if pReadToken = 'S'
    then exprDefinator P_Succ
  | Times ->
    if pReadToken = 'Z'
    then exprDefinator T_Zero
    else
    if pReadToken = 'S'
    then exprDefinator T_Succ


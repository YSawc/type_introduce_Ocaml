open WordParse
open PeanoDefinator

open InferenceChecker

type inferenceNode =
  { preExprTokens : preExprTokens_t
  ; leadingRule : exprDefinition
  }

let printTokensWithDef (expr:string) (def:string) =
  Printf.printf
    "%s%s%s%c%s%s%c%s"
    !_LLPeano expr !_LRPeano '=' !_RPeano "by" ' ' def

let exprDefinator = function
  | P_Zero ->
    if !_LRPeano <> !_RPeano
    then
      raise (Failure "Wrong peanos detected! Please put peanos proven true.")
    else
      ()
  | P_Succ ->
    _LLPeano := String.sub !_LLPeano 2 (!_LLPeano |> String.length);
    _RPeano := String.sub !_RPeano 2 (!_RPeano |> String.length);
    printTokensWithDef "plus" "P_Succ";
    Plus |> inferenceChecker
  | T_Zero ->
    if !_LLPeano <> !_RPeano
    then
      raise (Failure "Wrong peanos detected! Please put peanos proven true.")
    else
      ()
  | T_Succ -> ()

let exprPlus =
  ()

let exprTimes =
  ()

let exprIs (l:string) (r:string) =
  ()

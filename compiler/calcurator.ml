open WordParse
open PeanoDefinator

open InferenceChecker

let definitionNodeHash = object
  val mutable hash = Hashtbl.create 256

  method createNestHash (subscription:string) (tokens:string) =
    Hashtbl.add hash subscription tokens
end

let stack = object
  val mutable v = []

  method pop =
    match v with
    | hd :: tl ->
      v <- tl;
      Some hd
    | [] -> None

  method push hd =
    v <- hd :: v
end

type inferenceNode =
  { preExprTokens : preExprTokens_t
  ; leadingRule : exprDefinition
  }

let strViaTokensWithDef (expr:string) (def:string) string =
  !_LLPeano ^ " " ^ expr ^ " " ^ !_LRPeano ^ " = " ^ !_RPeano ^ " by " ^ def

let exprDefinator = function
  | P_Zero ->
    if !_LRPeano <> !_RPeano
    then
      raise (Failure "Wrong peanos detected! Please put peanos proven true.")
    else
      definitionNodeHash#createNestHash
        "", strViaTokensWithDef "plus" "P_Zero"
  | P_Succ ->
    _LLPeano := String.sub !_LLPeano 2 (!_LLPeano |> String.length);
    _RPeano := String.sub !_RPeano 2 (!_RPeano |> String.length);
    definitionNodeHash#createNestHash
      "", strViaTokensWithDef "plus" "P_Succ"
  | T_Zero ->
    if !_LLPeano <> !_RPeano
    then
      raise (Failure "Wrong peanos detected! Please put peanos proven true.")
    else
      definitionNodeHash#createNestHash
        "", strViaTokensWithDef "times" "T_Zero"
  | T_Succ ->
    definitionNodeHash#createNestHash
      "", strViaTokensWithDef "times" "T_Succ"

let exprPlus =
  ()

let exprTimes =
  ()

let exprIs (l:string) (r:string) =
  ()

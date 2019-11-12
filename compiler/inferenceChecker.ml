open WordParse
open PeanoDefinator
open Calcurator

let inferenceChecker = function
  | (Plus, 'Z') ->
    exprDefinator P_Zero
  | (Plus, 'S') ->
    exprDefinator P_Succ
  | (Plus, _) ->
    ()
  | (Times, 'Z') ->
    exprDefinator T_Zero
  | (Times, 'S') ->
    exprDefinator T_Succ
  | (Times, _) ->
    ()
